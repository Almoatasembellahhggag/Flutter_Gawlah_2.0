
// import 'package:flutter/material.dart';
// import 'package:flutter_gawlah/settings_form.dart';
// import 'package:provider/provider.dart';

// import 'auth.dart';
// import 'brew.dart';
// import 'brew_list.dart';
// import 'database.dart';

// class Home extends StatelessWidget {

//   final AuthService _auth = AuthService();

//   @override
//   Widget build(BuildContext context) {

//     void _showSettingsPanel() {
//       showModalBottomSheet(context: context, builder: (context) {
//         return Container(
//           padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
//           child: SettingsForm(),
//         );
//       });
//     }

//     return StreamProvider<List<Brew>>.value(
//       value: DatabaseService().brews,
//       child: Scaffold(
//         backgroundColor: Colors.blue[500],
//         appBar: AppBar(
//           title: Text('User profile'),
//           backgroundColor: Colors.blue[900],
//           elevation: 0.0,
//           actions: <Widget>[
//             FlatButton.icon(
//               icon: Icon(Icons.person),
//               label: Text('logout'),
//               onPressed: () async {
//                 await _auth.signOut();
//               },
//             ),
//             FlatButton.icon(
//               icon: Icon(Icons.settings),
//               label: Text('settings'),
//               onPressed: () => _showSettingsPanel(),
//             )
//           ],
//         ),
//         body: Container(
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage('images_and_icons/g_transparent.png'),
//               fit: BoxFit.cover,
//             ),
//           ),
//           child: BrewList()
//         ),
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';

// import 'package:firebase_auth/firebase_auth.dart';

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//         appBar: new AppBar(
//           title: new Text('Dashboard'),
//           centerTitle: true,
//         ),
//         body: Center(
//           child: Container(
//             child: new Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 new Text('You are now logged in'),
//                 SizedBox(
//                   height: 15.0,
//                 ),
//                 new OutlineButton(
//                   borderSide: BorderSide(
//                       color: Colors.red, style: BorderStyle.solid, width: 3.0),
//                   child: Text('Logout'),
//                   onPressed: () {
//                     FirebaseAuth.instance.signOut().then((value) {
//                       Navigator
//                           .of(context)
//                           .pushReplacementNamed('/landingpage');
//                     }).catchError((e) {
//                       print(e);
//                     });
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ));
//   }
// }



import 'auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('You are logged in'),
          SizedBox(height: 10.0),
          RaisedButton(
            onPressed: () {
              AuthService().signOut();
            },
            child: Center(
              child: Text('Sign out'),
            ),
            color: Colors.red,
          )
        ],
      ),
    );
  }
}