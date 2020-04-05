// import 'package:flutter_gawlah/Tours_Pager.dart';

// import 'wrapper.dart';
// import 'auth.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'user.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return StreamProvider<User>.value(
//       value: AuthService().user,
//       child: MaterialApp(
//         home: TourList2(),
//       ),
//     );
//   }
// }


// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_gawlah/location.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'map_pin_pill.dart';
// import 'pin_pill_info.dart';
// import 'package:geolocator/geolocator.dart';

// const double CAMERA_ZOOM = 16;
// const double CAMERA_TILT = 80;
// const double CAMERA_BEARING = 30;
// //const LatLng SOURCE_LOCATION = loc()
// const LatLng DEST_LOCATION = LatLng(29.9660428,31.2703326);
import 'package:flutter/material.dart';

import 'package:flutter_gawlah/map_pin_pill.dart';
import 'package:flutter_gawlah/pin_pill_info.dart';


import 'dart:async';

// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class loc extends StatelessWidget{

  

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Container(child: Text(locateUser().toString(),
//         style: TextStyle(
//                     fontSize: 37, color: Colors.red
          
//         )

//         )
//         )
       
     
//     );
  
//   }
//    locateUser() {
    
//     return Geolocator()
//         .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
//         .then((location) {
//       if (location != null) {
//         LatLng(location.latitude, location.longitude);
//         print("Location: ${location.latitude},${location.longitude}");

//       }
//       return  new LatLng(location.latitude, location.longitude);
//     });
//   }
  
  
//   }
// void main() =>
//     runApp(MaterialApp(debugShowCheckedModeBanner: false, home: loc()));
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart' show Geolocator, LocationAccuracy;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' hide LocationAccuracy;
import 'package:flutter/material.dart';
import 'dart:async';




const double CAMERA_ZOOM = 16;
const double CAMERA_TILT = 80;
const double CAMERA_BEARING = 30;


const LatLng SOURCE_LOCATION= LatLng(29.961978,31.303188);

const LatLng DEST_LOCATION = LatLng(29.962696,31.276942);

void main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MapPage()));

class MapPage extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
//    var currloc;
//   LatLng loc(){
  
//    Geolocator()
//         .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
//         .then((location) {
//       if (location != null) {
//         setState(() {
//           currloc=location;
      
//         });
//          new LatLng(location.latitude, location.longitude);
//        print("Location: ${location.latitude},${location.longitude}");

//       }
//       return  new LatLng(location.latitude, location.longitude);
   
 
   
//    });
//    return  new LatLng(currloc.latitude, currloc.longitude);
   

// }

  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = Set<Marker>();
// for my drawn routes on the map
  Set<Polyline> _polylines = Set<Polyline>();
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints;
  String googleAPIKey = 'AIzaSyBu80ekKNldo73k48QvOKrcZxPCyu8ehIM';
// for my custom marker pins
  BitmapDescriptor sourceIcon;
  BitmapDescriptor destinationIcon;
// the user's initial location and current location
// as it moves
  LocationData currentLocation;
// a reference to the destination location
  LocationData destinationLocation;
// wrapper around the location API
  Location location;
  double pinPillPosition = -100;
  PinInformation currentlySelectedPin = PinInformation(
      pinPath: '',
      avatarPath: '',
      location: LatLng(0, 0),
      locationName: '',
      labelColor: Colors.grey);
  PinInformation sourcePinInfo;
  PinInformation destinationPinInfo;

  @override
  void initState() {
    super.initState();

    // create an instance of Location
    location = new Location();
    polylinePoints = PolylinePoints();

    // subscribe to changes in the user's location
    // by "listening" to the location's onLocationChanged event
    location.onLocationChanged().listen((LocationData cLoc) {
      // cLoc contains the lat and long of the
      // current user's position in real time,
      // so we're holding on to it
      currentLocation = cLoc;
      updatePinOnMap();
    });
    // set custom marker pins
    setSourceAndDestinationIcons();
    // set the initial location
    setInitialLocation();
  }

  void setSourceAndDestinationIcons() async {
    sourceIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5), 'assets/driving_pin.png');

    destinationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5),
        'assets/destination_map_marker.png');
  }

  void setInitialLocation() async {
    // set the initial location by pulling the user's
    // current location from the location's getLocation()
    currentLocation = await location.getLocation();

    // hard-coded destination for this example
    destinationLocation = LocationData.fromMap({
      "latitude": DEST_LOCATION.latitude,
      "longitude": DEST_LOCATION.longitude
    });
  }

  @override
  Widget build(BuildContext context) {
      print(SOURCE_LOCATION);
    CameraPosition initialCameraPosition = CameraPosition(
        zoom: CAMERA_ZOOM,
        tilt: CAMERA_TILT,
        bearing: CAMERA_BEARING,
        target: SOURCE_LOCATION);
    if (currentLocation != null) {
      initialCameraPosition = CameraPosition(
          target: LatLng(currentLocation.latitude, currentLocation.longitude),
          zoom: CAMERA_ZOOM,
          tilt: CAMERA_TILT,
          bearing: CAMERA_BEARING);
    }
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
              myLocationEnabled: true,
              compassEnabled: true,
              tiltGesturesEnabled: false,
              markers: _markers,
              polylines: _polylines,
              mapType: MapType.normal,
              initialCameraPosition: initialCameraPosition,
              onTap: (LatLng loc) {
                pinPillPosition = -100;
              },
              onMapCreated: (GoogleMapController controller) {
                controller.setMapStyle(Utils.mapStyles);
                _controller.complete(controller);
                // my map has completed being created;
                // i'm ready to show the pins on the map
                showPinsOnMap();
              }),
          MapPinPillComponent(
              pinPillPosition: pinPillPosition,
              currentlySelectedPin: currentlySelectedPin)
        ],
      ),
    );
  }



  void showPinsOnMap() {
    // get a LatLng for the source location
    // from the LocationData currentLocation object
    var pinPosition =
        LatLng(currentLocation.latitude, currentLocation.longitude);
    // get a LatLng out of the LocationData object
    var destPosition =
        LatLng(destinationLocation.latitude, destinationLocation.longitude);

    sourcePinInfo = PinInformation(
        locationName: "Start Location",
        location: SOURCE_LOCATION,
        pinPath: "assets/driving_pin.png",
        avatarPath: "assets/friend1.jpg",
        labelColor: Colors.blueAccent);

    destinationPinInfo = PinInformation(
        locationName: "End Location",
        location: DEST_LOCATION,
        pinPath: "assets/destination_map_marker.png",
        avatarPath: "assets/friend2.jpg",
        labelColor: Colors.purple);

    // add the initial source location pin
    _markers.add(Marker(
        markerId: MarkerId('sourcePin'),
        position: pinPosition,
        onTap: () {
          setState(() {
            currentlySelectedPin = sourcePinInfo;
            pinPillPosition = 0;
          });
        },
        icon: sourceIcon));
    // destination pin
    _markers.add(Marker(
        markerId: MarkerId('destPin'),
        position: destPosition,
        onTap: () {
          setState(() {
            currentlySelectedPin = destinationPinInfo;
            pinPillPosition = 0;
          });
        },
        icon: destinationIcon));
    // set the route lines on the map from source to destination
    // for more info follow this tutorial
    setPolylines();
  }

  void setPolylines() async {
    List<PointLatLng> result = await polylinePoints.getRouteBetweenCoordinates(
        googleAPIKey,
        currentLocation.latitude,
        currentLocation.longitude,
        destinationLocation.latitude,
        destinationLocation.longitude);

    if (result.isNotEmpty) {
      result.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });

      setState(() {
        _polylines.add(Polyline(
            width: 5, // set the width of the polylines
            polylineId: PolylineId("poly"),
            color: Color.fromARGB(255, 40, 122, 198),
            points: polylineCoordinates));
      });
    }
  }

  void updatePinOnMap() async {
    // create a new CameraPosition instance
    // every time the location changes, so the camera
    // follows the pin as it moves with an animation
    CameraPosition cPosition = CameraPosition(
      zoom: CAMERA_ZOOM,
      tilt: CAMERA_TILT,
      bearing: CAMERA_BEARING,
      target: LatLng(currentLocation.latitude, currentLocation.longitude),
    );
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(cPosition));
    // do this inside the setState() so Flutter gets notified
    // that a widget update is due
    setState(() {
      // updated position
      var pinPosition =
          LatLng(currentLocation.latitude, currentLocation.longitude);

      sourcePinInfo.location = pinPosition;

      // the trick is to remove the marker (by id)
      // and add it again at the updated location
      _markers.removeWhere((m) => m.markerId.value == 'sourcePin');
      _markers.add(Marker(
          markerId: MarkerId('sourcePin'),
          onTap: () {
            setState(() {
              currentlySelectedPin = sourcePinInfo;
              pinPillPosition = 0;
            });
          },
          position: pinPosition, // updated position
          icon: sourceIcon));
    });
  }

 locateUser() {
     Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((location) {
      if (location != null) {
       return new LatLng(location.latitude, location.longitude);
        

      }
      return new LatLng(location.latitude, location.longitude);
    
    });
  }

  
}

class Utils {
  static String mapStyles = '''[
  {
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#f5f5f5"
      }
    ]
  },
  {
    "elementType": "labels.icon",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#616161"
      }
    ]
  },
  {
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#f5f5f5"
      }
    ]
  },
  {
    "featureType": "administrative.land_parcel",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#bdbdbd"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#eeeeee"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#e5e5e5"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#ffffff"
      }
    ]
  },
  {
    "featureType": "road.arterial",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#dadada"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#616161"
      }
    ]
  },
  {
    "featureType": "road.local",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  },
  {
    "featureType": "transit.line",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#e5e5e5"
      }
    ]
  },
  {
    "featureType": "transit.station",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#eeeeee"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#c9c9c9"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  }
]''';
}













// class MapPage extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => MapPageState();
// }

// class MapPageState extends State<MapPage> {
//   Completer<GoogleMapController> _controller = Completer();
//   Set<Marker> _markers = Set<Marker>();
// // for my drawn routes on the map
//   Set<Polyline> _polylines = Set<Polyline>();
//   List<LatLng> polylineCoordinates = [];
//   PolylinePoints polylinePoints;
//   String googleAPIKey = 'AIzaSyBu80ekKNldo73k48QvOKrcZxPCyu8ehIM';
// // for my custom marker pins
//   BitmapDescriptor sourceIcon;
//   BitmapDescriptor destinationIcon;
// // the user's initial location and current location
// // as it moves
//   LocationData currentLocation;
// // a reference to the destination location
//   LocationData destinationLocation;
// // wrapper around the location API
//   Location location;
//   double pinPillPosition = -100;
 
//   PinInformation currentlySelectedPin = PinInformation(
//       pinPath: '',
//       avatarPath: '',
//       location: LatLng(0, 0),
//       locationName: '',
//       labelColor: Colors.grey);
//   PinInformation sourcePinInfo;
//   PinInformation destinationPinInfo;

//   @override
//   void initState() {
//     super.initState();

//     // create an instance of Location
//     location = new Location();
//     polylinePoints = PolylinePoints();

//     // subscribe to changes in the user's location
//     // by "listening" to the location's onLocationChanged event
//     location.onLocationChanged().listen((LocationData cLoc) {
//       // cLoc contains the lat and long of the
//       // current user's position in real time,
//       // so we're holding on to it
//       currentLocation = cLoc;
//       updatePinOnMap();
//     });
//     // set custom marker pins
//     setSourceAndDestinationIcons();
//     // set the initial location
//     setInitialLocation();
//   }

//   void setSourceAndDestinationIcons() async {
//     sourceIcon = await BitmapDescriptor.fromAssetImage(
//         ImageConfiguration(devicePixelRatio: 2.5), 'images_and_icons/ic_distance.png');

//     destinationIcon = await BitmapDescriptor.fromAssetImage(
//         ImageConfiguration(devicePixelRatio: 2.5),
//         'images_and_icons/ic_distance.png');
//   }

//   void setInitialLocation() async {
//     // set the initial location by pulling the user's
//     // current location from the location's getLocation()
//     currentLocation = await location.getLocation();

//     // hard-coded destination for this example
//     destinationLocation = LocationData.fromMap({
//       "latitude": DEST_LOCATION.latitude,
//       "longitude": DEST_LOCATION.longitude
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     CameraPosition initialCameraPosition = CameraPosition(
//         zoom: CAMERA_ZOOM,
//         tilt: CAMERA_TILT,
//         bearing: CAMERA_BEARING,
//         target: SOURCE_LOCATION);
//     if (currentLocation != null) {
//       initialCameraPosition = CameraPosition(
//           target: LatLng(currentLocation.latitude, currentLocation.longitude),
//           zoom: CAMERA_ZOOM,
//           tilt: CAMERA_TILT,
//           bearing: CAMERA_BEARING);
//     }
//     return Scaffold(
//       body: Stack(
//         children: <Widget>[
//           GoogleMap(
//               myLocationEnabled: true,
//               compassEnabled: true,
//               tiltGesturesEnabled: false,
//               markers: _markers,
//               polylines: _polylines,
//               mapType: MapType.normal,
//               initialCameraPosition: initialCameraPosition,
//               onTap: (LatLng loc) {
//                 pinPillPosition = -100;
//               },
//               onMapCreated: (GoogleMapController controller) {
//                 controller.setMapStyle(Utils.mapStyles);
//                 _controller.complete(controller);
//                 // my map has completed being created;
//                 // i'm ready to show the pins on the map
//                 showPinsOnMap();
//               }),
//           MapPinPillComponent(
//               pinPillPosition: pinPillPosition,
//               currentlySelectedPin: currentlySelectedPin)
//         ],
//       ),
//     );
//   }

//   void showPinsOnMap() {
//     // get a LatLng for the source location
//     // from the LocationData currentLocation object
//     var pinPosition =
//         LatLng(currentLocation.latitude, currentLocation.longitude);
//     // get a LatLng out of the LocationData object
//     var destPosition =
//         LatLng(destinationLocation.latitude, destinationLocation.longitude);

//     sourcePinInfo = PinInformation(
//         locationName: "Start Location",
//         location: SOURCE_LOCATION,
//         pinPath: "images_and_icons/ic_distance.png",
//         avatarPath: "images_and_icons/moon.png",
//         labelColor: Colors.blueAccent);

//     destinationPinInfo = PinInformation(
//         locationName: "End Location",
//         location: DEST_LOCATION,
//         pinPath: "images_and_icons/ic_distance.png",
//         avatarPath: "images_and_icons/ic_moon.png",
//         labelColor: Colors.purple);

//     // add the initial source location pin
//     _markers.add(Marker(
//         markerId: MarkerId('sourcePin'),
//         position: pinPosition,
//         onTap: () {
//           setState(() {
//             currentlySelectedPin = sourcePinInfo;
//             pinPillPosition = 0;
//           });
//         },
//         icon: sourceIcon));
//     // destination pin
//     _markers.add(Marker(
//         markerId: MarkerId('destPin'),
//         position: destPosition,
//         onTap: () {
//           setState(() {
//             currentlySelectedPin = destinationPinInfo;
//             pinPillPosition = 0;
//           });
//         },
//         icon: destinationIcon));
//     // set the route lines on the map from source to destination
//     // for more info follow this tutorial
//     setPolylines();
//   }

//   void setPolylines() async {
//     List<PointLatLng> result = await polylinePoints.getRouteBetweenCoordinates(
//         googleAPIKey,
//         currentLocation.latitude,
//         currentLocation.longitude,
//         destinationLocation.latitude,
//         destinationLocation.longitude);

//     if (result.isNotEmpty) {
//       result.forEach((PointLatLng point) {
//         polylineCoordinates.add(LatLng(point.latitude, point.longitude));
//       });

//       setState(() {
//         _polylines.add(Polyline(
//             width: 5, // set the width of the polylines
//             polylineId: PolylineId("poly"),
//             color: Color.fromARGB(255, 40, 122, 198),
//             points: polylineCoordinates));
//       });
//     }
//   }

//   void updatePinOnMap() async {
//     // create a new CameraPosition instance
//     // every time the location changes, so the camera
//     // follows the pin as it moves with an animation
//     CameraPosition cPosition = CameraPosition(
//       zoom: CAMERA_ZOOM,
//       tilt: CAMERA_TILT,
//       bearing: CAMERA_BEARING,
//       target: LatLng(currentLocation.latitude, currentLocation.longitude),
//     );
//     final GoogleMapController controller = await _controller.future;
//     controller.animateCamera(CameraUpdate.newCameraPosition(cPosition));
//     // do this inside the setState() so Flutter gets notified
//     // that a widget update is due
//     setState(() {
//       // updated position
//       var pinPosition =
//           LatLng(currentLocation.latitude, currentLocation.longitude);

//       sourcePinInfo.location = pinPosition;

//       // the trick is to remove the marker (by id)
//       // and add it again at the updated location
//       _markers.removeWhere((m) => m.markerId.value == 'sourcePin');
//       _markers.add(Marker(
//           markerId: MarkerId('sourcePin'),
//           onTap: () {
//             setState(() {
//               currentlySelectedPin = sourcePinInfo;
//               pinPillPosition = 0;
//             });
//           },
//           position: pinPosition, // updated position
//           icon: sourceIcon));
//     });
//   }
// }

// class Utils {
//   static String mapStyles = '''[
//   {
//     "elementType": "geometry",
//     "stylers": [
//       {
//         "color": "#f5f5f5"
//       }
//     ]
//   },
//   {
//     "elementType": "labels.icon",
//     "stylers": [
//       {
//         "visibility": "off"
//       }
//     ]
//   },
//   {
//     "elementType": "labels.text.fill",
//     "stylers": [
//       {
//         "color": "#616161"
//       }
//     ]
//   },
//   {
//     "elementType": "labels.text.stroke",
//     "stylers": [
//       {
//         "color": "#f5f5f5"
//       }
//     ]
//   },
//   {
//     "featureType": "administrative.land_parcel",
//     "elementType": "labels.text.fill",
//     "stylers": [
//       {
//         "color": "#bdbdbd"
//       }
//     ]
//   },
//   {
//     "featureType": "poi",
//     "elementType": "geometry",
//     "stylers": [
//       {
//         "color": "#eeeeee"
//       }
//     ]
//   },
//   {
//     "featureType": "poi",
//     "elementType": "labels.text.fill",
//     "stylers": [
//       {
//         "color": "#757575"
//       }
//     ]
//   },
//   {
//     "featureType": "poi.park",
//     "elementType": "geometry",
//     "stylers": [
//       {
//         "color": "#e5e5e5"
//       }
//     ]
//   },
//   {
//     "featureType": "poi.park",
//     "elementType": "labels.text.fill",
//     "stylers": [
//       {
//         "color": "#9e9e9e"
//       }
//     ]
//   },
//   {
//     "featureType": "road",
//     "elementType": "geometry",
//     "stylers": [
//       {
//         "color": "#ffffff"
//       }
//     ]
//   },
//   {
//     "featureType": "road.arterial",
//     "elementType": "labels.text.fill",
//     "stylers": [
//       {
//         "color": "#757575"
//       }
//     ]
//   },
//   {
//     "featureType": "road.highway",
//     "elementType": "geometry",
//     "stylers": [
//       {
//         "color": "#dadada"
//       }
//     ]
//   },
//   {
//     "featureType": "road.highway",
//     "elementType": "labels.text.fill",
//     "stylers": [
//       {
//         "color": "#616161"
//       }
//     ]
//   },
//   {
//     "featureType": "road.local",
//     "elementType": "labels.text.fill",
//     "stylers": [
//       {
//         "color": "#9e9e9e"
//       }
//     ]
//   },
//   {
//     "featureType": "transit.line",
//     "elementType": "geometry",
//     "stylers": [
//       {
//         "color": "#e5e5e5"
//       }
//     ]
//   },
//   {
//     "featureType": "transit.station",
//     "elementType": "geometry",
//     "stylers": [
//       {
//         "color": "#eeeeee"
//       }
//     ]
//   },
//   {
//     "featureType": "water",
//     "elementType": "geometry",
//     "stylers": [
//       {
//         "color": "#c9c9c9"
//       }
//     ]
//   },
//   {
//     "featureType": "water",
//     "elementType": "labels.text.fill",
//     "stylers": [
//       {
//         "color": "#9e9e9e"
//       }
//     ]
//   }
// ]''';




// }




















// import 'package:flutter/material.dart';
// import 'package:google_map_polyline/google_map_polyline.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:permission/permission.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final Set<Polyline> polyline = {};

//   GoogleMapController _controller;
//   List<LatLng> routeCoords;
//   GoogleMapPolyline googleMapPolyline =
//       new GoogleMapPolyline(apiKey: "AIzaSyBu80ekKNldo73k48QvOKrcZxPCyu8ehIM");

//   getsomePoints() async {
//     var permissions =
//         await Permission.getPermissionsStatus([PermissionName.Location]);
//     if (permissions[0].permissionStatus == PermissionStatus.notAgain) {
//       var askpermissions =
//           await Permission.requestPermissions([PermissionName.Location]);
//     } else {
//       routeCoords = await googleMapPolyline.getCoordinatesWithLocation(
//           origin: LatLng(40.6782, -73.9442),
//           destination: LatLng(40.6944, -73.9212),
//           mode: RouteMode.driving);
//     }
//   }

//   // getaddressPoints() async {
//   //   routeCoords = await googleMapPolyline.getPolylineCoordinatesWithAddress(
//   //           origin: '55 Kingston Ave, Brooklyn, NY 11213, USA',
//   //           destination: '178 Broadway, Brooklyn, NY 11211, USA',
//   //           mode: RouteMode.driving);
//   // }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     // getaddressPoints();
//     getsomePoints();

//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: GoogleMap(
//       onMapCreated: onMapCreated,
//       polylines: polyline,
//       initialCameraPosition:
//           CameraPosition(target: LatLng(40.6782, -73.9442), zoom: 14.0),
//       mapType: MapType.normal,
//     ));
//   }

//   void onMapCreated(GoogleMapController controller) {
//     setState(() {
//       _controller = controller;

//       polyline.add(Polyline(
//           polylineId: PolylineId('route1'),
//           visible: true,
//           points: routeCoords,
//           width: 4,
//           color: Colors.blue,
//           startCap: Cap.roundCap,
//           endCap: Cap.buttCap));
//     });
//   }
// }













// import 'package:flutter/material.dart';
// import 'package:flutter_gawlah/Rating.dart';
// import 'package:flutter_gawlah/Register.dart';
// import 'package:flutter_gawlah/auth.dart';
// import 'package:flutter_gawlah/sign_in.dart';

// import 'grid.dart';
// import 'sign_in.dart';
// import 'vedio.dart';
// import 'package:provider/provider.dart';
// import 'Tours_Pager.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'auth.dart';
// import 'wrapper.dart';
// import 'user.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return StreamProvider<User>.value(
//         value: AuthService().user,
//         child: MaterialApp(title: 'Flutter Gawlah', home: SignIn()));

//   }
// }
// import 'package:flutter/material.dart';
// import 'package:ola_like_country_picker/ola_like_country_picker.dart';
// import 'package:ola_like_country_picker/src/country_picker.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);
//   final String title;
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   CountryPicker c;
//   Country country = Country.fromJson(countryCodes[94]);

//   @override
//   void initState() {
//     super.initState();
//     c = CountryPicker(onCountrySelected: (Country country) {
//       print(country);
//       setState(() {
//         this.country = country;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       child: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image:
//                 AssetImage(country.flagUri, package: 'ola_like_country_picker'),
//           ),
//         ),
//       ),
//       onTap: () {
//         c.launch(context);
//       },
//     );
//   }
// }