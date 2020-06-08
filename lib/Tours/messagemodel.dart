import 'package:flutter/cupertino.dart';
import 'package:flutter_gawlah/constants/route_names.dart';
import 'package:flutter_gawlah/locator.dart';
import 'package:flutter_gawlah/models/liked.dart';
import 'package:flutter_gawlah/models/message.dart';
import 'package:flutter_gawlah/models/post.dart';
import 'package:flutter_gawlah/models/user.dart';
import 'package:flutter_gawlah/services/dialog_service.dart';
import 'package:flutter_gawlah/services/firestore_service.dart';
import 'package:flutter_gawlah/services/navigation_service.dart';
import 'package:flutter_gawlah/ui/views/shaklbas.dart';
import 'package:flutter_gawlah/view_models.dart/base_model.dart';

class MessageViewModel extends BaseModel {
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  User _edittingPost;

  bool get _editting => _edittingPost != null;

  Future addMessage({@required String message}) async {
    setBusy(true);

    var result;

      result = 
     await _firestoreService
        .addMessage(Message(message: message,userId: currentUser.id));
    

    setBusy(false);

    if (result is List<String>) {
      await _dialogService.showDialog(
        title: 'Cound not create post',
        //description: result,
      );
    } else {
      await _dialogService.showDialog(
        title: 'Message successfully sent',
        description: 'We will reply back as soon as we see your message. Thank You!!',
      );
    }

 // _navigationService.navigateTo(TourList2Route);
  }

  void setEdittingPost(User edittingPost) {
    _edittingPost = edittingPost;
  }

  
}