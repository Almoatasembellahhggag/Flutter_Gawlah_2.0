// import 'auth.dart';
// import 'constants.dart';
// import 'loading.dart';
// import 'package:flutter/material.dart';

// class Register extends StatefulWidget {

//   final Function toggleView;
//   Register({ this.toggleView });

//   @override
//   _RegisterState createState() => _RegisterState();
// }

// class _RegisterState extends State<Register> {

//   final AuthService _auth = AuthService();
//   final _formKey = GlobalKey<FormState>();
//   String error = '';
//   bool loading = false;

//   // text field state
//   String email = '';
//   String password = '';

//   @override
//   Widget build(BuildContext context) {
//     return loading ? Loading() : Scaffold(
//       backgroundColor: Colors.blue[300],
//       appBar: AppBar(
//         backgroundColor: Colors.blue[900],
//         elevation: 0.0,
//         title: Text('Sign up to and enjoy your Gawlah'),
//         actions: <Widget>[
//           FlatButton.icon(
//             icon: Icon(Icons.person),
//             label: Text('Sign In'),
//             onPressed: () => widget.toggleView(),
//           ),
//         ],
//       ),
//       body: Container(
//         padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: <Widget>[
//               SizedBox(height: 20.0),
//               TextFormField(
//                 decoration: textInputDecoration.copyWith(hintText: 'email'),
// //                 validator: (val) => val.isEmpty ? 'Enter an email' : null,
// //                 onChanged: (val) {
// //                   setState(() => email = val);
// //                 },
// //               ),
// //               SizedBox(height: 20.0),
// //               TextFormField(
// //                 decoration: textInputDecoration.copyWith(hintText: 'password'),
// //                 obscureText: true,
// //                 validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
// //                 onChanged: (val) {
// //                   setState(() => password = val);
// //                 },
// //               ),
// //               SizedBox(height: 20.0),
// //               RaisedButton(
// //                 color: Colors.pink[400],
// //                 child: Text(
// //                   'Register',
// //                   style: TextStyle(color: Colors.white),
// //                 ),
// //                 onPressed: () async {
// //                   if(_formKey.currentState.validate()){
// //                     setState(() => loading = true);
// //                     dynamic result = await _auth.registerWithEmailAndPassword(email, password);
// //                     if(result == null) {
// //                       setState(() {
// //                         loading = false;
// //                         error = 'Please supply a valid email';
// //                       });
// //                     }
// //                   }
// //                 }
// //               ),
// //               SizedBox(height: 12.0),
// //               Text(
// //                 error,
// //                 style: TextStyle(color: Colors.red, fontSize: 14.0),
// //               )
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }


// import 'package:flutter/material.dart';


// import 'usermanagment.dart';

// import 'package:firebase_auth/firebase_auth.dart';

// class SignupPage extends StatefulWidget {
//   @override
//   _SignupPageState createState() => _SignupPageState();
// }

// class _SignupPageState extends State<SignupPage> {
//   String _email;
//   String _password;

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//         body: Center(
//       child: Container(
//           padding: EdgeInsets.all(25.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               TextField(
//                   decoration: InputDecoration(hintText: 'Email'),
//                   onChanged: (value) {
//                     setState(() {
//                       _email = value;
//                     });
//                   }),
//               SizedBox(height: 15.0),
//               TextField(
//                   decoration: InputDecoration(hintText: 'Password'),
//                   onChanged: (value) {
//                     setState(() {
//                       _password = value;
//                     });
//                   }),
//               SizedBox(height: 20.0),
//               RaisedButton(
//                 child: Text('Sign Up'),
//                 color: Colors.blue,
//                 textColor: Colors.white,
//                 elevation: 7.0,
//                 onPressed: () {
//                   FirebaseAuth.instance
//                       .createUserWithEmailAndPassword(
//                           email: _email, password: _password)
//                       .then((signedInUser) {
//                     UserManagement().storeNewUser(signedInUser, context);
//                   }).catchError((e) {
//                     print(e);
//                   });
//                 },
//               ),
//             ],
//           )),
//     ));
//   }
// }