import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gawlah/services/navigation_service.dart';
import 'package:flutter_gawlah/ui/views/create_post_view.dart';
import 'package:flutter_gawlah/ui/views/shaklbas.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'locator.dart';

class MapsDemo extends StatefulWidget {
  final String image;
  final String name ;

  const MapsDemo({Key key, this.image,this.name}) : super(key: key);
  @override
   _MapsDemoState createState() => _MapsDemoState();
}

class _MapsDemoState extends State<MapsDemo> {
  //
    final NavigationService _navigationService = locator<NavigationService>();
  Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center = const LatLng(30.0432583,31.2325889);
  final Set<Marker> _markers = {};
  LatLng _lastMapPosition = _center;
  MapType _currentMapType = MapType.normal;
  GeoPoint _last;

  static final CameraPosition _position1 = CameraPosition(
    bearing: 192.833,
    target: LatLng(30.0432583,31.2325889),
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

  _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId(_lastMapPosition.toString()),
          position: _lastMapPosition,
          infoWindow: InfoWindow(
            title: 'This is a Title',
            snippet: 'This is a snippet',
          ),
          icon: BitmapDescriptor.defaultMarker,
        ),
      );

     // Navigator.push(context, MaterialPageRoute(builder:(context)=>CreatePostView(center:_lastMapPosition,image: widget.image,)));
   //debugPrint(imageString+"PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP");
   _last= new GeoPoint(_lastMapPosition.latitude, _lastMapPosition.longitude);
      print("MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM");
      print(_lastMapPosition);
         print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
      print(widget.image);
     // Navigator.pop(context);
    });
  }

  // Widget button(Function function, IconData icon) {
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
  button(Function function,IconData icon){
    return FloatingActionButton(
      onPressed: function,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      backgroundColor: Colors.blue,
      child: Icon(
        icon,
        size: 36.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("Choose your tour location"),
            backgroundColor: Colors.blue,
          ),
          body: Stack(
            children: <Widget>[
              GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 11.0,
                ),
                mapType: _currentMapType,
                markers: _markers,
                onCameraMove: _onCameraMove,
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Column(
                    children: <Widget>[
                      RaisedButton(onPressed:()=> {Navigator.push(context, MaterialPageRoute(builder:(context)=>CreatePostView(center:_last,image: widget.image,name:widget.name))),
                     // Shaklbas(center:_lastMapPosition)
                      
                      
                      },
                      child:Text("Done"),
                      ),
                      //button(_onMapTypeButtonPressed, Icons.map),
                      SizedBox(
                        height: 16.0,
                      ),
                      button(_onAddMarkerButtonPressed, Icons.add_location),
                      SizedBox(
                        height: 16.0,
                      ),

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
}