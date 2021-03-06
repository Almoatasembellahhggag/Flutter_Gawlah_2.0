import 'dart:async';
import 'dart:io' show Platform;
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gawlah/placecards/place_card.dart';
import 'package:google_map_polyline/google_map_polyline.dart';
import 'package:location/location.dart';
//import 'package:permission/permission.dart';
import 'package:toast/toast.dart';


import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlacePolylinePage extends StatelessWidget {
  const PlacePolylinePage(
      {Key key, this.height, this.width1, this.tourid, this.centre})
      : super(key: key);

  final GeoPoint centre;
  final double height;
  final int tourid;
  final double width1;
  


  @override
  Widget build(BuildContext context) {
    return PlacePolylineBody(
      centre: centre,
      tourid: tourid,
    );
  }
}

class PlacePolylineBody extends StatefulWidget {
  const PlacePolylineBody({
    Key key,
    this.tourid,
    this.centre,
  }) : super(key: key);

  final GeoPoint centre;
  final int tourid;

  @override
  State<StatefulWidget> createState() => PlacePolylineBodyState();
}

class PlacePolylineBodyState extends State<PlacePolylineBody>
    with TickerProviderStateMixin {
  PlacePolylineBodyState();

  bool nearbyactive = false;

  String activepolygon = 'a';
  String activeTag = 'all';
  GoogleMapController controller;
  final Firestore database = Firestore.instance;
  Stream Mapobjects;
  String mapstyle;
  List<int> nearby;
  Set<Polygon> polygons;
  Set<Marker> markers;
  Set<Polyline> polylines;
  Set<Circle> circles;
var currentLocation;
  Map<String, BitmapDescriptor> markers_icons;
double lat;
double lng;

  static const _intialPositionn1 = LatLng(30.041833166, 31.257332304);
  static const _intialPositionn2 = LatLng(30.0554905, 31.2634282);

  Completer<GoogleMapController> _controller = Completer();



  void initState() {
  //  getsomePoints();
    _getLocation();
     print(widget.tourid);
    print("objecthhhhhhhhhhhhhhhhhhhhhhh");
    markers_icons = new Map();
    BitmapDescriptor.fromAssetImage(ImageConfiguration(devicePixelRatio: .5),
            'images_and_icons/mamluks_marker.png')
        .then((onValue) {
      markers_icons['mamluk'] = onValue;
    });

        BitmapDescriptor.fromAssetImage(ImageConfiguration(devicePixelRatio: .5),
            'images_and_icons/fatimid_marker2.png')
        .then((onValue) {
      markers_icons['fatimid'] = onValue;
    });

    _queryDatabase();
    polygons = new Set();
    circles = {};
    polylines = new Set();
    markers = new Set();

    rootBundle.loadString('images_and_icons/mapstyle.txt').then((string) {
      mapstyle = string;
    });

    nearby = new List();

    super.initState();
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
         _controller.complete(controller);
    controller.setMapStyle(mapstyle);

//  polylines.add(Polyline(
//           polylineId: PolylineId('route1'),
//           visible: true,
//           points: routeCoords,
//           width: 4,
//           color: Colors.blue,
//           startCap: Cap.roundCap,
//           endCap: Cap.buttCap));


    });
 
   //getsomePoints();


   
  }

  void dispose() {
    super.dispose();
  }

  Future<void> gotoLocation(double lat, double long, double zoom) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(lat, long),
      zoom: zoom,
    )));
  }

  void _queryDatabase({String tag = 'all'}) {
    if (tag == 'all') {
      Query query = database.collection('polylines');
      Mapobjects = query
          .where("tours", arrayContains: widget.tourid)
          .snapshots()
          .map((list) => list.documents.map((doc) => doc.data));
    } else if (tag == 'nearby') {
      Query query = database
          .collection('polylines')
          .where("tours", arrayContains: widget.tourid)
          .where('id', whereIn: nearby);
      Mapobjects = query
          .snapshots()
          .map((list) => list.documents.map((doc) => doc.data));
    }
  }

  LatLng _createcentre(GeoPoint centre) {
    return new LatLng(centre.latitude, centre.longitude);
  }

  Set<Polygon> polygons_set(List polys, Set<Polygon> Polygons) {
    Polygons.clear();

    polys.forEach((PolyObj) {
      switch (PolyObj['type']) {
        case 'place':
          Polygons.add(Place(PolyObj['points'], PolyObj['name']));
          break;

        default:
          break;
      }
    });
debugPrint(Polygons.join(','));
    return Polygons;
  }


Set<Polyline> polylines_set(List polyys, Set<Polyline> Polyliness,Future<dynamic>route) {
    Polyliness.clear();


    polyys.forEach((PolyObj) {
      switch (PolyObj['type']) {
        case 'place':
                 
                  Polyliness.add(Route(PolyObj['center'], PolyObj['name']));
                  break;
        
                default:
                  break;
              }
    

  
    });
   //  return Polyliness;
print(Polyliness.elementAt(0).points);
return Polyliness;
  }

  Set<Marker> markers_set(List places, Set<Marker> Markers) {
    Markers.clear();

    places.forEach((PlaceObj) {
      switch (PlaceObj['type']) {
        case 'place':
          Markers.add(Marker(
              position: new LatLng((PlaceObj['center'] as GeoPoint).latitude,
                  (PlaceObj['center'] as GeoPoint).longitude),
              markerId: MarkerId(PlaceObj['name']),
              icon: markers_icons[PlaceObj['period']] as BitmapDescriptor));
          break;

        default:
          break;
      }
    });
    Markers.add(new Marker(
        markerId: MarkerId('reference point'),
        position: new LatLng(30.05297394610351, 31.262176036834717)));

    return Markers;
  }


  Polygon Place(List<dynamic> polylinePoints, String idd) {
    List<LatLng> latlngs = new List();
    polylinePoints.forEach((point) {
      latlngs.add(new LatLng(
          (point as GeoPoint).latitude, (point as GeoPoint).longitude));
    });

    return new Polygon(
      consumeTapEvents: false,
      polygonId: PolygonId(idd),
      fillColor: activepolygon == idd ? Colors.red : Colors.transparent,
      strokeColor: Colors.black,
      strokeWidth: 5,
      visible: activepolygon == idd ? true : false,

      points: latlngs,
    );
  }

_getLocation() async {
    var location=new Location();
    try {
    //  currentLocation = await location.getLocation();
        var pos = await location.getLocation();
               lat = pos.latitude;
 lng = pos.longitude;
      setState(
          () {

 debugPrint(lat.toString());
 debugPrint("LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD");

          }); //rebuild the widget after getting the current location of the user
    } on Exception {
      currentLocation = null;
    }
  }


  Polyline Route(GeoPoint polylinePoints, String idd) {
    List<LatLng> latlngs = new List();
    latlngs.add(new LatLng(polylinePoints.latitude,polylinePoints.longitude));
   latlngs.add(new LatLng(lat,lng));
  //  debugPrint(polylinePoints.join(','));
    debugPrint(latlngs.join(','));
   return new Polyline(
      //consumeTapEvents: false,
      polylineId: PolylineId(idd),
      color: Colors.greenAccent,
      width: 5,
       visible:activepolygon == idd ? true : false,
      points: latlngs,
      endCap: Cap.roundCap,
      startCap: Cap.roundCap,
    );

    
    
  }

  double calculateDistance(GeoPoint latlng1, GeoPoint latlng2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((latlng2.latitude - latlng1.latitude) * p) / 2 +
        c(latlng1.latitude * p) *
            c(latlng2.latitude * p) *
            (1 - c((latlng2.longitude - latlng1.longitude) * p)) /
            2;
    return 12742 * asin(sqrt(a));
  }

  void nearby_query(GeoPoint tour_centre, List placesList) {
    nearby.clear();

    placesList.forEach((place) {
      switch (place['type']) {
        case 'place':
          if (calculateDistance(tour_centre, place['center'] as GeoPoint) <

              1.2) {

            nearby.add(place['id']);
          }
          break;

        case 'route':
          nearby.add(place['id']);
          break;

        default:
          break;
      }
      setState(() {
        if (!nearbyactive) {
          nearbyactive = true;
        } else {
          nearbyactive = false;
        }
        if (nearbyactive) {
          circles.add(new Circle(
              circleId: CircleId('nearby'),
              center:
                  new LatLng(widget.centre.latitude, widget.centre.longitude),
              radius: 1200,
              fillColor: Colors.yellowAccent.withOpacity(0.14),
              strokeWidth: 2,
              strokeColor: Colors.red));
        }
      });
      gotoLocation((widget.centre).latitude, (widget.centre).longitude, 14.0);
      activepolygon = null;
      _queryDatabase(tag: 'nearby');

    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<Object>(
          stream: Mapobjects,
          builder: (context, AsyncSnapshot snapshot) {
            List slideList = snapshot.data.toList();
            return Stack(
              children: <Widget>[
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: GoogleMap(
                
                      myLocationEnabled: true,
                      minMaxZoomPreference: MinMaxZoomPreference(10, 18),
                      mapType: MapType.normal,
                      initialCameraPosition: new CameraPosition(
                      target: _createcentre(widget.centre), zoom: 15.5),
                      polygons: polygons_set(slideList, polygons),
                      polylines:polylines_set(slideList, polylines, getsomePoints()),

                      circles: circles,
                      onMapCreated: _onMapCreated,
                      markers: markers_set(slideList, markers),

                    ),
                  ),
                ),
                Positioned(
                  top: 250,
                  child: FloatingActionButton(
                      onPressed: () => nearby_query(widget.centre, slideList)),
                ),
                Positioned(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    bottom: 0,
                    child: PageView.builder(
                        physics: BouncingScrollPhysics(),
                        controller: PageController(
                            viewportFraction: 0.59, initialPage: 0),
                        onPageChanged: (int index) {
                          setState(() {
                            activepolygon = slideList[index]['name'];
                            gotoLocation(
                                ((slideList[index]['center']) as GeoPoint)
                                    .latitude,
                                ((slideList[index]['center']) as GeoPoint)
                                    .longitude,
                                18.0);
                          });
                        },
                        itemCount: slideList.length,
                        itemBuilder: (context, index){
                          {
                            if (slideList[index]['type'] == 'place') {
                              return PlaceCard(

                                h_ratio: MediaQuery.of(context).size.height*0.2,
                                w_ratio: MediaQuery.of(context).size.width*.5,
                                image: slideList[index]['image'],
                                name: slideList[index]['name'],
                                placetype: slideList[index]['placetype'],
                                info: slideList[index]['info'],
                                //vid: slideList[index]['vid'],
                                tourid:widget.tourid,

                                period:slideList[index]['period'],
                                center:slideList[index]['center'],

                              );
                            }
                          }
                        })),
              ],
            );
          }),
    );
  }
   List<LatLng> routeCoords;
  GoogleMapPolyline googleMapPolyline =
      new GoogleMapPolyline(apiKey: "AIzaSyBu80ekKNldo73k48QvOKrcZxPCyu8ehIM");
 getsomePoints() async {
    // var permissions =
    //     await Permission.getPermissionsStatus([PermissionName.Location]);
    // if (permissions[0].permissionStatus == PermissionStatus.notAgain) {
    //   // var askpermissions =
    //   //     await Permission.requestPermissions([PermissionName.Location]);
    // } else {
      routeCoords = await googleMapPolyline.getCoordinatesWithLocation(
          origin: LatLng(30.05297394610351, 31.262176036834717),
          destination: LatLng(30.786509, 31.000376),
          mode: RouteMode.driving);
          return routeCoords;
   // }
    
  }

}
