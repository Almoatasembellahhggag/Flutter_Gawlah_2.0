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
//         home: Wrapper(),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_map_polyline/google_map_polyline.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission/permission.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Set<Polyline> polyline = {};

  GoogleMapController _controller;
  List<LatLng> routeCoords;
  GoogleMapPolyline googleMapPolyline =
      new GoogleMapPolyline(apiKey: "AIzaSyBu80ekKNldo73k48QvOKrcZxPCyu8ehIM");

  getsomePoints() async {
    var permissions =
        await Permission.getPermissionsStatus([PermissionName.Location]);
    if (permissions[0].permissionStatus == PermissionStatus.notAgain) {
      var askpermissions =
          await Permission.requestPermissions([PermissionName.Location]);
    } else {
      routeCoords = await googleMapPolyline.getCoordinatesWithLocation(
          origin: LatLng(40.6782, -73.9442),
          destination: LatLng(40.6944, -73.9212),
          mode: RouteMode.driving);
    }
  }

  // getaddressPoints() async {
  //   routeCoords = await googleMapPolyline.getPolylineCoordinatesWithAddress(
  //           origin: '55 Kingston Ave, Brooklyn, NY 11213, USA',
  //           destination: '178 Broadway, Brooklyn, NY 11211, USA',
  //           mode: RouteMode.driving);
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getaddressPoints();
    getsomePoints();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GoogleMap(
      onMapCreated: onMapCreated,
      polylines: polyline,
      initialCameraPosition:
          CameraPosition(target: LatLng(40.6782, -73.9442), zoom: 14.0),
      mapType: MapType.normal,
    ));
  }

  void onMapCreated(GoogleMapController controller) {
    setState(() {
      _controller = controller;

      polyline.add(Polyline(
          polylineId: PolylineId('route1'),
          visible: true,
          points: routeCoords,
          width: 4,
          color: Colors.blue,
          startCap: Cap.roundCap,
          endCap: Cap.buttCap));
    });
  }
}













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