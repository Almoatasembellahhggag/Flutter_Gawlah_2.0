import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gawlah/locator.dart';
import 'package:flutter_gawlah/models/place.dart';
import 'package:flutter_gawlah/placeprofilepage.dart';
import 'package:flutter_gawlah/profilepage.dart';
import 'package:flutter_gawlah/services/authentication_service.dart';
import 'package:flutter_gawlah/ui/shared/ui_helpers.dart';
import 'package:flutter_gawlah/ui/widgets/inputField.dart';
import 'package:flutter_gawlah/ui/widgets/input_field.dart';
import 'package:flutter_gawlah/ui/widgets/textlink1.dart';
import 'package:flutter_gawlah/view_models.dart/create_place_view_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:shimmer/shimmer.dart';

import '../../verticalspacer.dart';

class CreatePlaceView extends StatelessWidget {
  final titleController = TextEditingController();
  // final titleController2 = TextEditingController();
  final titleControllerid = TextEditingController();
  // final titleControllercenter = TextEditingController();
  final titleControllerplacetype = TextEditingController();
  final titleControllerperiod = TextEditingController();
  final titlecontrollerinfo = TextEditingController();
  // final titleControllerImage = TextEditingController();
  // final titleControllerpoints = TextEditingController();
  final titleControllertours = TextEditingController();
  final titleControllertype = TextEditingController();
  final titlecontrollercenter = TextEditingController();
  final titleControllerImage = TextEditingController();
    final titleControllerpoints = TextEditingController();
  final Place edittingPost;
   final String image;
 GeoPoint center;
  // final String image;
  // final GeoPoint center;
  // final String name;
   final String name;
   final List<GeoPoint>pos;

  CreatePlaceView({Key key, this.edittingPost,this.image,this.pos,this.name,this.center}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        titleController.text = name;
 
    final AuthenticationService _authenticationService =
        locator<AuthenticationService>();

            Future<String> centerr(String name) async {
      DocumentSnapshot ds =
          await Firestore.instance.collection('polylines').document(name).get();
      return ds.data['center'].toString();
    }

    Future<String> imge(String name) async {
      DocumentSnapshot ds =
          await Firestore.instance.collection('polylines').document(name).get();
      return ds.data['image'].toString();
    }

        Future<String>point(String name) async {
      DocumentSnapshot ds =
          await Firestore.instance.collection('polylines').document(name).get();
      return ds.data['pointss'].toString();
    }


    // Future<String> centerr(String name) async {
    //   DocumentSnapshot ds =
    //       await Firestore.instance.collection('tours').document(name).get();
    //   return ds.data['center'].toString();
    // }

    // Future<String> imge(String name) async {
    //   DocumentSnapshot ds =
    //       await Firestore.instance.collection('tours').document(name).get();
    //   return ds.data['image'].toString();
    // }
//var centerrr=Firestore.instance.collection('tours').where("name",isEqualTo:titleController.text);
    // GeoPoint fcenter=GeoPoint(lat, long);

    return ViewModelProvider<CreatePlaceViewModel>.withConsumer(
        viewModel: CreatePlaceViewModel(),
        onModelReady: (model) {
          // update the text in the controller
          titleController.text = edittingPost?.name ?? '';
          //titleController2.text = edittingPost?.type ?? '';
          titleControllerid.text = edittingPost?.idd ?? '';
          titleControllerperiod.text = edittingPost?.period ?? '';
          titleControllerplacetype.text = edittingPost?.placetype ?? '';
          titleControllertype.text = edittingPost?.type ?? '';
          titleControllertours.text = edittingPost?.tourss ?? '';
         // titlecontrollerinfo.text = edittingPost?.infoo ?? '';
          titlecontrollerinfo.text = edittingPost?.info ?? '';
          titlecontrollercenter.text = edittingPost?.centerr ?? '';
          titleControllerImage.text = edittingPost?.image ?? '';
          titleControllerpoints.text = edittingPost?.pointss ?? '';

          model?.setEdittingPost(edittingPost);

          //debugPrint(edittingPost.name);
          //debugPrint(edittingPost.type);
        },
        builder: (context, model, child) => Scaffold(backgroundColor: Color.fromRGBO(38, 47, 62, 1),
              floatingActionButton: FloatingActionButton( 
                child: !model.busy
                    ? Icon(Icons.add)
                    : CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                      ),
                onPressed: () {
                  //  debugPrint(titleController2.text + "nnnnn");
                debugPrint(pos.join(','));
                debugPrint(pos.removeAt(0).toString());
                print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
                 print(pos);
                  if (!model.busy) {
                    if (edittingPost == null) {
                      center=new GeoPoint(pos[0].latitude, pos[0].longitude);
                      print(center);
                      var pointss=pos.join(',');
                      print(pointss);
                      
                      model.updateDataaa(
                        period: titleControllerperiod.text,
                        placetype: titleControllerplacetype.text,
                        type: titleControllertype.text,
                        name: titleController.text,
                        idd: titleControllerid.text,
                        tourss: titleControllertours.text,
                        tours: titleControllertours.text,
                        info: titlecontrollerinfo.text,
                       image:image,center: center,points: pos ,pointss: pointss
                      );
                    } else {
                      // debugPrint(Firestore.instance.collection('tours').document().documentID);
                      model.updateDataaedit(
                        info: titlecontrollerinfo.text,
                        tours: titleControllertours.text,
                        tourss: titleControllertours.text,
                        period: titleControllerperiod.text,
                        placetype: titleControllerplacetype.text,
                        idd: titleControllerid.text,
                        name: titleController.text,
                        type: titleControllertype.text,
                        image: titleControllerImage.text,centerr: titlecontrollercenter.text,pointss: titleControllerpoints.text,
                      );
                    }
                    //  center: GeoPoint(double.parse(titleControllerlat.text), double.parse(titleControllerlong.text)));
                    // model.addPost(likedplaces:titleController2.text);
                  }
                    titlecontrollercenter.text = centerr(name) as String;
                  print(titlecontrollercenter.text +
                      'ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZz');
                  titleControllerImage.text = imge(name) as String;
                  titleControllerpoints.text=point(name)as String;
                },
                backgroundColor: !model.busy
                    ?  Color.fromRGBO(38, 47, 62, 1)
                    : Colors.grey[600],
              ),
              body: list(context),
            ));
  }

  list(BuildContext context){

    if (edittingPost == null) {
      return 
      Container(
          // color: Colors.white,
             child: Stack(children:<Widget>[
                        //   ClipRect(
                        //   child: BackdropFilter(
                        //     filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                        //     child: Container(
                        //       color: Colors.black38.withOpacity(0.4),
                        //     ),
                        //   ),
                        // ),


            
     SingleChildScrollView(child:

     Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: <Widget>[
              
                Padding(padding: const EdgeInsets.symmetric(vertical: 10),
                                  child: Shimmer.fromColors(
                  period: Duration(milliseconds: 1500),
                  baseColor: Colors.blue[600],
                  //Color.fromRGBO(38, 47, 62, 1),
                  highlightColor:Colors.blue[900],
                    
                    child:  Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                      
                    VSpacer(0.05),
                    Container(child:
                     Image.asset('images_and_icons/g_transparent.png'),height: 70,width: 50,),
                        ],
                      ),),

                ),
      
         
          verticalSpace(20),
          Text(
            'Create New Place',
            style: TextStyle(fontSize: 40,fontFamily: "DancingScript",color: Colors.white)),
          

          verticalSpaceMedium,
              Column(                         crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
             TextLink1(
            "Press me!!!                                                 To Select Your Tour Image & Location",
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilePagePlace()));
            },
          ),
              verticalSpaceMedium,
          InputFieldd(
            placeholder: 'Name',
            controller: titleController,
          ),
          Text("    Place Name",style: TextStyle(color:Colors.grey)),
          verticalSpaceSmall,
          InputFieldd(
            placeholder: 'Type',
            controller: titleControllertype,
          ),
Text("    i.e: Place",style: TextStyle(color:Colors.grey)),
          verticalSpaceSmall,
          InputFieldd(
            placeholder: 'Tour ID',
            controller: titleControllerid,
          ),
          Text("    Approximate distance between the center of ",style: TextStyle(color:Colors.grey)),
        Text("    Cairo and the place",style: TextStyle(color:Colors.grey)),
        
          verticalSpaceSmall,
          InputFieldd(
            placeholder: 'Period',
            controller: titleControllerperiod,
          ),
           Text("    i.e: Fatimid, Mamluk",style: TextStyle(color:Colors.grey)),
          verticalSpaceSmall,
          InputFieldd(
            placeholder: 'Place type',
            controller: titleControllerplacetype,
          ),
          Text("    i.e: Mosque, School",style: TextStyle(color:Colors.grey)),
          verticalSpaceSmall,
          InputFieldd(placeholder: 'Tours', controller: titleControllertours),
          Text("    You can choose from the below tours",style: TextStyle(color:Colors.grey)),
          Text("    1: MuezStreet,2: Dr.Hany",style: TextStyle(color:Colors.grey),),
          verticalSpaceSmall,
          InputFieldd(placeholder: 'Info', controller: titlecontrollerinfo),
           Text("    Some infromation about the place",style: TextStyle(color:Colors.grey)),
            verticalSpaceMedium,
       

          //  RaisedButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage(name: titleController.text,)))

          //  ,child: Text("Select Image"),),
          verticalSpaceSmall,
          // RaisedButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage(id:_authenticationService.currentUser.id))))
        ],
      )])
      )
      )
      ]));
    } else {
      return  
      Container(
          // color: Colors.white,
             child: Stack(children:<Widget>[
                        //   ClipRect(
                        //   child: BackdropFilter(
                        //     filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                        //     child: Container(
                        //       color: Colors.black38.withOpacity(0.4),
                        //     ),
                        //   ),
                        // ),


            
     SingleChildScrollView(child:

     Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: <Widget>[
              
                Padding(padding: const EdgeInsets.symmetric(vertical: 10),
                                  child: Shimmer.fromColors(
                  period: Duration(milliseconds: 1500),
                  baseColor: Colors.blue[600],
                  //Color.fromRGBO(38, 47, 62, 1),
                  highlightColor:Colors.blue[900],
                    
                    child:  Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                      
                    VSpacer(0.05),
                    Container(child:
                     Image.asset('images_and_icons/g_transparent.png'),height: 70,width: 50,),
                        ],
                      ),),

                ),
      
         
          verticalSpace(20),
          verticalSpace(20),
          Text(
            'Edit your Tour',
            style: TextStyle(fontSize: 40,fontFamily: "DancingScript",color: Colors.white),
          ),

          verticalSpaceMedium,
           Text("    Place Name",style: TextStyle(color:Colors.grey)),
            verticalSpaceSmall,
          InputFieldd(
            placeholder: 'Name',
            controller: titleController,
          ),
    
      verticalSpaceSmall,
      Text("    i.e: Place",style: TextStyle(color:Colors.grey)),
       verticalSpaceSmall,
          InputFieldd(
            placeholder: 'Type',
            controller: titleControllertype,
          ),
          verticalSpaceSmall,
            Text("    Approximate distance between the center of ",style: TextStyle(color:Colors.grey)),
        Text("    Cairo and the place",style: TextStyle(color:Colors.grey)),
         verticalSpaceSmall,
        

          InputFieldd(
            placeholder: 'Tour ID',
            controller: titleControllerid,
          ),
          verticalSpaceSmall,
          Text("    i.e: Fatimid, Mamluk",style: TextStyle(color:Colors.grey)),
           verticalSpaceSmall,
          InputFieldd(
            placeholder: 'Period',
            controller: titleControllerperiod,
          ),
          verticalSpaceSmall,
        
          Text("    i.e: Mosque, School",style: TextStyle(color:Colors.grey)),
           verticalSpaceSmall,
          InputFieldd(
            placeholder: 'Place type',
            controller: titleControllerplacetype,
          ),
          verticalSpaceSmall,
             Text("    You can choose from the below tours",style: TextStyle(color:Colors.grey)),
          Text("    1: MuezStreet,2: Dr.Hany",style: TextStyle(color:Colors.grey),),
           verticalSpaceSmall,
          InputFieldd(
            placeholder: 'Tours',
            controller: titleControllertours,
          ),
          verticalSpaceSmall,
          Text("    Some infromation about the place",style: TextStyle(color:Colors.grey)),
           verticalSpaceSmall,
          InputFieldd(placeholder: 'info', controller: titlecontrollerinfo),
 verticalSpaceSmall,

  Text("    The center of the tour location",style: TextStyle(color:Colors.grey)),
   verticalSpaceSmall,
          InputFieldd(placeholder: 'center', controller: titlecontrollercenter),
           verticalSpaceSmall,
            Text("    The tour polygon shape on the map",style: TextStyle(color:Colors.grey)),
             verticalSpaceSmall,
           InputFieldd(placeholder: 'points', controller: titleControllerpoints),
           verticalSpaceSmall,
            Text("    The image url of the place",style: TextStyle(color:Colors.grey)),
             verticalSpaceSmall,
          InputFieldd(placeholder: 'image', controller: titleControllerImage),
          //  RaisedButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage(name: titleController.text,)))

          //  ,child: Text("Select Image"),),
          verticalSpaceSmall,
        ],
      )))]));
    }
  }
}
