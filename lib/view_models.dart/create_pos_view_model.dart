import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/src/widgets/editable_text.dart';
import 'package:flutter_gawlah/constants/route_names.dart';
import 'package:flutter_gawlah/locator.dart';
import 'package:flutter_gawlah/models/post.dart';
import 'package:flutter_gawlah/models/user.dart';
import 'package:flutter_gawlah/services/dialog_service.dart';
import 'package:flutter_gawlah/services/firestore_service.dart';
import 'package:flutter_gawlah/services/navigation_service.dart';

import 'package:flutter_gawlah/view_models.dart/base_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CreatePostViewModel extends BaseModel {
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();
  

  Post _edittingPost;

  bool get _editting => _edittingPost != null;

  void updateDataaa(
      {@required GeoPoint center,
      @required String idd,
      @required String name,
      @required String description,
      @required String image,
      @required String info,
      @required String rate,
      @required String tags,
      @required String tagss,
      String centerr}) {
    List<String> x = idd.split(',');
    List<String> y = tags.split(',');
    GeoPoint centerrr = GeoPoint(center.latitude, center.longitude);
    int nid = int.parse(idd);
    var a = center.latitude.toString();
    var b = center.longitude.toString();
    String c = a + "," + b;
    centerr = c;

    addPostt(
        name: name,
        description: description,
        image: image,
        info: info,
        rate: rate,
        ids: x,
        tags: y,
        center: center,
        idd: idd,
        tagss: tagss,
        id: nid,
        centerr: centerr);
    //print(x);
    print(y);
//updatePostt(name: name, description: description, image: image, info: info, rate: rate, ids: x,tags:y,center:centerr)
  }

    void updateDataaedit(
      {
      @required String idd,
      @required String name,
      @required String description,
      @required String image,
      @required String info,
      @required String rate,
      @required String tags,
      @required String tagss,
      @required String centerr,}) {
    List<String> x = idd.split(',');
    List<String> y = tags.split(',');
    var z=centerr.split(',');
    var z1=double.parse(z[0]);
    var z2=double.parse(z[1]);
    GeoPoint center=new GeoPoint(z1, z2);
    
    int nid = int.parse(idd);


    addPostt(
        name: name,
        description: description,
        image: image,
        info: info,
        rate: rate,
        ids: x,
        tags: y,
        center: center,
        idd: idd,
        tagss: tagss,
        id: nid,
        centerr: centerr);
    //print(x);
    print(y);
//updatePostt(name: name, description: description, image: image, info: info, rate: rate, ids: x,tags:y,center:centerr)
  }

  Future addPostt(
      {@required String name,
      @required String description,
      @required String image,
      @required String info,
      @required String rate,
      @required int id,
      @required String centerr,
      @required List<String> ids,
      @required List<String> tags,
      @required GeoPoint center,
      @required String idd,
      @required String tagss}) async {
    setBusy(true);

    var result;
var c;
  getCategoryId(){
    var ref = Firestore.instance.collection('tours')
        .where("name",isEqualTo: name).getDocuments();
    ref.then((v){ c=v.documents[0].documentID;});
}

    if (!_editting) {
      result = await _firestoreService.addPost(Post(
        userId: currentUser.id,
        name: name,
        description: description,
        image: image,
        info: info,
        rate: rate,
        ids: ids,
        tags: tags,
        center: center,
        idd: idd,
        tagss: tagss,
        centerr: centerr,
        id: id,
       documentId: name,
    
      ));
    } else {
      result = await _firestoreService.updatePost(Post(
        name: name,
        description: description,
        info: info,
        rate: rate,
        ids: ids,
        idd: idd,
        tagss: tagss,
        tags: tags,
        image: image,
        center: center,
        centerr: centerr,
        id: id,
        userId: _edittingPost.userId,
        documentId: _edittingPost.documentId,
      ));
    }

    setBusy(false);

   if (result is String) {
      await _dialogService.showDialog(
        title: 'Cound not create post',
        description: result,
      );
    }  else {
      await _dialogService.showDialog(
        title: 'Post successfully Added',
        description: 'Your post has been created',
      );
    }

    //_navigationService.pop();
    _navigationService.navigateTo(TourList2Route);
  }

  void setEdittingPost(Post edittingPost) {
    _edittingPost = edittingPost;
  }
}

// import 'package:flutter/foundation.dart';
// import 'package:flutter_gawlah/models/post.dart';
// import 'package:flutter_gawlah/services/dialog_service.dart';
// import 'package:flutter_gawlah/services/firestore_service.dart';
// import 'package:flutter_gawlah/services/navigation_service.dart';
// import 'package:flutter_gawlah/view_models.dart/base_model.dart';

// import '../locator.dart';

// class CreatePostViewModel extends BaseModel {
//   final FirestoreService _firestoreService = locator<FirestoreService>();
//   final DialogService _dialogService = locator<DialogService>();
//   final NavigationService _navigationService = locator<NavigationService>();

//   Post _edittingPost;

//   bool get _editting => _edittingPost != null;

//   Future addPost({@required String name}) async {
//     setBusy(true);

//     var result;

//     if (!_editting) {
//       result = await _firestoreService
//           .addPost(Post(name: name, userId: currentUser.id));
//     } else {
//       result = await _firestoreService.updatePost(Post(
//         name: name,
//         userId: _edittingPost.userId,
//         documentId: _edittingPost.documentId,
//       ));
//     }

//     setBusy(false);

//     if (result is String) {
//       await _dialogService.showDialog(
//         title: 'Cound not create post',
//         description: result,
//       );
//     } else {
//       await _dialogService.showDialog(
//         title: 'Post successfully Added',
//         description: 'Your post has been created',
//       );
//     }

//     _navigationService.pop();
//   }

//   void setEdittingPost(Post edittingPost) {
//     _edittingPost = edittingPost;
//   }
// }
