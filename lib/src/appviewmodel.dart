
import 'package:flutter/foundation.dart';
import 'package:flutter_gawlah/constants/route_names.dart';
import 'package:flutter_gawlah/locator.dart';
import 'package:flutter_gawlah/models/post.dart';
import 'package:flutter_gawlah/models/survey.dart';
import 'package:flutter_gawlah/models/user.dart';
import 'package:flutter_gawlah/services/dialog_service.dart';
import 'package:flutter_gawlah/services/firestore_service.dart';
import 'package:flutter_gawlah/services/navigation_service.dart';

import 'package:flutter_gawlah/view_models.dart/base_model.dart';

class AppViewModel extends BaseModel {
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  User _edittingPost;

  bool get _editting => _edittingPost != null;

  Future addPost({@required List<String>survey}) async {
    setBusy(true);

    var result;

    if (!_editting) {
      result = 
     await _firestoreService
        .addSurvey(Survey(survey: survey,userId: currentUser.id,fullName: currentUser.fullName));
    } else {
      result = await _firestoreService.updatePosttt(User(
        survey: survey,
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

  _navigationService.navigateTo(TourList2Route);
  }

  void setEdittingPost(User edittingPost) {
    _edittingPost = edittingPost;
  }

  
}