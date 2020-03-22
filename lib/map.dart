  
import 'dart:async';
import 'dart:io' show Platform;
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toast/toast.dart';

import 'place_card.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlacePolylinePage extends StatelessWidget {
  const PlacePolylinePage(
      {Key key, this.height, this.width1, this.tour_id, this.centre})
      : super(key: key);

  final GeoPoint centre;
  final double height;
  final int tour_id;
  final double width1;

  @override
  Widget build(BuildContext context) {
    return PlacePolylineBody(
      centre: centre,
      tour_id: tour_id,
    );
  }
}

class PlacePolylineBody extends StatefulWidget {
  const PlacePolylineBody({
    Key key,
    this.tour_id,
    this.centre,
  }) : super(key: key);

  final GeoPoint centre;
  final int tour_id;

  @override
  State<StatefulWidget> createState() => PlacePolylineBodyState();
}

class PlacePolylineBodyState extends State<PlacePolylineBody>
    with TickerProviderStateMixin {
  PlacePolylineBodyState();

  String activepolygon = 'a';
  String activeTag = 'all';
  GoogleMapController controller;
  final Firestore database = Firestore.instance;
  Stream Mapobjects;
  String mapstyle;
  List<int> nearby;
  Set<Polygon> polygons;
  Set<Polyline> polylines;

  static const _intialPositionn1 = LatLng(30.041833166, 31.257332304);
  static const _intialPositionn2 = LatLng(30.0554905, 31.2634282);

  Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> _markers = {
    new Marker(markerId: MarkerId('reference point'),position: new LatLng(30.05297394610351, 31.262176036834717))
  };

  void initState() {
    _queryDatabase();
    polygons = new Set();
    polylines = new Set();
    rootBundle.loadString('images_and_icons/mapstyle.txt').then((string) {
      mapstyle = string;
    });

    nearby = new List();

    super.initState();
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
    controller.setMapStyle(mapstyle);
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
          .where("tours", arrayContains: widget.tour_id)
          .snapshots()
          .map((list) => list.documents.map((doc) => doc.data));
    } else if (tag == 'nearby') {
      Query query = database
          .collection('polylines')
          .where("tours", arrayContains: widget.tour_id)
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

    return Polygons;
  }

  Set<Polyline> polylines_set(List polyys, Set<Polyline> Polylines) {
    Polylines.clear();

    polyys.forEach((PolyObj) {
      switch (PolyObj['type']) {
        case 'route':
          Polylines.add(Route(PolyObj['points'], PolyObj['name']));
          break;

        default:
          break;
      }
    });

    return Polylines;
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
      visible: true,
      points: latlngs,
    );
  }

  Polyline Route(List<dynamic> polylinePoints, String idd) {
    List<LatLng> latlngs = new List();
    polylinePoints.forEach((point) {
      latlngs.add(new LatLng(
          (point as GeoPoint).latitude, (point as GeoPoint).longitude));
    });

    return new Polyline(
      consumeTapEvents: false,
      polylineId: PolylineId(idd),
      color: Colors.greenAccent,
      width: 3,
      visible: true,
      points: latlngs,
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
              1) {
            nearby.add(place['id']);
          }
          break;

        case 'route':
          nearby.add(place['id']);
          break;

        default:
          break;
      }
      _queryDatabase(tag: 'nearby');
      setState(() {});
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
                      minMaxZoomPreference: MinMaxZoomPreference(14, 18),
                      mapType: MapType.normal,
                      initialCameraPosition: new CameraPosition(
                          target: _createcentre(widget.centre), zoom: 15.5),
                      polygons: polygons_set(slideList, polygons),
                      polylines: polylines_set(slideList, polylines),
                      onMapCreated: _onMapCreated,
                      markers: _markers,
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
                        itemBuilder: (context, index) {
                          {
                            if (slideList[index]['type'] == 'place') {
                              return PlaceCard(
                                image: slideList[index]['image'],
                                name: slideList[index]['name'],
                                placetype: slideList[index]['placetype'],
                                info: slideList[index]['info'],
                                vid: slideList[index]['vid'],
                                
                              );
                            }
                          }
                        })),
              ],
            );
          }),
    );
  }
}