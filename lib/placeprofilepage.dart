import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gawlah/placelocation.dart';
import 'package:flutter_gawlah/services/authentication_service.dart';
import 'package:flutter_gawlah/tourlocation.dart';
import 'package:flutter_gawlah/ui/shared/ui_helpers.dart';
import 'package:flutter_gawlah/ui/views/create_post_view.dart';
import 'package:flutter_gawlah/verticalspacer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:path/path.dart';

import 'locator.dart';

class ProfilePagePlace extends StatefulWidget {
  //final String id;

 // const ProfilePage({Key key, this.id}) : super(key: key);
  @override
  _ProfilePagePLaceState createState() => _ProfilePagePLaceState();
}

class _ProfilePagePLaceState extends State<ProfilePagePlace> {
  File _image;
  String image="https://images.unsplash.com/photo-1502164980785-f8aa41d53611?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60";

final CollectionReference _usersCollectionReference =
      Firestore.instance.collection('Users');
       final AuthenticationService _authenticationService =
   locator<AuthenticationService>();
  @override
  Widget build(BuildContext context) {


 Future getImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);

      setState(() {
     _image = image;
     //getImagefinal(imagee);
    // print(getImagefinal(imagee));
          print('Image Path $_image');
      });
    }


      Future  _addPathToDatabase(String text) async {
    try {
      // Get image URL from firebase
      final ref = FirebaseStorage().ref().child(text);
      var imageString = await ref.getDownloadURL();
      
     // await _usersCollectionReference.document(widget.id).updateData({'image':imageString});
 
setState(() {
  // MapsDemo(image:imageString);

   Navigator.push(context, MaterialPageRoute(builder:(context)=>MapsPlace(image:imageString)));
  
 
   debugPrint(imageString+"PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP");
});
      // Add location and url to database    

    }catch(e){
      print(e.message);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message),
            );
          }
      );
    }
  }


    Future  uploadPic(BuildContext context) async{
     if(_image!=null){
      String fileName = basename(_image.path);
       StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child(fileName);
       StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
       StorageTaskSnapshot taskSnapshot=await uploadTask.onComplete;

        
   
       
       setState(() {
          print("Profile Picture uploaded");
         // print(fileName);
         
           _addPathToDatabase(fileName); 
     
          Scaffold.of(context).showSnackBar(SnackBar(content: Text('Profile Picture Uploaded')));
       });

     }
     else{
     
    Navigator.push(context, MaterialPageRoute(builder:(context)=>MapsPlace(image:image)));

     }
     
    }




    return Scaffold(
  
        body: Builder(
        builder: (context) =>  Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
            VSpacer(0.15),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Image",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,fontFamily: "DancingScript"),),
                  verticalSpaceSmall,
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                   //   radius: 100,
                     // backgroundColor: Color(0xff476cfb),
                    //  child: ClipOval(
                        child: new SizedBox(
                          width: MediaQuery.of(context).size.width-50,
                          height: MediaQuery.of(context).size.height-300,
                          child: (_image!=null)?Image.file(
                            _image,
                            fit: BoxFit.fill,
                          ):Image.network(
                            "https://images.unsplash.com/photo-1502164980785-f8aa41d53611?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                            fit: BoxFit.fill,
                          ),
                        ),
                     // ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: IconButton(
                      icon: Icon(
                        FontAwesomeIcons.camera,
                        size: 30.0,
                      ),
                      onPressed: () {
                        getImage();
                      },
                    ),
                  ),
                ],
              ),
        
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[

                  ClipOval(
                                      child: RaisedButton(
                      color: Color(0xff476cfb),
                      onPressed: () {
                       uploadPic(context);
                      
                     //  _addPathToDatabase(_image.path.toString());
                      },
                                       
                      elevation: 4.0,
                      splashColor: Colors.blueGrey,
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
        ),
        ),
        );


        
  }


  
}