import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_gawlah/locator.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_gawlah/models/user.dart';
import 'package:flutter_gawlah/services/firestore_service.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirestoreService _firestoreService = locator<FirestoreService>();

  User _currentUser;
  User get currentUser => _currentUser;

  Future loginWithEmail({
    @required String email,
    @required String password,
   String fullName,
   List<String> likedtours,
   List<String>  likedplaces,
    int review,
    String addcomment,
    String image
  }) async {
    try {
      var authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await populateCurrentUser(authResult.user);
      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }

  Tourpage(){
    return _currentUser.image;

  }

  Future signUpWithEmail({
    @required String email,
    @required String password,
    @required String fullName,
    @required String role,
    String image,
  List<String> likedtours,
List<String> likedplaces,
    int review,
    String addcomment,
    List<String>survey,

  }) async {
    try {
      var authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // create a new user profile on firestore
      _currentUser = User(
        id: authResult.user.uid,
       fullName: fullName,
        userRole: role,
        likedplaces:likedplaces,
        likedtours:likedtours,
        review:review,
        addcomment:addcomment,
        email: email,
        survey: survey,
        image: image,
      
      );

      await _firestoreService.createUser(_currentUser);

      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }

  Future signOut() async {
    try {
      return await _firebaseAuth.signOut();
    } catch (e) {
      return e.toString();
    }
  }

  Future<bool> isUserLoggedIn() async {
    var user = await _firebaseAuth.currentUser();
    await populateCurrentUser(user);
    return user != null;
  }

  Future populateCurrentUser(FirebaseUser user) async {
    if (user != null) {
      _currentUser = await _firestoreService.getUser(user.uid);
    }
  }
}
