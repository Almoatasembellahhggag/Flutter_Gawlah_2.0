// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/foundation.dart';


// class Post {
//   //final String title;
//   final String imageUrl;
//   final String userId;
//   final String documentId;
//   final String liked;
//   final String description;
//   final String name;
//   final String image;
//   final GeoPoint center;
//   final String info;
//   final String rate;
//   final List<String>ids;
//   final List<String>tags;

//   Post({
//     this.tags,
//     this.rate,
//     this.info,
//     this.center,
//     this.ids,
//     this.image,
//    this.userId,
//    // @required this.title,
//     this.liked,
//     this.documentId,
//     this.name,
//     this.description,
//     this.imageUrl,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'image': image,
//       'description': description,
//       'name':name,
//       'rate':rate,
//       'info':info,
//       'ids':ids,
//       'tags':tags,
//       'center':center

//     };
//   }

//   static Post fromMap(Map<String, dynamic> map, String documentId) {
//     if (map == null) return null;

//     return Post(
   
//       description: map['description'],
//       name: map['name'],
//       image: map['image'],
//       rate: map['rate'],
//       info: map['info'],
//       ids:map['ids'],
//       tags:map['tags'],
//      center:map['center'],
//       documentId: documentId,
      
//     );
//   }
// // Map<String, dynamic> toJson() {
// //     return {
// //      'userid':userId,
// //      'name':name,
// //      'description':description,
// //      'image':image,
// //      'center':center,
    
     
// //     };
// //   }

// }


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_gawlah/Tours/Tour_card.dart';

class Post {
  final String tagss;
  final String name;
  final String imageUrl;
  final String userId;
  final String documentId;
  final String liked;
  final String description;
  final String image;
  final GeoPoint center;
  final String info;
  final String rate;
  final List<String>ids;
  final List<String>tags;
  final String idd;
  final String centerr;
  final int id;

  Post({
    this.id,
    this.centerr,
    this.tagss,
   this.userId,
    @required this.name,
    this.documentId,
    this.imageUrl,
    this.center,
   this.info,
   this.image,
   this.description,
   this.ids,
   this.liked,
   this.rate,
   this.tags,
   this.idd,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'name': name,
      'image': image,
      'description': description,
      'rate': rate,
      'info': info,
      'ids': ids,
      'tags': tags,
      'center': center,
      'idd':idd,
      'tagss':tagss,
      'centerr':centerr,
      'id':id,
      'documentId':documentId

  
    };
  }

  static Post fromMap(Map<String, dynamic> map, String documentId) {
    if (map == null) return null;
  
  
    return Post(
      name: map['name'],
      description: map['description'],
      info: map['info'],
       idd:map['idd'],
       tagss: map['tagss'],
       rate: map['rate'],
       id:map['id'],
       image: map['image'],
       centerr: map['centerr'],
    // documentIdd:map['documentId'],
     userId: map['userId'],
     documentId: documentId,

    );

    
  }
}
