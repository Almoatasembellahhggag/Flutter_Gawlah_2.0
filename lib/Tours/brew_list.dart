import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter_gawlah/Tours/profilepageuaer.dart';
import 'package:flutter_gawlah/brewlistmodel.dart';
import 'package:flutter_gawlah/services/authentication_service.dart';
import 'package:flutter_gawlah/services/firestore_service.dart';
import 'package:flutter_gawlah/src/app.dart';
import 'package:flutter_gawlah/ui/views/create_post_view.dart';
import 'package:flutter_gawlah/ui/views/home_view.dart';
import 'package:flutter_gawlah/ui/views/home_view_places.dart';
import 'package:flutter_gawlah/verticalspacer.dart';
import 'package:flutter_gawlah/view_models.dart/home_view_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

import 'package:provider_architecture/viewmodel_provider.dart';

import '../AboutUs.dart';
import '../Quizgame.dart';
import 'package:path/path.dart' as Path;
import 'package:flutter/material.dart';

import '../create.dart';
import '../locator.dart';
import '../profilepage.dart';

class BrewList extends StatefulWidget {
  final String imagecome;

  const BrewList({Key key, this.imagecome}) : super(key: key);
  
  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final Firestore database = Firestore.instance;
  File _image;
  final firestoreInstance = Firestore.instance;
  String _uploadedFileURL;
  final FirestoreService _firestoreService = locator<FirestoreService>();

  final CollectionReference _usersCollectionReference =
      Firestore.instance.collection('Users');
  var profilePicUrl =
      'https://pixel.nymag.com/imgs/daily/vulture/2017/06/14/14-tom-cruise.w700.h700.jpg';
String imagee;
  @override
  Widget build(BuildContext context) {
//final dbRef = FirebaseDatabase.instance.reference().child("Users").orderByChild("id").equalTo(_authenticationService.currentUser.id).orderByChild("image");
       imge(String name) async {
      DocumentSnapshot ds =
          await Firestore.instance.collection('Users').document(_authenticationService.currentUser.fullName).get();
     imagee=ds.data['image'].toString();

    }
    @override
    void initState() {
      imge(_authenticationService.currentUser.fullName);

      super.initState();

      setState(() {
       
       // _uploadedFileURL = _firestoreService.user.image;
        //_firestoreService.updatePostimage(_firestoreService.user);
      });
      // catchError((e) {
      //   print(e);
      // });
    }

    void updateDataaa() async {
      QuerySnapshot querySnapshot = await _usersCollectionReference
          .where('id', isEqualTo: _authenticationService.currentUser.id)
          .getDocuments();
      for (int i = 0; i < querySnapshot.documents.length; i++) {
        var a = querySnapshot.documents[i];
        print("HIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII");
        print(a.documentID);
        print("CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC");
        print(a.data);
        // return a.documentID.toString();
        //  setState(() {

        //  });
      }
    }

    Future uploadFile() async {
      StorageReference storageReference = FirebaseStorage.instance
          .ref()
          .child('chats/${Path.basename(_image.path)}}');
      StorageUploadTask uploadTask = storageReference.putFile(_image);
      await uploadTask.onComplete;
      print('File Uploaded');

      storageReference.getDownloadURL().then((fileURL) {
        setState(() {
          _uploadedFileURL = fileURL;
          _usersCollectionReference
              .document(_authenticationService.currentUser.id)
              .updateData({'image': fileURL});
        });
      });
      updateDataaa();
    }

    Future chooseFile() async {
      await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
        setState(() {
          _image = image;
        });
      });
    }

// void _onPressed() {
//   firestoreInstance.collection("Users").getDocuments().then((querySnapshot) {
//     querySnapshot.documents.forEach((result) {
//     //  print(result.data);
//     });
//   });
//    updateData();
// }
//==========================================================================================
// //File _image=new File(_authenticationService.currentUser.image);
// //Query query = database.collection('Users').where('id',isEqualTo:_authenticationService.currentUser.id);
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     FirebaseAuth.instance.currentUser().then((user) {
//       setState(() {
//         profilePicUrl = user.photoUrl;
//       });
//     }).catchError((e) {
//       print(e);
//     });
//   }
//     Future getImage(String imagee) async {
//       var image = await ImagePicker.pickImage(source: ImageSource.gallery);

//       setState(() {
//         _image = image;
//         getImagefinal(imagee);
//         // print(getImagefinal(imagee));
//         print('Image Path $_image');
//       });
//     }

//     Future _addPathToDatabase(String text, String id, String img) async {
//       try {
//         // Get image URL from firebase
//         final ref = FirebaseStorage().ref().child(text);
//         var imageString = await ref.getDownloadURL();
//       //Query query = database.collection('Users').where('id',isEqualTo:id);
//         await _usersCollectionReference
//             .document(id)
//             .updateData({'image': imageString});
//           //  _firestoreService.updatePostimage(_authenticationService.currentUser);
//         setState(() {
//           img = imageString;
//         });
//         // Add location and url to database

//       } catch (e) {
//         print(e.message);
//         showDialog(
//             context: context,
//             builder: (context) {
//               return AlertDialog(
//                 content: Text(e.message),
//               );
//             });
//       }
//     }

//     Future uploadPic(BuildContext context, String id, String imagee) async {
//       String fileName = basename(_image.path);
//       StorageReference firebaseStorageRef =
//           FirebaseStorage.instance.ref().child(fileName);
//       StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
//       StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;

//       setState(() {

//         print("Profile Picture uploaded");
//         // print(fileName);

//         Scaffold.of(context)
//             .showSnackBar(SnackBar(content: Text('Profile Picture Uploaded')));
//       });

//       _addPathToDatabase(fileName, id, imagee);
//     }

//     IconButton _buildb() {
//       return IconButton(
//         icon: Icon(Icons.question_answer),
//         tooltip: 'Thank You',
//         onPressed: () {
//           debugPrint("Cliked");
//           Navigator.push(
//               context, MaterialPageRoute(builder: (context) => App()));
//         },
//       );
//     }
print(_authenticationService.currentUser.userRole);
if(_authenticationService.currentUser.userRole=="User"){
    return ViewModelProvider<HomeViewModel>.withConsumer(
        viewModel: HomeViewModel(),
        onModelReady: (model) => model.listenToPosts(),
        builder: (context, model, child) => ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Drawer(
                child: Column(
                  children: <Widget>[
                    Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(20),
                        color: Color.fromRGBO(38, 47, 62, 1),
                        child: Center(
                            child: Column(

                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            VSpacer(0.1),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.center,
                                  child: CircleAvatar(
                                    radius: 100,
                                    backgroundColor: Color(0xff476cfb),
                                    child: ClipOval(
                                      child: new SizedBox(
                                          width: 190.0,
                                          height: 190.0,
                                          child: (_image != null &&
                                                  model.currentUser.image !=
                                                      null)
                                              ?
                                              // getImagefinal(model.currentUser.image)
                                              Image.file(
                                                  _image,
                                                  fit: BoxFit.fill,
                                                  scale: 0.5,
                                                )
                                              : (model.currentUser.image ==
                                                      null)
                                                  ? Image.network(
                                                      "https://images.unsplash.com/photo-1502164980785-f8aa41d53611?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                                                      scale: 0.5,
                                                      fit: BoxFit.fill,
                                                    )
                                                  : (_image == null &&
                                                          model.currentUser
                                                                  .image !=
                                                              null)
                                                      ? Image.network(
                                                          _authenticationService
                                                              .currentUser
                                                              .image,

                                                          //  _uploadedFileURL,
                                                          scale: 0.5,
                                                          fit: BoxFit.fill,
                                                        )
                                                      : Image.network(
                                                          "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Circle-icons-profile.svg/240px-Circle-icons-profile.svg.png",
                                                          scale: 0.5,
                                                          fit: BoxFit.fill,
                                                        )), ),
                                    ),
                                  ),
                                
                                Padding(
                                  padding: EdgeInsets.only(top: 150.0),
                                  child: IconButton(
                                    icon: Icon(
                                      FontAwesomeIcons.camera,
                                      size: 20.0,
                                    ),
                                    onPressed: () {
                                      chooseFile();
                                      //uploadFile();
                                      //print(getImagefinal(model.currentUser.image));

                                      // print(model.currentUser.image +
                                      //     "HIIIIIIIIIIIIIIIi");

                                      // print(dbRef);
                                      // _image=model.currentUser.image as File;
                                    },
                                  ),
                                ),
                              ],
                            ),

                            Text(
                              model.currentUser.fullName,
                              style:
                                  TextStyle(fontSize: 22, color: Colors.white),
                            ),
                            // Text(model.currentUser.image,style: TextStyle(fontSize: 10, color: Colors.white),
                            // ),
                            // Text(
                            //   model.currentUser.,
                            //   style: TextStyle(color: Colors.white),
                            // ),
                            //Text(model.currentUser.id,

                            //style: TextStyle( color: Colors.white),
                            //)
                            // Column(children: <Widget>[
                            // ClipRRect(
                            //   child: RaisedButton(color:  Color.fromRGBO(38, 47, 62, 1),
                            //       onPressed: () {
                            //         Navigator.push(
                            //             context,
                            //             MaterialPageRoute(
                            //                 builder: (context) => (ProfilePage(
                            //                     id: model.currentUser.id))));
                            //       },
                            //       child: Text(
                            //         "Change Your Picture",
                            //         style: TextStyle(
                            //             color: Colors.white),
                            //       )),
                            //   borderRadius: BorderRadius.circular(15),
                            // )

                            //child:
                            // ]),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                RaisedButton(
                                  color: Color(0xff476cfb),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  elevation: 4.0,
                                  splashColor: Colors.blueGrey,
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16.0),
                                  ),
                                ),
                                RaisedButton(
                                  color: Color(0xff476cfb),
                                  onPressed: () {
                                    // uploadPic(context, model.currentUser.id,
                                    //     model.currentUser.image);
                                    uploadFile();
                                    print(model.currentUser.image);
                                  },
                                  elevation: 4.0,
                                  splashColor: Colors.blueGrey,
                                  child: Text(
                                    'Submit',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16.0),
                                  ),
                                ),
                              ],
                           )
                          ],
                        ))),
                    ListTile(
                        leading: Icon(Icons.person),
                        title: Text(
                          "Profile",
                          style: TextStyle(fontSize: 18),
                        ),
                        onTap:()=>{ if(_image!=null){Navigator.push(context,
                              MaterialPageRoute(builder: (context) => ProfilePageUser(
images:_image
                    
                              ))),}
                              //debugPrint("HKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK"),debugPrint(_authenticationService.currentUser.image)
                              else if(_authenticationService.currentUser.image!=null){

                              Navigator.push(context,
                              MaterialPageRoute(builder: (context) => ProfilePageUser(
image:_authenticationService.currentUser.image,
                    
                              ))),}
                              else{
                                Navigator.push(context,
                              MaterialPageRoute(builder: (context) => ProfilePageUser(
image:  "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Circle-icons-profile.svg/240px-Circle-icons-profile.svg.png",
                    
                                ),)),}
                              
                              
                              
                              
                              }




                        
                        
                        ),
                    ListTile(
                        leading: Icon(Icons.question_answer),
                        title: Text(
                          "Survey",
                          style: TextStyle(fontSize: 18),
                        ),
                        onTap: () {
                          Navigator.push(context,
                               MaterialPageRoute(builder: (context) => App()));
                        }),
                    ListTile(
                        leading: Icon(Icons.games),
                        title: Text(
                          "Game",
                          style: TextStyle(fontSize: 18),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AnimalQuizz()));
                        }),
                          ListTile(
                        leading: Icon(Icons.games),
                        title: Text(
                          "About Us",
                          style: TextStyle(fontSize: 18),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AboutUsPage()));
                        }),
                          ListTile(
                        leading: Icon(Icons.games),
                        title: Text(
                          "About Us",
                          style: TextStyle(fontSize: 18),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AnimalQuizz()));
                        }),
                    ListTile(
                        leading: Icon(Icons.arrow_back),
                        title: Text(
                          "Logout",
                          style: TextStyle(fontSize: 18),
                        ),
                        onTap: () async {
                          
                       await model.signOut();
                        }),
                  ],
                ),
              ),
            ));
  }else if(_authenticationService.currentUser.userRole=="Admin"){

 return ViewModelProvider<HomeViewModel>.withConsumer(
        viewModel: HomeViewModel(),
        onModelReady: (model) =>model.listenToPosts(),
        builder: (context, model, child) => ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Drawer(
                child: Column(
                  children: <Widget>[
                    Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(20),
                        color: Color.fromRGBO(38, 47, 62, 1),
                        child: Center(
                            child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                             VSpacer(0.03),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.center,
                                  child: CircleAvatar(
                                    radius: 80,
                                    backgroundColor: Color(0xff476cfb),
                                    child: ClipOval(
                                      child: new SizedBox(
                                          width: 150.0,
                                          height: 150.0,
                                          child: (_image != null &&
                                                  model.currentUser.image !=
                                                      null)
                                              ?
                                              // getImagefinal(model.currentUser.image)
                                              Image.file(
                                                  _image,
                                                  fit: BoxFit.fill,
                                                  scale: 0.5,
                                                )
                                              : (model.currentUser.image ==
                                                      null)
                                                  ? Image.network(
                                                      "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Circle-icons-profile.svg/480px-Circle-icons-profile.svg.png",
                                                      scale: 0.5,
                                                      fit: BoxFit.fill,
                                                    )
                                                  : (_image == null &&
                                                          model.currentUser
                                                                  .image !=
                                                              null)
                                                      ? Image.network(
                                                          _authenticationService
                                                              .currentUser
                                                              .image,

                                                          //  _uploadedFileURL,
                                                          scale: 0.5,
                                                          fit: BoxFit.fill,
                                                        )
                                                      : Image.network(
                                                          "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Circle-icons-profile.svg/240px-Circle-icons-profile.svg.png",
                                                          scale: 0.5,
                                                          fit: BoxFit.fill,
                                                        )),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 150.0),
                                  child: IconButton(
                                    icon: Icon(
                                      FontAwesomeIcons.camera,
                                      size: 20.0,
                                    ),
                                    onPressed: () {
                                      chooseFile();
                                      //uploadFile();
                                      //print(getImagefinal(model.currentUser.image));

                                      print(model.currentUser.image +
                                          "HIIIIIIIIIIIIIIIi");

                                      // print(dbRef);
                                      // _image=model.currentUser.image as File;
                                    },
                                  ),
                                ),
                              ],
                            ),

                            Text(
                              model.currentUser.fullName,
                              style:
                                  TextStyle(fontSize: 22, color: Colors.white),
                            ),
                            // Text(model.currentUser.image,style: TextStyle(fontSize: 10, color: Colors.white),
                            // ),
                            // Text(
                            //   model.currentUser.email,
                            //   style: TextStyle(color: Colors.white),
                            // ),
                            //Text(model.currentUser.id,

                            //style: TextStyle( color: Colors.white),
                            //)
                            // Column(children: <Widget>[
                            // ClipRRect(
                            //   child: RaisedButton(color:  Color.fromRGBO(38, 47, 62, 1),
                            //       onPressed: () {
                            //         Navigator.push(
                            //             context,
                            //             MaterialPageRoute(
                            //                 builder: (context) => (ProfilePage(
                            //                     id: model.currentUser.id))));
                            //       },
                            //       child: Text(
                            //         "Change Your Picture",
                            //         style: TextStyle(
                            //             color: Colors.white),
                            //       )),
                            //   borderRadius: BorderRadius.circular(15),
                            // )

                            //child:
                            // ]),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                RaisedButton(
                                  color: Color(0xff476cfb),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  elevation: 4.0,
                                  splashColor: Colors.blueGrey,
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16.0),
                                  ),
                                ),
                                RaisedButton(
                                  color: Color(0xff476cfb),
                                  onPressed: () {
                                    // uploadPic(context, model.currentUser.id,
                                    //     model.currentUser.image);
                                    uploadFile();
                                    print(model.currentUser.image);
                                  },
                                  elevation: 4.0,
                                  splashColor: Colors.blueGrey,
                                  child: Text(
                                    'Submit',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16.0),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ))),
                    ListTile(
                        leading: Icon(Icons.person),
                        title: Text(
                          "Profile",
                          style: TextStyle(fontSize: 18),
                        ),
                        onTap: ()=>{ Navigator.push(context,
                              MaterialPageRoute(builder: (context) => ProfilePageUser())), debugPrint("HKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK"),debugPrint(_authenticationService.currentUser.image),debugPrint(_authenticationService.currentUser.likedtours.toString())}),
                    ListTile(
                        leading: Icon(Icons.favorite),
                        title: Text(
                          "Create Tour",
                          style: TextStyle(fontSize: 18),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CreatepageView()));
                        }),
                    ListTile(
                        leading: Icon(Icons.question_answer),
                        title: Text(
                          "Survey",
                          style: TextStyle(fontSize: 18),
                        ),
                        onTap: () {
                          Navigator.push(context,
                           MaterialPageRoute(builder: (context) => App()));
                        }),
                    // ListTile(
                    //     leading: Icon(Icons.games),
                    //     title: Text(
                    //       "Game",
                    //       style: TextStyle(fontSize: 18),
                    //     ),
                    //     onTap: () {
                    //       Navigator.push(
                    //           context,
                    //           MaterialPageRoute(
                    //               builder: (context) => AnimalQuizz()));
                    //     }),
                          ListTile(
                        leading: Icon(Icons.info),
                        title: Text(
                          "About Us",
                          style: TextStyle(fontSize: 18),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AboutUsPage()));
                        }),
                    ListTile(
                        leading: Icon(Icons.arrow_back),
                        title: Text(
                          "Logout",
                          style: TextStyle(fontSize: 18),
                        ),
                        onTap: () async {
                      await model.signOut();
                        }),
                  ],
                ),
              ),
            ));
  }



  }
  
  
  
 

  // getImagefinal(String imagefinal) {
  //   print(imagefinal + "hiiiiiiii");
  //   if (imagefinal != null && _image == null) {
  //     debugPrint("11111111111111111111111");
  //     return Image.network(
  //       imagefinal,
  //       fit: BoxFit.fill,
  //       scale: 0.5,
  //     );
  //   } else {
  //     debugPrint("2222222222222222222222222222222222");
  //     Image.file(
  //       _image,
  //       fit: BoxFit.fill,
  //       scale: 0.5,
  //     );
  //   }
  // }
}

//   //}

//   // String imagee(String image) {
//   //   if (image == null) {
//   //     return "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Circle-icons-profile.svg/240px-Circle-icons-profile.svg.png";
//   //   } else
//   //     return image;
//   // }
//   // else return Container(child:Text("null"));

// }
// // );}

// //        }
