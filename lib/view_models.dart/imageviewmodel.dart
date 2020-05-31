

// import 'dart:async';

// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_gawlah/models/user.dart';
// import 'package:flutter_gawlah/view_models.dart/imageviewmodel.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:provider_architecture/viewmodel_provider.dart';

// import 'dart:io';
// import 'dart:math';



// class MyHomePageadmin extends StatefulWidget {
//   final String id;
//   String doc;
//    User user;
//   String uid;


//   MyHomePageadmin({Key key, this.id}) : super(key: key);
//   @override _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePageadmin> {
//  final CollectionReference _usersCollectionReference =
//       Firestore.instance.collection('tours');
     


//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       appBar: AppBar(
//         title: Text('Firebase Storage'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             new Flexible(
//                 child: _buildBody(context),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed:(){
//          // model.editPost();
//            getImage();

 
//         } ,
//         child: Icon(Icons.add_a_photo),
      
//     ));
//   }

//   Widget _buildBody(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: _usersCollectionReference.where('id',isEqualTo: widget.id).snapshots(),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) return LinearProgressIndicator();

//         return _buildList(context);
//       },
//     );
//   }

//   Widget _buildList(BuildContext context) {
//     return ListView(
//         padding: const EdgeInsets.only(top: 20.0),
//         //children: snapshot.map((data) => _buildListItem(context, data)).toList()
//     );
//   }

//   Widget _buildListItem(BuildContext context) {
//     //final record = Record.fromSnapshot(data);

//     return Padding(
//        // key: ValueKey(record.location),
//         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//         child: Container(
//           decoration: BoxDecoration(
//             border: Border.all(color: Colors.grey),
//             borderRadius: BorderRadius.circular(5.0),
//           ),
//           child: ListTile(
//             title: Column(
//               children: <Widget>[
              
//               ],
//             ),
//           ),
//         ),
//       );
//   }

//     void updateData() async {
//   QuerySnapshot querySnapshot = await _usersCollectionReference.where('id',isEqualTo: widget.id).getDocuments();
//  for (int i = 0; i < querySnapshot.documents.length; i++) {
//     var a = querySnapshot.documents[i];
//     print("HIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII");
//     print(a.documentID);
//     widget.doc=a.documentID.toString();
//     debugPrint(widget.doc);
//    // return a.documentID.toString();
//   }
 
 
// }

 



//   Future getImage() async {
//     // Get image from gallery.
//     var image = await ImagePicker.pickImage(source: ImageSource.gallery);
//     _uploadImageToFirebase(image);
//   }

//    Future<void> _uploadImageToFirebase(File image) async {
//    try {
//       // Make random image name.
//       int randomNumber = Random().nextInt(100000);
//       String imageLocation = 'images/image${randomNumber}.jpg';

//       // Upload image to firebase.
//       final StorageReference storageReference = FirebaseStorage().ref().child(imageLocation);
//       final StorageUploadTask uploadTask = storageReference.putFile(image);
//       await uploadTask.onComplete;
//       _addPathToDatabase(imageLocation);
//     }catch(e){
//       print(e.message);
//     }
//   }
  

//   Future<void> _addPathToDatabase(String text) async {
//     try {
//       // Get image URL from firebase
//       final ref = FirebaseStorage().ref().child(text);
//       var imageString = await ref.getDownloadURL();
   

//       // Add location and url to database
//       await _usersCollectionReference.document(widget.id).updateData({'image':imageString});
//     }catch(e){
//       print(e.message);
//       showDialog(
//           context: context,
//           builder: (context) {
//             return AlertDialog(
//               content: Text(e.message),
//             );
//           }
//       );
//     }
//   }

// }
