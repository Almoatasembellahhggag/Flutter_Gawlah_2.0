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
    String _selectedRole = 'Select a User Role';
  String get selectedRole => _selectedRole;

  void setSelectedRole(dynamic role) {
    _selectedRole = role;
    
    notifyListeners();
  }

  void updateDataaa({
    @required GeoPoint center,
    String centerr,
    @required String name,
    @required String type,
    @required String idd,
    @required String placetype,
    @required String period,
    @required String tourss,
    @required String tours,
    List<int> x1,
    @required String image,
    
    @required String info, String pointss,@required List<GeoPoint> points,
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
       List<double> r = new List<double>(); 
     //int z=r.length~/2;
    // print(z);
     print(r.length);
     //r.add("hiiiii");
     print(r);
     //print(r);
     print("DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD");
     print(points[0].latitude.toString());
     print(points[0].longitude.toString());
     print(points.length);
     print("llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll");
     print(points[0].latitude.toString()+","+points[0].longitude.toString());
   
    
    for (int i =0; i<points.length-1; i++){
      r.add(points[i].latitude);
      r.add(points[i].longitude);
      print(r);
      print(r.length);

    }

    List<GeoPoint>ggg=new List<GeoPoint>();
    for(int i=0;i<r.length-1;i++){
    ggg.insert(i,  new GeoPoint(r[i], r[i+1]));
print(ggg);
print(ggg.length);
    }
    
  List<String>eee=new List<String>();
  String eex;
  for(int i=0;i<r.length-1;i++){
    eee.insert(i,(r[i].toString()+","+r[i+1].toString()));
    print(eee);
    print(eee.length);
    eex=eee.join(',');
  }

     var a = center.latitude.toString();
    var b = center.longitude.toString();
    String c = a + "," + b;
    centerr = c;
    pointss=points.toString();

    addPostt(
      placetype: placetype,
      period: period,
      name: name,
      type: type,
      id: int.parse(idd),
      idd: idd,
      tours: x1,
      info: info,
      pointss: eex,points: ggg,
      tourss: tourss,center:center,centerr:centerr,image:image,
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

    @required String info,
    @required String centerr,
    @required String image,
    @required String pointss,
  }) {
       var z=centerr.split(',');
    var z1=double.parse(z[0]);
    var z2=double.parse(z[1]);
    GeoPoint center=new GeoPoint(z1, z2);
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
List<String>ii=pointss.split(",");
List<double>xz=new List<double>();
 List<GeoPoint>points;

for(int i=0;i<ii.length;i++){
  xz.insert(i, double.parse(ii[i]));
}
for(int i=0;i<xz.length-1;i++){
  points.insert(i,new GeoPoint(xz[i],xz[i+1] ));
 
}

    addPostt(
        idd: idd,
        tours: x1,
        tourss: tourss,
        period: period,
        placetype: placetype,
        id: int.parse(idd),
        info: info,
       pointss: pointss,points: points,
        name: name,
        type: type,image:image,centerr:centerr,center:center);
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
    @required String image,
    @required String centerr,
    @required GeoPoint center,String pointss,@required List<GeoPoint> points
    
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
        tourss: tourss,points: points,pointss: pointss,
       
        info: info,center: center,centerr: centerr,image: image
      ));
    } else {
      result = await _firestoreService.updatePostPlace(Place(
        name: name,
        type: type,
        id: id,
        idd: idd,
        tours: tours,
        tourss: tourss,
    points: points,pointss: pointss,
       
       info: info,
        placetype: placetype,
        period: period,center: center,image: image,centerr: centerr,
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
