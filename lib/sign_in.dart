  
// import 'auth.dart';
// import 'constants.dart';
// import 'loading.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_gawlah/auth.dart';

// class SignIn extends StatefulWidget {

//   final Function toggleView;
//   SignIn({ this.toggleView });

//   @override
//   _SignInState createState() => _SignInState();
// }

// class _SignInState extends State<SignIn> {

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
//         title: Text('Sign in and enjoy your Gawlah'),
//         actions: <Widget>[
//           FlatButton.icon(
//             icon: Icon(Icons.person),
//             label: Text('Register'),
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
//                 validator: (val) => val.isEmpty ? 'Enter an email' : null,
//                 onChanged: (val) {
//                   setState(() => email = val);
//                 },
//               ),
//               SizedBox(height: 20.0),
//               TextFormField(
//                 obscureText: true,
//                 decoration: textInputDecoration.copyWith(hintText: 'password'),
//                 validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
//                 onChanged: (val) {
//                   setState(() => password = val);
//                 },
//               ),
//               SizedBox(height: 20.0),
//               RaisedButton(
//                 color: Colors.pink[400],
//                 child: Text(
//                   'Sign In',
//                   style: TextStyle(color: Colors.white),
//                 ),
//                 onPressed: () async {
//                   if(_formKey.currentState.validate()){
//                     setState(() => loading = true);
//                     dynamic result = await _auth.signInWithEmailAndPassword(email, password);
//                     if(result == null) {
//                       setState(() {
//                         loading = false;
//                         error = 'Could not sign in with those credentials';
//                       });
//                     }
//                   }
//                 }
//               ),
//               SizedBox(height: 12.0),
//               Text(
//                 error,
//                 style: TextStyle(color: Colors.red, fontSize: 14.0),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// final FirebaseAuth _auth = FirebaseAuth.instance;
// final GoogleSignIn googleSignIn = GoogleSignIn();

// String name;
// String email;
// String imageUrl;

// Future<String> signInWithGoogle() async {
//   final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
//   final GoogleSignInAuthentication googleSignInAuthentication =
//       await googleSignInAccount.authentication;

//   final AuthCredential credential = GoogleAuthProvider.getCredential(
//     accessToken: googleSignInAuthentication.accessToken,
//     idToken: googleSignInAuthentication.idToken,
//   );

//   final AuthResult authResult = await _auth.signInWithCredential(credential);
//   final FirebaseUser user = authResult.user;

//   // Checking if email and name is null
//   assert(user.email != null);
//   assert(user.displayName != null);
//   assert(user.photoUrl != null);

//   name = user.displayName;
//   email = user.email;
//   imageUrl = user.photoUrl;
//   print(email);

//   // Only taking the first part of the name, i.e., First Name
//   if (name.contains(" ")) {
//     name = name.substring(0, name.indexOf(" "));
//     print(name);
//   }

//   assert(!user.isAnonymous);
//   assert(await user.getIdToken() != null);

//   final FirebaseUser currentUser = await _auth.currentUser();
//   assert(user.uid == currentUser.uid);

//   return 'signInWithGoogle succeeded: $user';
// }

// void signOutGoogle() async {
//   await googleSignIn.signOut();

//   print("User Sign Out");
// }