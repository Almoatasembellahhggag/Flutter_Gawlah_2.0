import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/src/widgets/editable_text.dart';
import 'package:flutter_gawlah/constants/route_names.dart';
import 'package:flutter_gawlah/locator.dart';
import 'package:flutter_gawlah/models/place.dart';
import 'package:flutter_gawlah/models/post.dart';
import 'package:flutter_gawlah/models/user.dart';
import 'package:flutter_gawlah/services/dialog_service.dart';
import 'package:flutter_gawlah/services/firestore_service.dart';
import 'package:flutter_gawlah/services/navigation_service.dart';

import 'package:flutter_gawlah/view_models.dart/base_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CreatePlaceViewModel extends BaseModel {
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Place _edittingPost;

  bool get _editting => _edittingPost != null;

  void updateDataaa({
    @required String name,
    @required String type,
    @required String idd,
    @required String placetype,
    @required String period,
    @required String tourss,
    @required String tours,
    List<int> x1,
    @required String infoo,
    @required String info,
    int id,
  }) {
    List<String> x = tourss.split(",");
    print(x);
    List<int> x1 = new List<int>(x.length);
    print(x.length);

    int index = 0;
    for (int i = 0; i < x.length; i++) {
      x1[index] = int.parse(x[i]);
      index++;
      print(x1);
    }

    addPostt(
      placetype: placetype,
      period: period,
      name: name,
      type: type,
      id: int.parse(idd),
      idd: idd,
      tours: x1,
      info: infoo,
      infoo: infoo,
      tourss: tourss,
    );
    //print(x);
    //print(y);
//updatePostt(name: name, description: description, image: image, info: info, rate: rate, ids: x,tags:y,center:centerr)
  }

  void updateDataaedit({
    @required String idd,
    int id,
    @required String name,
    @required String type,
    @required String placetype,
    @required String period,
    @required String tourss,
    List<int> x1,
    @required String tours,
    @required String infoo,
    @required String info,
  }) {
    List<String> x = tourss.split(",");
    print(x);
    List<int> x1 = new List<int>(x.length);
    print(x.length);

    int index = 0;
    for (int i = 0; i < x.length; i++) {
      x1[index] = int.parse(x[i]);
      index++;
      print(x1);
    }

    addPostt(
        idd: idd,
        tours: x1,
        tourss: tourss,
        period: period,
        placetype: placetype,
        id: int.parse(idd),
        info: infoo,
        infoo: info,
        name: name,
        type: type);
    //print(x);
    //  print(y);
//updatePostt(name: name, description: description, image: image, info: info, rate: rate, ids: x,tags:y,center:centerr)
  }

  Future addPostt({
    @required String name,
    @required String type,
    @required String idd,
    @required String placetype,
    @required String period,
    @required String tourss,
    @required List<int> tours,
    @required String info,
    int id,
    @required String infoo,
  }) async {
    setBusy(true);

    var result;

    if (!_editting) {
      result = await _firestoreService.addPlace(Place(
        userId: currentUser.id,
        name: name,
        type: type,
        id: id,
        idd: idd,
        period: period,
        placetype: placetype,
        tours: tours,
        tourss: tourss,
        infoo: infoo,
        //info: infoo,
      ));
    } else {
      result = await _firestoreService.updatePostPlace(Place(
        name: name,
        type: type,
        id: id,
        idd: idd,
        tours: tours,
        tourss: tourss,
        infoo: infoo,
       // info: infoo,
        placetype: placetype,
        period: period,
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
    } else {
      await _dialogService.showDialog(
        title: 'Post successfully Added',
        description: 'Your post has been created',
      );
    }

    //_navigationService.pop();
    _navigationService.navigateTo(TourList2Route);
  }

  void setEdittingPost(Place edittingPost) {
    _edittingPost = edittingPost;
  }
}
