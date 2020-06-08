import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_gawlah/Tours/Tour_card.dart';

class Liked {
  final List <String> likedPlaces;
  final List <String> likedTours;
  final String userId;
 final String documentId;

  Liked({
    this.userId,
    this.likedPlaces,
    this.likedTours,
    this.documentId
   
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
     'likedPlaces':likedPlaces,
     'likedTours':likedTours,
     'documentId':documentId

  
    };
  }

  static Liked fromMap(Map<String, dynamic> map, String documentId) {
    if (map == null) return null;
  
  
    return Liked(
 likedPlaces: map['likedPlaces'],
 likedTours: map['likedTours'],
    // documentIdd:map['documentId'],
     userId: map['userId'],
     documentId: documentId,

    );

    
  }
}