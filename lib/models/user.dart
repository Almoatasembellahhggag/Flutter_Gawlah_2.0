import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/widgets.dart';

class User {
  final String id;
  final String fullName;
   final String email;
  final passwordController = TextEditingController();
  final String userRole;
   final List<String> likedtours;
 final List<String> likedplaces;
   final int review;
   final String addcomment;
  final String documentId;
final List<String> survey;
final String image;

  //String get emailAddress=>emailController.text;

  User({this.id, this.image,this.fullName, this.email,this.userRole,this.likedtours,this.likedplaces,this.review,this.addcomment,this.documentId,this.survey});

  User.fromData(Map<String, dynamic> data)
      : id = data['id'],
        fullName = data['fullName'],
        userRole = data['userRole'],
        likedtours=data['likedtours'],
        likedplaces=data['likedplaces'],
        addcomment=data['addcomment'],
        review=data['review'],
       documentId=data['document'],
       email=data['Email'],
       survey=data['survey'],
       image=data['image'];




        

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'userRole': userRole,
      'likedplaces':likedplaces,
      'likedtours':likedtours,
      'addcomment':addcomment,
      'review':review,
      'Email':email,
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
        likedtours:map['likedtours'],
        likedplaces:map['likedplaces'],
        addcomment:map['addcomment'],
        review:map['review'],
        documentId: documentId,
        email: map['Email'],
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
 final List<String> likedtours;
   final List<String> likedplaces;
   final int review;
   final String addcomment;
  final String documentId;
  final List<String>survey;
  final String image;
  UserData({this.id,this.fullName,this.image,this.userRole,this.likedtours,this.likedplaces,this.review,this.addcomment,this.documentId,this.survey});
}


