// import 'user.dart';
// import 'database.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class AuthService {

//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   // create user obj based on firebase user
//   User _userFromFirebaseUser(FirebaseUser user) {
//     return user != null ? User(uid: user.uid) : null;
//   }

//   // auth change user stream
//   Stream<User> get user {
//     return _auth.onAuthStateChanged
//       //.map((FirebaseUser user) => _userFromFirebaseUser(user));
//       .map(_userFromFirebaseUser);
//   }

//   // sign in anon
//   Future signInAnon() async {
//     try {
//       AuthResult result = await _auth.signInAnonymously();
//       FirebaseUser user = result.user;
//       return _userFromFirebaseUser(user);
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//   }

//   // sign in with email and password
//   Future signInWithEmailAndPassword(String email, String password) async {
//     try {
//       AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
//       FirebaseUser user = result.user;
//       return user;
//     } catch (error) {
//       print(error.toString());
//       return null;
//     } 
//   }

//   // register with email and password
//   Future registerWithEmailAndPassword(String email, String password) async {
//     try {
//       AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
//       FirebaseUser user = result.user;
//       // create a new document for the user with the uid
//       await DatabaseService(uid: user.uid).updateUserData('yes','dina', 5,'dina.mahfouz@outlook.com');
//       return _userFromFirebaseUser(user);
//     } catch (error) {
//       print(error.toString());
//       return null;
//     } 
//   }

//   // sign out
//   Future signOut() async {
//     try {
//       return await _auth.signOut();
//     } catch (error) {
//       print(error.toString());
//       return null;
//     }
//   }

// }

import 'package:firebase_auth/firebase_auth.dart';
import 'home.dart';
import 'loginpage.dart';
import 'package:flutter/material.dart';

class AuthService {
  //Handle Authentication
  handleAuth() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomePage();
        } else {
          return LoginPage();
        }
      },
    );
  }

  //Sign Out
  signOut() {
    FirebaseAuth.instance.signOut();
  }

  //Sign in
  signIn(email, password) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((user) {
      print('Signed in');
    }).catchError((e) {
      print(e);
    });
  }
}