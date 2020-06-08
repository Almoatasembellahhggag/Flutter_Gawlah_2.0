import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/services.dart';
import 'package:flutter_gawlah/models/message.dart';

import 'package:flutter_gawlah/models/place.dart';
import 'package:flutter_gawlah/models/post.dart';
import 'package:flutter_gawlah/models/user.dart';

class FirestoreService {
  final CollectionReference _usersCollectionReference =
      Firestore.instance.collection('Users');
  final CollectionReference _postsCollectionReference =
      Firestore.instance.collection('tours');
        final CollectionReference _postsCollectionReferenceplace =
      Firestore.instance.collection('polylines');

  final StreamController<List<Post>> _postsController =
      StreamController<List<Post>>.broadcast();
 final StreamController<List<Place>> _postsControllerplace =
      StreamController<List<Place>>.broadcast();
      
  final StreamController<List<User>> _postsControllerUser =
      StreamController<List<User>>.broadcast();


  Future createUser(User user) async {
    try {
      await _usersCollectionReference.document(user.id).setData(user.toJson());
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  Future getUser(String uid) async {
    try {
      var userData = await _usersCollectionReference.document(uid).get();
      return User.fromData(userData.data);
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  Future addPost(Post post) async {
    try {
      await  Firestore.instance.collection('tours').add(post.toMap());
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

    Future addMessage(Message post) async {
    try {
      await  Firestore.instance.collection('messages').add(post.toMap());
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  Future addPlace(Place place) async {
    try {
      await  Firestore.instance.collection('polylines').add(place.toMap());
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }


  
  

  Future getPostsOnceOff() async {
    try {
      var postDocumentSnapshot = await   Firestore.instance.collection('tours').getDocuments();
      if (postDocumentSnapshot.documents.isNotEmpty) {
        return postDocumentSnapshot.documents
            .map((snapshot) => Post.fromMap(snapshot.data, snapshot.documentID))
            .where((mappedItem) => mappedItem.name != null)
            .toList();
      }
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }
    Future getPostsOnceOffPlace() async {
    try {
      var postDocumentSnapshot = await   Firestore.instance.collection('polylines').getDocuments();
      if (postDocumentSnapshot.documents.isNotEmpty) {
        return postDocumentSnapshot.documents
            .map((snapshot) => Place.fromMap(snapshot.data, snapshot.documentID))
            .where((mappedItem) => mappedItem.name != null)
            .toList();
      }
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  Stream listenToPostsRealTime() {
    // Register the handler for when the posts data changes
   Firestore.instance.collection('tours').snapshots().listen((postsSnapshot) {
      if (postsSnapshot.documents.isNotEmpty) {
        var posts = postsSnapshot.documents
            .map((snapshot) => Post.fromMap(snapshot.data, snapshot.documentID))
            .where((mappedItem) => mappedItem.name != null)
            .toList();

        // Add the posts onto the controller
        _postsController.add(posts);
      }
    });

    return _postsController.stream;
  }



    Stream listenToPostsRealTimePlaces() {
    // Register the handler for when the posts data changes
   Firestore.instance.collection('polylines').snapshots().listen((postsSnapshot) {
      if (postsSnapshot.documents.isNotEmpty) {
        var posts = postsSnapshot.documents
            .map((snapshot) => Place.fromMap(snapshot.data, snapshot.documentID))
            .where((mappedItem) => mappedItem.name != null)
            .toList();

        // Add the posts onto the controller
        _postsControllerplace.add(posts);
      }
    });

    return _postsControllerplace.stream;
  }

  Future deletePost(String documentId) async {
    await   Firestore.instance.collection('tours').document(documentId).delete();
  }


  Future deletePostPlace(String documentId) async {
    await   Firestore.instance.collection('polylines').document(documentId).delete();
  }

  Future updatePost(Post post) async {
    try {
      await 
            Firestore.instance.collection('tours').document(post.documentId).updateData(post.toMap());
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }
    Future updatePostPlace(Place place) async {
    try {
      await 
            Firestore.instance.collection('polylines').document(place.documentId).updateData(place.toMap());
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }


     

   Future updatePosttt(User user) async {
    try {
      await 
            Firestore.instance.collection('Users').document(user.id)
          .updateData(user.toJson());
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }


  
  Future addPosttt(User user) async {
    try {
      var userdoc=await _usersCollectionReference.document(user.id).get();
      var dox=userdoc.documentID;
      await _usersCollectionReference.document(dox).setData({
      'id':user.id,
      'fullName': user.fullName, 
      'userRole': user.userRole,
      'likedplaces':user.likedplaces,
      'addcomment':user.addcomment,
      'review':user.review,
     // 'email':user.email,
      'likedtours': user.likedtours,
      'survey':user.survey,
      'image':user.image,
      });

    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }


    Future getUseroffposts() async {
    try {
      var postDocumentSnapshot = await   Firestore.instance.collection('Users').getDocuments();
      if (postDocumentSnapshot.documents.isNotEmpty) {
        return postDocumentSnapshot.documents
            .map((snapshot) => User.fromMap(snapshot.data, snapshot.documentID))
            .where((mappedItem) => mappedItem.fullName != null)
            .toList();
      }
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

    Stream getUserlistentoRealTime() {
    // Register the handler for when the posts data changes
      Firestore.instance.collection('Users').snapshots().listen((postsSnapshot) {
      if (postsSnapshot.documents.isNotEmpty) {
        var posts = postsSnapshot.documents
            .map((snapshot) => User.fromMap(snapshot.data, snapshot.documentID))
            .where((mappedItem) => mappedItem.fullName != null)
            .toList();

        // Add the posts onto the controller
        _postsControllerUser.add(posts);
      }
    });

    return _postsControllerUser.stream;
  }
}

