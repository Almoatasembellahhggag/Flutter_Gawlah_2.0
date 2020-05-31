// import 'package:flutter/material.dart';

// import 'package:provider/provider.dart';
// import 'package:flutter_gawlah/models/user.dart';
// import 'constants.dart';
// import 'database.dart';
// import 'loading.dart';

// class SettingsForm extends StatefulWidget {
//   @override
//   _SettingsFormState createState() => _SettingsFormState();
// }

// class _SettingsFormState extends State<SettingsForm> {

//   final _formKey = GlobalKey<FormState>();
//   final List<String> liked = ['0', '1', '2', '3', '4'];
//   final List<int> review = [100, 200, 300, 400, 500, 600, 700, 800, 900];

//   // form values
//   String _currentName;
//   String _currentliked;
//   int _currentreview;
//   String  _currentMail;

// String _currentRole;

//   String _currentlikep;

// String _currentadd;

//   @override
//   Widget build(BuildContext context) {

//     User user;

//     return MaterialApp(home:
         
//           Scaffold(
//                       body: StreamBuilder<UserData>(
//         stream: DatabaseService(id: user.id).userData,
//         builder: (context, snapshot) {
//             if(snapshot.hasData){
//               UserData userData = snapshot.data;
//               return Form(
//                 key: _formKey,
//                 child: Column(
//                   children: <Widget>[
//                     // Text(
//                     //   'Update your brew settings.',
//                     //   style: TextStyle(fontSize: 18.0),
//                     // ),
//                     SizedBox(height: 20.0),
//                     TextFormField(
//                       initialValue: userData.fullName,
//                       decoration: textInputDecoration,
//                       validator: (val) => val.isEmpty ? 'Please enter a name' : null,
//                       onChanged: (val) => setState(() => _currentName = val),
//                     ),

//                     SizedBox(
//                       height: 20,
//                     ),
//                        TextFormField(
//                       initialValue: userData.fullName,
//                       decoration: textInputDecoration,
//                       validator: (val) => val.isEmpty ? 'Please enter a email' : null,
//                       onChanged: (val) => setState(() => _currentMail = val),
//                     ),
                    

//               //       SizedBox(height: 10.0),
//               //       DropdownButtonFormField(
//               //         value: _currentliked ?? userData.liked,
//               //         decoration: textInputDecoration,
//               //         items: liked.map((liked) {
//               //           return DropdownMenuItem(
//               //             value:liked,
//               //             child: Text('$liked sugars'),
//               //           );
//               //         }).toList(),
//               //         onChanged: (val) => setState(() => _currentliked = val ),
//               //       ),
//               //       SizedBox(height: 10.0),
//               //       Slider(
//               //         value: (_currentreview ?? userData.review).toDouble(),
//               //         activeColor: Colors.brown[_currentreview ?? userData.review],
//               //         inactiveColor: Colors.brown[_currentreview ?? userData.review],
//               //         min: 100.0,
//               //         max: 900.0,
//               //         divisions: 8,
//               //         onChanged: (val) => setState(() => _currentreview = val.round()),
//               //       ),
//                     RaisedButton(
//                       color: Colors.pink[400],
//                       child: Text(
//                         'Update',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                       onPressed: () async {
//                         if(_formKey.currentState.validate()){
//                           await DatabaseService(id: user.id).updateUserData(
//                             _currentliked ?? snapshot.data.likedtours, 
//                             _currentName ?? snapshot.data.fullName, 
//                             _currentreview ?? snapshot.data.review,
//                             _currentRole??snapshot.data.userRole,
//                             _currentlikep??snapshot.data.likedplaces,
//                             _currentadd??snapshot.data.addcomment

//                           );
//                           Navigator.pop(context);
//                         }
//                       }
//                     ),
//                   ],
//                 ),
//               );
//             } else {
//               return Loading();
//             }
//         }
//       ),
//           ),
//     );
//   }
// }