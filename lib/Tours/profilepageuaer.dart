import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gawlah/Tours/Tours_Pager.dart';
import 'package:flutter_gawlah/locator.dart';
import 'package:flutter_gawlah/services/authentication_service.dart';
import 'package:flutter_gawlah/verticalspacer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:path/path.dart' as Path;

import 'brew_list.dart';

class ProfilePageUser extends StatefulWidget {
  final String image;
  final File images;

  const ProfilePageUser({Key key, this.image,this.images}) : super(key: key);
  @override
  _ProfilePageUserState createState() => _ProfilePageUserState();
}

class _ProfilePageUserState extends State<ProfilePageUser> {
  File _image;
  String imagee;
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
        final CollectionReference _usersCollectionReference =
      Firestore.instance.collection('Users');
       String _uploadedFileURL;
       String liked;
  @override
  Widget build(BuildContext context) {

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
 imge(String name) async {
      DocumentSnapshot ds =
          await Firestore.instance.collection('Users').document(_authenticationService.currentUser.fullName).get();
     imagee=ds.data['image'].toString();
     
     return ds.data['image'].toString();
    }

   likedtours(String name) async {
      DocumentSnapshot ds =
          await Firestore.instance.collection('Users').document(_authenticationService.currentUser.fullName).get();
    liked=ds.data['likedtours'].toString();
     
     return ds.data['likedtours'].toString();
    }

    Future uploadFile() async {
      StorageReference storageReference = FirebaseStorage.instance
          .ref()
          .child('chats/${Path.basename(_image.path)}}');
      StorageUploadTask uploadTask = storageReference.putFile(_image);
      await uploadTask.onComplete;
      print('File Uploaded');
      Scaffold.of(context).showSnackBar(SnackBar(content: Text('In order to the new image to have to restart your application')));
      

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
      });}
    return Scaffold(

      backgroundColor: Color.fromRGBO(38, 47, 62, 1),
        //appBar: AppBar(
          // leading: IconButton(
          //     icon: Icon(FontAwesomeIcons.arrowLeft),
          //     onPressed: () {
          //       Navigator.pop(context);
            //  }),
         
      //  ),
        body: Builder(
        builder: (context) =>   Container(
                        child: Stack(children: <Widget>[
                       //   VSpacer(0.1),
                      ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                          child: Container(
                            color: Colors.black38.withOpacity(0.5),
                          ),
                        ),
                      ),
                  
               Container(
      
                        child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  VSpacer(0.08),
                  SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(width: 35,),
                     
                       CircleAvatar(
                          
                          radius: 90,
                          backgroundColor: Color(0xff476cfb),
                          child: ClipOval(
                            child: new SizedBox(
                              width: 170.0,
                              height: 170.0,
                              child: widget.image!=null?{Image.network(widget.image)
                              }:widget.images!=null?{Image.file(widget.images)}:
                              Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Circle-icons-profile.svg/240px-Circle-icons-profile.svg.png")

                              
                              )
                          
                            
                            
                          ),
                        ),
                      
                      SizedBox(width: 10,),
                      Padding(
                        padding: EdgeInsets.only(top: 150.0),
                        child: IconButton(
                          icon: Icon(
                            FontAwesomeIcons.camera,color: Colors.grey,
                            size: 25.0,
                          ),
                          onPressed: () {
                           chooseFile();
                        //   debugPrint(imge(_authenticationService.currentUser.fullName).toString());
                          },
                        ),
                      ),
                    ],
                  ),
                
                  
SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Row(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text('User Role  ',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 18.0)),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text( _authenticationService.currentUser.userRole,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Align(
                      //   alignment: Alignment.centerRight,
                      //   child: Container(
                      //     child: IconButton(
                      //       FontAwesomeIcons.pen,
                      //       color: Color(0xff476cfb),onPressed: ,
                      //     ),
                          
                      //   ),
                      // ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          child: Row(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Username  ',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 18.0)),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(_authenticationService.currentUser.fullName,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        ),
                      ),
                       
                      // Align(
                      //   alignment: Alignment.centerRight,
                      //   child: Container(
                      //     child: Icon(
                      //       FontAwesomeIcons.pen,
                      //       color: Color(0xff476cfb),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),SizedBox(
                    height: 20.0,
                  ),

                    // Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // children: <Widget>[
                    //   Align(
                    //     alignment: Alignment.centerLeft,
                    //     child: Container(
                    //       child: Row(
                    //         children: <Widget>[
                    //           Align(
                    //             alignment: Alignment.centerLeft,
                    //             child: Text('Email  ',
                    //                 style: TextStyle(
                    //                     color: Colors.grey, fontSize: 18.0)),
                              //),
                              // Align(
                              //   alignment: Alignment.centerLeft,
                              //   child: Text( _authenticationService.currentUser.email,
                              //       style: TextStyle(
                              //           color: Colors.white,
                              //           fontSize: 20.0,
                              //           fontWeight: FontWeight.bold)),
                              // ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // Align(
                      //   alignment: Alignment.centerRight,
                      //   child: Container(
                      //     child: IconButton(
                      //       FontAwesomeIcons.pen,
                      //       color: Color(0xff476cfb),onPressed: ,
                      //     ),
                          
                      //   ),
                      // ),
                  //   ],
                  // ),







                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Row(
                            children: <Widget>[
                            
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Liked Tours  ',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 18.0)),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                 liked!=null? liked:"No liked Tours Yet!",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold)),
                              ),

                            ],
                          ),
                        ),
                      ),
                      // Align(
                      //   alignment: Alignment.centerRight,
                      //   child: Container(
                      //     child: Icon(
                      //       FontAwesomeIcons.pen,
                      //       color: Color(0xff476cfb),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Row(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Liked places ',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 18.0)),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text( _authenticationService.currentUser.likedplaces!=null? _authenticationService.currentUser.likedplaces.join(','):"No liked Places Yet!",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Align(
                      //   alignment: Alignment.centerRight,
                      //   child: Container(
                      //     child: IconButton(
                      //       FontAwesomeIcons.pen,
                      //       color: Color(0xff476cfb),onPressed: ,
                      //     ),
                          
                      //   ),
                      // ),
                    ],
                  ),
                  // Container(
                  //   margin: EdgeInsets.all(20.0),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     children: <Widget>[
                  //       Text('Email',
                  //           style:
                  //               TextStyle(color: Colors.grey, fontSize: 18.0)),
                  //       SizedBox(width: 20.0),
                  //       Text(_authenticationService.currentUser.email,
                  //           style: TextStyle(
                  //               color: Colors.white,
                  //               fontSize: 20.0,
                  //               fontWeight: FontWeight.bold)),
                  //     ],
                  //   ),
                  // ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ClipOval(
                                          child: RaisedButton(
                          color: Color(0xff476cfb),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          elevation: 4.0,
                          splashColor: Colors.white,
                          child: Text(
                            'Cancel',
                            style: TextStyle(color: Colors.white, fontSize: 16.0),
                          ),
                        ),
                      ),
                      ClipOval(
                                          child: RaisedButton(
                          color: Color(0xff476cfb),
                          onPressed: () {
                           uploadFile();
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>TourList2()));
                          },
                                           
                          elevation: 4.0,
                          splashColor: Colors.white,
                          child: Text(
                            'Submit',
                            style: TextStyle(color: Colors.white, fontSize: 16.0),
                          ),
                        ),
                      ),
                  
                    ],
                  )
                ],
              ),
            ),  ])),
        ), 
      
       // ),
        );
  }
}