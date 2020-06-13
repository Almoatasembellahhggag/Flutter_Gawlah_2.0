import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gawlah/constants/route_names.dart';
import 'package:flutter_gawlah/locator.dart';
import 'package:flutter_gawlah/models/liked.dart';
import 'package:flutter_gawlah/models/post.dart';
import 'package:flutter_gawlah/models/user.dart';
import 'package:flutter_gawlah/services/authentication_service.dart';
import 'package:flutter_gawlah/services/dialog_service.dart';
import 'package:flutter_gawlah/services/firestore_service.dart';
import 'package:flutter_gawlah/services/navigation_service.dart';
import 'package:flutter_gawlah/ui/views/shaklbas.dart';
import 'package:flutter_gawlah/view_models.dart/base_model.dart';

class LikedViewModel extends BaseModel {
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();
 final AuthenticationService _authenticationService =
   locator<AuthenticationService>();
   List<String> liked;
  User _edittingPost;

  bool get _editting => _edittingPost != null;

   likedtours(String name) async {
      DocumentSnapshot ds =
          await Firestore.instance.collection('Users').document(_authenticationService.currentUser.fullName).get();
    liked=ds.data['survey'];
     
     return ds.data['survey'];
    }


  Future addPost({@required List<String>likedtours}) async {
    setBusy(true);

    var result;

    if (!_editting) {
      result = 
     await _firestoreService
        .addLiked(Liked(fullName: currentUser.fullName,userId: currentUser.id,likedTours: likedtours));
    } else {
      result = await _firestoreService.updatePosttt(User(
      //  likedtours: likedtours,
        id: _edittingPost.id,
        
      //  docume: _edittingPost.documentId,
      ));
   }

    setBusy(false);

    if (result is List<String>) {
      await _dialogService.showDialog(
        title: 'Cound not create post',
        //description: result,
      );
    } else {
      await _dialogService.showDialog(
        title: 'Post successfully Added',
        description: 'Your post has been created',
      );
    }

 // _navigationService.navigateTo(TourList2Route);
  }

  void setEdittingPost(User edittingPost) {
    _edittingPost = edittingPost;
  }

  
}