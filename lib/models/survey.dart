import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_gawlah/Tours/Tour_card.dart';

class Survey {
  final List <String>  survey;
  final String userId;
 final String documentId;
 final String timestamp;
 final String fullName;


 Survey({
    this.userId,
    this.survey,
    this.timestamp,
    this.documentId,
    this.fullName,

  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
     'survey':survey,
     //'timestamp': FieldValue.serverTimestamp(),
     'documentId':documentId,
     'fullName':fullName,
     'timestamp': FieldValue.serverTimestamp(),


  
    };
  }

  static Survey fromMap(Map<String, dynamic> map, String documentId) {
    if (map == null) return null;
  
  
    return Survey(
survey: map['survey'],
    // documentIdd:map['documentId'],
     userId: map['userId'],
     fullName: map['fullName'],
     documentId: documentId,

    );

    
  }
}