


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_gawlah/Tours/Tour_card.dart';

class Place {
  final String type;
  final String name;
  final String documentId;
  final String userId;
  final GeoPoint center;
  final String centerr;
  final String image;
  final String idd;
  final int id;
  final Map info;
  final String infoo;
  final String period;
  final String placetype;
  final String pointss;
  final List<GeoPoint> points;
  final String tourss;
  final List<int>tours;





  Place({
    this.tours,
    this.idd,
    this.image,
    this.info,
    this.tourss,
    this.pointss,
    this.points,
    this.placetype,
    this.period,
    this.center,
    this.centerr,
    this.id,
    this.infoo,
    this.type,
   this.documentId,
    @required this.name, this.userId,

  });

  Map<String, dynamic> toMap() {
    return {
     'userId':userId,
      'name': name,
      'infoo':infoo,
      'center':center,
      'idd':idd,
      'id':id,
      "centerr":centerr,
      "placetype":placetype,
      "period":period,
      "pointss":pointss,
      "points":points,
      "image":image,
      'tours':tours,
      'tourss':tourss,
      "info":info,
     
      'type': type,
    
  
    };
  }

  static Place fromMap(Map<String, dynamic> map, String documentId) {
    if (map == null) return null;
  
  
    return Place(
    name: map['name'],
    type: map['type'],
    userId: map['userId'],
    period: map['period'],
    infoo: map['infoo'],
    idd:map['idd'],
    tourss: map['tourss'],
    pointss:map['pointss'] ,
    placetype: map['placetype'],
    id:map['id'],
    image: map['image'],
    centerr: map['centerr'],
    documentId: documentId,

    );

    
  }
}
