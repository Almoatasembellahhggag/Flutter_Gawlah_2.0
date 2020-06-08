import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_gawlah/Tours/Tour_card.dart';

class Message {
  final String message;
  final String userId;
 final String documentId;
 final String timestamp;

 Message({
    this.userId,
    this.message,
    this.timestamp,
    this.documentId
   
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
     'message':message,
     'timestamp': FieldValue.serverTimestamp(),
     'documentId':documentId

  
    };
  }

  static Message fromMap(Map<String, dynamic> map, String documentId) {
    if (map == null) return null;
  
  
    return Message(
message: map['message'],
    // documentIdd:map['documentId'],
     userId: map['userId'],
     documentId: documentId,

    );

    
  }
}