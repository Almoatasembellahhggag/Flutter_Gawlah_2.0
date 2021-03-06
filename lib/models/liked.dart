import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_gawlah/Tours/Tour_card.dart';

class Liked {
  final List <String> likedPlaces;
  final List <String> likedTours;
  final String userId;
 final String documentId;
 final String fullName;
 final String timestamp;

  Liked({
    this.userId,
    this.likedPlaces,
    this.likedTours,
    this.documentId,
    this.fullName,
    this.timestamp,
   
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
     'likedPlaces':likedPlaces,
     'likedTours':likedTours,
     'documentId':documentId,
     'fullName':fullName,
     'timestamp':FieldValue.serverTimestamp(),

  
    };
  }

  static Liked fromMap(Map<String, dynamic> map, String documentId) {
    if (map == null) return null;
  
  
    return Liked(
 likedPlaces: map['likedPlaces'],
 likedTours: map['likedTours'],
    // documentIdd:map['documentId'],
     userId: map['userId'],
     fullName: map['fullName'],
     documentId: documentId,

    );

    
  }
}