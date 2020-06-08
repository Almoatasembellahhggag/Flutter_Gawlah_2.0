import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gawlah/services/navigation_service.dart';
import 'package:flutter_gawlah/ui/shared/ui_helpers.dart';
import 'package:flutter_gawlah/ui/views/create_post_view.dart';
import 'package:flutter_gawlah/ui/views/create_post_view_places.dart';
import 'package:flutter_gawlah/ui/views/shaklbas.dart';
import 'package:flutter_gawlah/ui/widgets/textlink1.dart';
import 'package:flutter_gawlah/verticalspacer.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'locator.dart';

class MapsPlace extends StatefulWidget {
  final String image;
  final String name;

  const MapsPlace({Key key, this.image, this.name}) : super(key: key);
  @override
  _MapsPlaceState createState() => _MapsPlaceState();
}

class _MapsPlaceState extends State<MapsPlace> {
  //
 ArgumentCallback<LatLng> onTap;
  final NavigationService _navigationService = locator<NavigationService>();
  Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center = const LatLng(30.0432583, 31.2325889);
  final Set<Marker> _markers = {};
  LatLng _lastMapPosition = _center;
  MapType _currentMapType = MapType.normal;
  GeoPoint _last;
  var input=6;
  GoogleMapController o;
  List<GeoPoint> pos =new List<GeoPoint>();
  LatLng _latLng = _center;
  LatLng neww;
  int i = 0;
int x=0;
  static final CameraPosition _position1 = CameraPosition(
    bearing: 192.833,
    target: LatLng(30.0432583, 31.2325889),
    tilt: 59.440,
    zoom: 11.0,
  );

  Future<void> _goToPosition1() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_position1));
  }

  _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  // button(Function function, IconData icon) {
  //   return FloatingActionButton(
  //     onPressed: function,
  //     materialTapTargetSize: MaterialTapTargetSize.padded,
  //     backgroundColor: Colors.blue,
  //     child: Icon(
  //       icon,
  //       size: 36.0,
  //     ),
  //   );
  // }
 _handleTap(LatLng point) {
   neww=point;
    pos.insert(i,
           new GeoPoint(point.latitude,point.latitude));
    i++;
setState(() {
  if(x==0){
  _markers.add(Marker(
    markerId: MarkerId(point.toString()),
    position: point,
  //  draggable: true,
    infoWindow: InfoWindow(
      title: 'I am a marker',
    ),
    icon:
        BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
  ));}
  else{
     _markers.add(Marker(
    markerId: MarkerId(point.toString()),
    position: point,
  //  draggable: true,
    infoWindow: InfoWindow(
      title: 'I am a marker',
    ),
    icon:
        BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
  ));

  }
  x++;
 _last =
          new GeoPoint(point.latitude, point.longitude);
        
          print(_last);
          print(point.latitude.toString());
          print(point.longitude.toString());
          print(pos.toString());
          print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
});
}


  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: Scaffold(
      
        body: 
        Column(
      
          children: <Widget>[
         verticalSpaceMedium,
         Text(
            'Set the place location',
            style: TextStyle(fontSize: 40,fontFamily: "DancingScript",color: Color.fromRGBO(38, 47, 62, 1),fontWeight: FontWeight.bold)),
         Text("       Make sure to add the place exact location ",style: TextStyle(color:Colors.grey,fontWeight: FontWeight.bold),),
         Text("    and its polygon shape on the map.",style: TextStyle(color:Colors.grey,fontWeight: FontWeight.bold),),

          verticalSpaceMedium,
               Container(
                 height: 500,
                 width: MediaQuery.of(context).size.width,
                 child: GoogleMap(
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: _center,
                      zoom: 11.0,
                    ),
                    mapType: _currentMapType,
                    markers: _markers,
                    onCameraMove: _onCameraMove,
                    onTap: _handleTap,
                   // onLongPress:_handledoubleTap ,
                    
                  ),
               ),
             
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: <Widget>[
                    
               TextLink1(
                        "Press me when you are done",onPressed:()=>Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CreatePlaceView(
                                    center: _last,
                                    pos: pos,
                                    image: widget.image,
                                    name: widget.name))),
                        ),
                    
                    //button(_onMapTypeButtonPressed, Icons.map),
                    // SizedBox(
                    //   height: 16.0,
                    // ),
                   // button(_onAddMarkerButtonPressed, Icons.add_location),
                    // SizedBox(
                    //   height: 16.0,
                    // ),

                    //  button(_goToPosition1, Icons.location_searching),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // changepostogeo(List<LatLng>pos){


  // }
}
