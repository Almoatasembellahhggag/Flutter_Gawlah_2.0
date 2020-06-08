import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gawlah/Image.dart';
import 'package:flutter_gawlah/locator.dart';
import 'package:flutter_gawlah/models/post.dart';
import 'package:flutter_gawlah/profilepage.dart';
import 'package:flutter_gawlah/services/authentication_service.dart';
import 'package:flutter_gawlah/tourlocation.dart';
import 'package:flutter_gawlah/ui/shared/ui_helpers.dart';
import 'package:flutter_gawlah/ui/widgets/inputField.dart';
import 'package:flutter_gawlah/ui/widgets/input_field.dart';
import 'package:flutter_gawlah/ui/widgets/text_link.dart';
import 'package:flutter_gawlah/ui/widgets/textlink1.dart';
import 'package:flutter_gawlah/view_models.dart/create_pos_view_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:path/path.dart';
import 'package:provider_architecture/provider_architecture.dart';

import 'package:flutter_gawlah/models/user.dart';
import 'package:shimmer/shimmer.dart';

import '../../verticalspacer.dart';

class CreatePostView extends StatelessWidget {
  final titleController = TextEditingController();
  final titleController2 = TextEditingController();
  final titleControllerrate = TextEditingController();
  final titleControllerinfo = TextEditingController();
  final titleControllerids = TextEditingController();
  final titleControllertags = TextEditingController();
  final titlecontrollercenter = TextEditingController();
  final titleControllerImage = TextEditingController();
  final Post edittingPost;
  final String image;
  final GeoPoint center;
  final String name;
  

  CreatePostView(
      {Key key, this.edittingPost, this.image, this.center, this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final String latt=edittingPost.center.latitude as String;
    // final String longg=edittingPost.center.longitude as String;
    titleController.text = name;
    final AuthenticationService _authenticationService =
        locator<AuthenticationService>();
      

    Future<String> centerr(String name) async {
      DocumentSnapshot ds =
          await Firestore.instance.collection('tours').document(name).get();
      return ds.data['center'].toString();
    }

    Future<String> imge(String name) async {
      DocumentSnapshot ds =
          await Firestore.instance.collection('tours').document(name).get();
      return ds.data['image'].toString();
    }
//var centerrr=Firestore.instance.collection('tours').where("name",isEqualTo:titleController.text);
    // GeoPoint fcenter=GeoPoint(lat, long);

    return ViewModelProvider<CreatePostViewModel>.withConsumer(
        viewModel: CreatePostViewModel(),
        onModelReady: (model) {
          // update the text in the controller
          titleController.text = edittingPost?.name ?? '';
          titleController2.text = edittingPost?.description ?? '';
          titleControllerinfo.text = edittingPost?.info ?? '';
          titleControllerrate.text = edittingPost?.rate ?? '';
          titleControllertags.text = edittingPost?.tags ?? '';
          titleControllerids.text = edittingPost?.ids ?? '';
          titleControllerids.text = edittingPost?.idd ?? '';
          titleControllertags.text = edittingPost?.tagss ?? '';
          titlecontrollercenter.text = edittingPost?.centerr ?? '';
          titleControllerImage.text = edittingPost?.image ?? '';

          model?.setEdittingPost(edittingPost);
        },
        builder: (context, model, child) => Scaffold(
          backgroundColor: Color.fromRGBO(38, 47, 62, 1),
              floatingActionButton: FloatingActionButton(
                child: !model.busy
                    ? Icon(Icons.add)
                    : CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                      ),
                onPressed: () {
                  // debugPrint(titleControllerlong.text+"hereeee");
                  // debugPrint(center as String);
                 
                  debugPrint(titleControllerImage.text +
                      "kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk");
                  debugPrint(titleController2.text + "nnnnn");
                  debugPrint(
                      titlecontrollercenter.text + "AAAAAAAAAAAAAAAAAAaa");
                      
                  if (!model.busy) {
                    if (edittingPost==null) {
                      model.updateDataaa(
                          tagss: titleControllertags.text,
                          idd: titleControllerids.text,
                          rate: titleControllerrate.text,
                          info: titleControllerinfo.text,
                          name: titleController.text,
                          image: image,
                          description: titleController2.text,
                          tags: titleControllertags.text,
                          center: center,);
                    } else {
                      // debugPrint(Firestore.instance.collection('tours').document().documentID);
                      model.updateDataaedit(
                          centerr: titlecontrollercenter.text,
                          idd: titleControllerids.text,
                          name: titleController.text,
                          description: titleController2.text,
                          image: titleControllerImage.text,
                          info: titleControllerinfo.text,
                          rate: titleControllerrate.text,
                          tagss: titleControllertags.text,tags: titleControllertags.text);
                    }
                    //  center: GeoPoint(double.parse(titleControllerlat.text), double.parse(titleControllerlong.text)));
                    // model.addPost(likedplaces:titleController2.text);
                  }
                  titlecontrollercenter.text = centerr(name) as String;
                  print(titlecontrollercenter.text +
                      'ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZz');
                  titleControllerImage.text = imge(name) as String;
                },
                backgroundColor: !model.busy
                    ? Color.fromRGBO(38, 47, 62, 1)
                    : Colors.grey[600],
              ),
              body: //Column( children:<Widget>[
                  list(context),
              //Text('ImageURL:'+image)

              //  ])
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 30.0),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: <Widget>[
              //       verticalSpace(20),
              //       Text(
              //         'Create Tour',
              //         style: TextStyle(fontSize: 26),
              //       ),
              //       list()

              //       ]))
            ));
  }

  list(BuildContext context) {
    if (edittingPost == null) {
      return  Container(
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
            'Create New Tour',
            style: TextStyle(fontSize: 40,fontFamily: "DancingScript",color: Colors.white)),
          

          verticalSpaceMedium,
              Column(                         crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
             TextLink1(
            "Press me!!!                                                 To Select Your Tour Image & Location",
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilePage()));
            },
          ),
            
          verticalSpaceMedium,
          InputFieldd(
            placeholder: 'Name',
            controller: titleController,
          ),
           Text("    Tour Name  i.e: Muez Street",style: TextStyle(color:Colors.grey)),
          verticalSpaceSmall,
          InputFieldd(
            placeholder: 'Description',
            controller: titleController2,
          ),
           Text("    Tour Description",style: TextStyle(color:Colors.grey)),
          //   verticalSpaceSmall,
          //  RaisedButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage(name: titleController.text,)))

          //  ,child: Text("Select Image"),),
          verticalSpaceSmall,
          // RaisedButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage(id:_authenticationService.currentUser.id))))

          InputFieldd(
            placeholder: 'Info',
            controller: titleControllerinfo,
          ),
          Text("    More inforamtion about the tour",style: TextStyle(color:Colors.grey)),
          verticalSpaceSmall,

          InputFieldd(
            placeholder: 'Rate',
            controller: titleControllerrate,
          ),
          Text("    Tour Rate",style: TextStyle(color:Colors.grey)),
          Text("    Please enter the rate between 1-5",style: TextStyle(color:Colors.grey)),
          verticalSpaceSmall,

          InputFieldd(placeholder: "ID", controller: titleControllerids),
          Text("    Give The tour any unique number",style: TextStyle(color:Colors.grey)),
           verticalSpaceSmall,

          InputFieldd(placeholder: "Tags", controller: titleControllertags),
            Text("    Specify the tour intersting themes.",style: TextStyle(color:Colors.grey)),
              Text("    i.e:Art,War,Painting,Education,Qurans",style: TextStyle(color:Colors.grey)),
                   verticalSpaceSmall,

    
          // Text("imageURL:"+image),
          // verticalSpaceSmall,
          // Text("center:"+center.toString())

          // Text('Post Image'),
          // verticalSpaceSmall,
          // Container(
          //   height: 250,
          //   decoration: BoxDecoration(
          //       color: Colors.grey[200],
          //       borderRadius: BorderRadius.circular(10)),
          //   alignment: Alignment.center,
          //   child: Text(
          //     'Tap to add post image',
          //     style: TextStyle(color: Colors.grey[400]),
          //   ),
          // )
        ],
              )])))]));
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
            Text("    Tour Name  i.e: Muez Street",style: TextStyle(color:Colors.grey)),
          InputFieldd(
            placeholder: 'Name',
            controller: titleController,
          ),
  Text("    Tour Description",style: TextStyle(color:Colors.grey)),
          InputFieldd(
            placeholder: 'description',
            controller: titleController2,
          ),
          //   verticalSpaceSmall,
          //  RaisedButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage(name: titleController.text,)))

          //  ,child: Text("Select Image"),),
          verticalSpaceSmall,
          // RaisedButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage(id:_authenticationService.currentUser.id))))
 Text("    More inforamtion about the tour",style: TextStyle(color:Colors.grey)),
          InputFieldd(
            placeholder: 'info',
            controller: titleControllerinfo,
          ),
Text("    Tour Rate",style: TextStyle(color:Colors.grey)),
          Text("    Please enter the rate between 1-5",style: TextStyle(color:Colors.grey)),
          InputFieldd(
            placeholder: 'Rate',
            controller: titleControllerrate,
          ),
 Text("    Give The tour any unique number",style: TextStyle(color:Colors.grey)),
          InputFieldd(placeholder: "id", controller: titleControllerids),
          verticalSpaceSmall,
            Text("    Specify the tour intersting themes.",style: TextStyle(color:Colors.grey)),
              Text("    i.e:Art,War,Painting,Education,Qurans",style: TextStyle(color:Colors.grey)),
          InputFieldd(placeholder: "tags", controller: titleControllertags),
           
                   verticalSpaceSmall,
                       Text("    Tour center location",style: TextStyle(color:Colors.grey)),
          InputFieldd(placeholder: "Center", controller: titlecontrollercenter),
         
        
                   verticalSpaceSmall,
                     Text("    Tour image",style: TextStyle(color:Colors.grey)),
          InputFieldd(placeholder: "Image", controller: titleControllerImage),
           
            
                   verticalSpaceSmall,

          verticalSpaceMedium,
          // TextLink1(
          //   "Change your image",
          //   onPressed: () {
          //     Navigator.push(context,
          //         MaterialPageRoute(builder: (context) => ProfilePage()));
          //   },
          // ),

          // Text("imageURL:"+image),
          // verticalSpaceSmall,
          // Text("center:"+center.toString())

          // Text('Post Image'),
          // verticalSpaceSmall,
          // Container(
          //   height: 250,
          //   decoration: BoxDecoration(
          //       color: Colors.grey[200],
          //       borderRadius: BorderRadius.circular(10)),
          //   alignment: Alignment.center,
          //   child: Text(
          //     'Tap to add post image',
          //     style: TextStyle(color: Colors.grey[400]),
          //   ),
          // )
        ],
      )))]));
    }
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_gawlah/models/post.dart';
// import 'package:flutter_gawlah/ui/shared/ui_helpers.dart';
// import 'package:flutter_gawlah/ui/widgets/input_field.dart';
// import 'package:flutter_gawlah/view_models.dart/create_pos_view_model.dart';
// import 'package:provider_architecture/provider_architecture.dart';

// class CreatePostView extends StatelessWidget {
//   final titleController = TextEditingController();
//   final Post edittingPost;
//   CreatePostView({Key key, this.edittingPost}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ViewModelProvider<CreatePostViewModel>.withConsumer(
//       viewModel: CreatePostViewModel(),
//       onModelReady: (model) {
//         // update the text in the controller
//         titleController.text = edittingPost?.name ?? '';

//         model.setEdittingPost(edittingPost);
//       },
//       builder: (context, model, child) => Scaffold(
//           floatingActionButton: FloatingActionButton(
//             child: !model.busy
//                 ? Icon(Icons.add)
//                 : CircularProgressIndicator(
//                     valueColor: AlwaysStoppedAnimation(Colors.white),
//                   ),
//             onPressed: () {
//               if (!model.busy) {
//                 model.addPost(name: titleController.text);
//               }
//             },
//             backgroundColor:
//                 !model.busy ? Theme.of(context).primaryColor : Colors.grey[600],
//           ),
//           body: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 30.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 verticalSpace(40),
//                 Text(
//                   'Create Post',
//                   style: TextStyle(fontSize: 26),
//                 ),
//                 verticalSpaceMedium,
//                 InputField(
//                   placeholder: 'Title',
//                   controller: titleController,
//                 ),
//                 verticalSpaceMedium,
//                 Text('Post Image'),
//                 verticalSpaceSmall,
//                 Container(
//                   height: 250,
//                   decoration: BoxDecoration(
//                       color: Colors.grey[200],
//                       borderRadius: BorderRadius.circular(10)),
//                   alignment: Alignment.center,
//                   child: Text(
//                     'Tap to add post image',
//                     style: TextStyle(color: Colors.grey[400]),
//                   ),
//                 )
//               ],
//             ),
//           )),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_gawlah/ui/shared/ui_helpers.dart';
// import 'package:flutter_gawlah/ui/widgets/input_field.dart';
// import 'package:flutter_gawlah/view_models.dart/create_pos_view_model.dart';
// import 'package:provider_architecture/provider_architecture.dart';

// class CreatePostView extends StatelessWidget {
//   final titleController = TextEditingController();

//   CreatePostView({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ViewModelProvider<CreatePostViewModel>.withConsumer(
//       viewModel: CreatePostViewModel(),
//       builder: (context, model, child) => Scaffold(
//           floatingActionButton: FloatingActionButton(
//             child: !model.busy
//                 ? Icon(Icons.add)
//                 : CircularProgressIndicator(
//                     valueColor: AlwaysStoppedAnimation(Colors.white),
//                   ),
//             onPressed: () {
//               // TODO: Add Post
//             },
//             backgroundColor:
//                 !model.busy ? Theme.of(context).primaryColor : Colors.grey[600],
//           ),
//           body: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 30.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 verticalSpace(40),
//                 Text(
//                   'Create Post',
//                   style: TextStyle(fontSize: 26),
//                 ),
//                 verticalSpaceMedium,
//                 InputField(
//                   placeholder: 'Title',
//                   controller: titleController,
//                 ),
//                 verticalSpaceMedium,
//                 Text('Post Image'),
//                 verticalSpaceSmall,
//                 Container(
//                   height: 250,
//                   decoration: BoxDecoration(
//                       color: Colors.grey[200],
//                       borderRadius: BorderRadius.circular(10)),
//                   alignment: Alignment.center,
//                   child: Text(
//                     'Tap to add post image',
//                     style: TextStyle(color: Colors.grey[400]),
//                   ),
//                 )
//               ],
//             ),
//           )),
//     );
//   }
// }
