import 'dart:async';
import 'dart:io' show Platform;
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_gawlah/map_widgets/placecard.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlacePolylinePage extends StatelessWidget {
  const PlacePolylinePage(
      {Key key, this.height, this.width1, this.tour_id, this.centre})
      : super(key: key);

  final double height;
  final double width1;
  final int tour_id;
  final GeoPoint centre;

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

  final int tour_id;
  final GeoPoint centre;

  @override
  State<StatefulWidget> createState() => PlacePolylineBodyState();
}

class PlacePolylineBodyState extends State<PlacePolylineBody>
    with TickerProviderStateMixin {
  String mapstyle;
  PlacePolylineBodyState();

  String activepolygon = 'a';
  String activeTag = 'all';
  GoogleMapController controller;
  final Firestore database = Firestore.instance;

  Stream Mapobjects;
  Set<Polygon> polygons;
  Set<Polyline> polylines;

  Completer<GoogleMapController> _controller = Completer();

  void initState() {
    Query query = database.collection('polylines');
    Mapobjects = query
        .where("tours", arrayContains: widget.tour_id)
        .snapshots()
        .map((list) => list.documents.map((doc) => doc.data));

    polygons = new Set();
    polylines = new Set();
    rootBundle.loadString('images_and_icons/nightmode.txts').then((string) {
      mapstyle = string;
    });

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
    } else {
      Query query =
          database.collection('polylines').where('building', isEqualTo: tag);
      Mapobjects = query
          .snapshots()
          .map((list) => list.documents.map((doc) => doc.data));
    }

    setState(() {
      activeTag = tag;
    });
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
      width: 4,
      visible: true,
      points: latlngs,
    );
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
                    ),
                  ),
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
