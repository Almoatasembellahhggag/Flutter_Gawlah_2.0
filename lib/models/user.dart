import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/widgets.dart';

class User {
  final String id;
  final String fullName;
   final String email;
  final passwordController = TextEditingController();
  final String userRole;
   final int review;
  final String documentId;
final List<String> survey;
final String image;

  //String get emailAddress=>emailController.text;

  User({this.id, this.image,this.fullName, this.email,this.userRole,this.review,this.documentId,this.survey});

  User.fromData(Map<String, dynamic> data)
      : id = data['id'],
        fullName = data['fullName'],
        userRole = data['userRole'],
        review=data['review'],
       documentId=data['document'],
       email=data['email'],
       survey=data['survey'],
       image=data['image'];




        

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'userRole': userRole,
      'review':review,
      'email':email,
      'image':image
     
    };
  }


  //   Map<String, dynamic> toMap() {
  //   return {
  //     'id':id,
  //     'likedplaces':likedplaces,
  //     'likedtours':likedtours,
  //     'addcomment':addcomment,
  //     'review':review
  //   };
  // }



  static User fromMap(Map<String, dynamic> map, String documentId) {
    if (map == null) return null;

    return User(
        id : map['id'],
        fullName : map['fullName'],
        userRole :map['userRole'],
        review:map['review'],
        documentId: documentId,
        email: map['email'],
        survey: map['survey'],
        image:map['image'],
        

        );
     // documentId: documentId,
    //);
  }
  

}
class UserData {
  final String id;
  final String fullName;
   final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final String userRole;

   final int review;
 
  final String documentId;
  final List<String>survey;
  final String image;
  UserData({this.id,this.fullName,this.image,this.userRole,this.review,this.documentId,this.survey});
}


