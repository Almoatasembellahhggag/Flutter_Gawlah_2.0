import 'package:flutter/foundation.dart';


class Post {
  final String title;
  final String imageUrl;
  final String userId;
  final String documentId;
  final String liked;

  Post({
    @required this.userId,
    @required this.title,
    this.liked,
    this.documentId,
    this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'liked':liked,
      'userId': userId,
      'title': title,
      'imageUrl': imageUrl,
    };
  }

  static Post fromMap(Map<String, dynamic> map, String documentId) {
    if (map == null) return null;

    return Post(
      title: map['title'],
      imageUrl: map['imageUrl'],
      userId: map['userId'],
      liked:map['liked'],
      documentId: documentId,
    );
  }
}