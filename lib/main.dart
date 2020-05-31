import 'package:flutter/material.dart';
import 'package:flutter_gawlah/Image.dart';
import 'package:flutter_gawlah/Tours/Tours_Pager.dart';
import 'package:flutter_gawlah/map_widgets/mvc.dart';
import 'package:flutter_gawlah/tourlocation.dart';
import 'package:flutter_gawlah/ui/views/create_post_view.dart';
import 'package:flutter_gawlah/ui/views/home_view.dart';
import 'package:flutter_gawlah/ui/views/home_view_places.dart';


import 'package:flutter_gawlah/ui/views/login_view.dart';
import 'package:flutter_gawlah/ui/views/signup_view.dart';
import 'Tours/brew_list.dart';
import 'services/navigation_service.dart';
import 'services/dialog_service.dart';

import 'managers/dialog_manager.dart';
import 'ui/router.dart';
import 'locator.dart';

import 'package:flutter_gawlah/splashscreen.dart';
void main() {
  // Register all the models and services before the app starts
  setupLocator();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Compound',
      builder: (context, child) => Navigator(
        key: locator<DialogService>().dialogNavigationKey,
        onGenerateRoute: (settings) => MaterialPageRoute(
            builder: (context) => DialogManager(child: child)),
      ),
      navigatorKey: locator<NavigationService>().navigationKey,
      theme: ThemeData(
        primaryColor: Color(0xff19c7c1),
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'Open Sans',
            ),
      ),
      home:  
      //TourList2(),
      //SignUpView(),
     //SplashScreen(),
   LoginView(),
  //WebViewTest(),
 // HomeViewPlace(),
    //MapsDemo(),
   // CreatePostView(),
// BrewList(),
    //SaveImageDemo(),
    //HomeView(),
      //MyHomePage(),
      onGenerateRoute: generateRoute,
    );
  }
}



// import 'package:flutter/material.dart';
// import 'profilepage.dart';
// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Image App Demo',
//       theme: ThemeData(
//         primaryColor: Color(0xff476cfb),
//       ),
//       home: ProfilePage(),
//     );
//   }
// }


// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/widgets.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';

// void main() async {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: ImageCapture(),
//     );
//   }
// }


// /// Widget to capture and crop the image
// class ImageCapture extends StatefulWidget {
//   createState() => _ImageCaptureState();
// }

// class _ImageCaptureState extends State<ImageCapture> {
//   /// Active image file
//   File _imageFile;

//   /// Cropper plugin
//   Future<void> _cropImage() async {
//     File cropped = await ImageCropper.cropImage(
//         sourcePath: _imageFile.path,
//         // ratioX: 1.0,
//         // ratioY: 1.0,
//         // maxWidth: 512,
//         // maxHeight: 512,
//         toolbarColor: Colors.purple,
//         toolbarWidgetColor: Colors.white,
//         toolbarTitle: 'Crop It'
//       );

//     setState(() {
//       _imageFile = cropped ?? _imageFile;
//     });
//   }

//   /// Select an image via gallery or camera
//   Future<void> _pickImage(ImageSource source) async {
//     File selected = await ImagePicker.pickImage(source: source);

//     setState(() {
//       _imageFile = selected;
//     });
//   }

//   /// Remove image
//   void _clear() {
//     setState(() => _imageFile = null);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

//       // Select an image from the camera or gallery
//       bottomNavigationBar: BottomAppBar(
//         child: Row(
//           children: <Widget>[
//             IconButton(
//               icon: Icon(Icons.photo_camera),
//               onPressed: () => _pickImage(ImageSource.camera),
//             ),
//             IconButton(
//               icon: Icon(Icons.photo_library),
//               onPressed: () => _pickImage(ImageSource.gallery),
//             ),
//           ],
//         ),
//       ),

//       // Preview the image and crop it
//       body: ListView(
//         children: <Widget>[
//           if (_imageFile != null) ...[

//             Image.file(_imageFile),

//             Row(
//               children: <Widget>[
//                 FlatButton(
//                   child: Icon(Icons.crop),
//                   onPressed: _cropImage,
//                 ),
//                 FlatButton(
//                   child: Icon(Icons.refresh),
//                   onPressed: _clear,
//                 ),
//               ],
//             ),

//             Uploader(file: _imageFile)
//           ]
//         ],
//       ),
//     );
//   }
// }

//  class Uploader extends StatefulWidget {
//  final File file;
 
//  Uploader ({Key key,this.file}) : super(key: key);

//   @override
// _UploaderState createState() =>_UploaderState();
// }


// class _UploaderState extends State<Uploader> {
//   final FirebaseStorage _storage =
//       FirebaseStorage(storageBucket: 'gs://flutter-gawlah-3fd03.appspot.com');

//   StorageUploadTask _uploadTask;

//   /// Starts an upload task
//   void _startUpload() {

//     /// Unique file name for the file
//     String filePath = 'images/${DateTime.now()}.png';

//     setState(() {
//       _uploadTask = _storage.ref().child(filePath).putFile(widget.file);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (_uploadTask != null) {

//       /// Manage the task state and event subscription with a StreamBuilder
//       return StreamBuilder<StorageTaskEvent>(
//           stream: _uploadTask.events,
//           builder: (_, snapshot) {
//             var event = snapshot?.data?.snapshot;

//             double progressPercent = event != null
//                 ? event.bytesTransferred / event.totalByteCount
//                 : 0;

//             return Column(

//                 children: [
//                   if (_uploadTask.isComplete)
//                     Text('🎉🎉🎉'),


//                   if (_uploadTask.isPaused)
//                     FlatButton(
//                       child: Icon(Icons.play_arrow),
//                       onPressed: _uploadTask.resume,
//                     ),

//                   if (_uploadTask.isInProgress)
//                     FlatButton(
//                       child: Icon(Icons.pause),
//                       onPressed: _uploadTask.pause,
//                     ),

//                   // Progress bar
//                   LinearProgressIndicator(value: progressPercent),
//                   Text(
//                     '${(progressPercent * 100).toStringAsFixed(2)} % '
//                   ),
//                 ],
//               );
//           });

          
//     } else {

//       // Allows user to decide when to start the upload
//       return FlatButton.icon(
//           label: Text('Upload to Firebase'),
//           icon: Icon(Icons.cloud_upload),
//           onPressed: _startUpload,
//         );

//     }
//   }
// }

















// import 'package:flutter/material.dart';
// import 'package:rate_my_app/rate_my_app.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Flutter Rating Prompt'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   RateMyApp _rateMyApp = RateMyApp(
//     preferencesPrefix: 'rateMyApp_',
//     minDays: 3,
//     minLaunches: 7,
//     remindDays: 2,
//     remindLaunches: 5,
//     // appStoreIdentifier: '',
//     // googlePlayIdentifier: '',
//   );

//   @override
//   void initState() {
//     super.initState();
//     _rateMyApp.init().then((_) {
//       // TODO: Comment out this if statement to test rating dialog (Remember to uncomment)
//       // if (_rateMyApp.shouldOpenDialog) {
//         _rateMyApp.showStarRateDialog(
//           context,
//           title: 'Enjoying Flutter Rating Prompt?',
//           message: 'Please leave a rating!',
//           onRatingChanged: (stars) {
//             return [
//               FlatButton(
//                 child: Text('Ok'),
//                 onPressed: () {
//                   if (stars != null) {
//                     _rateMyApp.doNotOpenAgain = true;
//                     _rateMyApp.save().then((v) => Navigator.pop(context));

//                     if (stars <= 3) {
//                       print('Navigate to Contact Us Screen');
//                       // Navigator.push(
//                       //   context,
//                       //   MaterialPageRoute(
//                       //     builder: (_) => ContactUsScreen(),
//                       //   ),
//                       // );
//                     } else if (stars <= 5) {
//                       print('Leave a Review Dialog');
//                       // showDialog(...);
//                     }
//                   } else {
//                     Navigator.pop(context);
//                   }
//                 },
//               ),
//             ];
//           },
//           dialogStyle: DialogStyle(
//             titleAlign: TextAlign.center,
//             messageAlign: TextAlign.center,
//             messagePadding: EdgeInsets.only(bottom: 20.0),
//           ),
//           starRatingOptions: StarRatingOptions(),
//         );
//       // }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'home_screen.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Medium - Rating Dialog',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: HomePage(),
//     );
//   }
// }



// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// import 'dart:io';
// import 'dart:math';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       home: MyHomePage(),
//     );
//   }
// }





























































///DIALOGFLOW///
// import 'package:flutter/material.dart';
// import 'package:flutter_dialogflow/dialogflow_v2.dart';

// void main() => runApp(new MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       title: 'Example Dialogflow Flutter',
//       theme: new ThemeData(
//         primarySwatch: Colors.deepOrange,
//       ),
//       debugShowCheckedModeBanner: false,
//       home: new HomePageDialogflow(),
//     );
//   }
// }

// class HomePageDialogflow extends StatefulWidget {
//   HomePageDialogflow({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _HomePageDialogflow createState() => new _HomePageDialogflow();
// }

// class _HomePageDialogflow extends State<HomePageDialogflow> {
//   final List<ChatMessage> _messages = <ChatMessage>[];
//   final TextEditingController _textController = new TextEditingController();

//   Widget _buildTextComposer() {
//     return new IconTheme(
//       data: new IconThemeData(color: Theme.of(context).accentColor),
//       child: new Container(
//         margin: const EdgeInsets.symmetric(horizontal: 8.0),
//         child: new Row(
//           children: <Widget>[
//             new Flexible(
//               child: new TextField(
//                 controller: _textController,
//                 onSubmitted: _handleSubmitted,
//                 decoration:
//                     new InputDecoration.collapsed(hintText: "Send a message"),
//               ),
//             ),
//             new Container(
//               margin: new EdgeInsets.symmetric(horizontal: 4.0),
//               child: new IconButton(
//                   icon: new Icon(Icons.send),
//                   onPressed: () => _handleSubmitted(_textController.text)),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void Response(query) async {
//     _textController.clear();
//     AuthGoogle authGoogle =
//         await AuthGoogle(fileJson: "images_and_icons/flutter-gawlah-3fd03-d0f9ae334cc5.json")
//             .build();
//     Dialogflow dialogflow =
//         Dialogflow(authGoogle: authGoogle, language: Language.english);
//     AIResponse response = await dialogflow.detectIntent(query);
//     ChatMessage message = new ChatMessage(
//       text: response.getMessage() ??
//           new CardDialogflow(response.getListMessage()[0]).title,
//       name: "Bot",
//       type: false,
//     );
//     setState(() {
//       _messages.insert(0, message);
//     });
//   }

//   void _handleSubmitted(String text) {
//     _textController.clear();
//     ChatMessage message = new ChatMessage(
//       text: text,
//       name: "Promise",
//       type: true,
//     );
//     setState(() {
//       _messages.insert(0, message);
//     });
//     Response(text);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: new AppBar(
//         centerTitle: true,
//         title: new Text("Flutter and Dialogflow"),
//       ),
//       body: new Column(children: <Widget>[
//         new Flexible(
//             child: new ListView.builder(
//           padding: new EdgeInsets.all(8.0),
//           reverse: true,
//           itemBuilder: (_, int index) => _messages[index],
//           itemCount: _messages.length,
//         )),
//         new Divider(height: 1.0),
//         new Container(
//           decoration: new BoxDecoration(color: Theme.of(context).cardColor),
//           child: _buildTextComposer(),
//         ),
//       ]),
//     );
//   }
// }

// class ChatMessage extends StatelessWidget {
//   ChatMessage({this.text, this.name, this.type});

//   final String text;
//   final String name;
//   final bool type;

//   List<Widget> otherMessage(context) {
//     return <Widget>[
//       new Container(
//         margin: const EdgeInsets.only(right: 16.0),
//         child: new CircleAvatar(child: new Text('B')),
//       ),
//       new Expanded(
//         child: new Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             new Text(this.name,
//                 style: new TextStyle(fontWeight: FontWeight.bold)),
//             new Container(
//               margin: const EdgeInsets.only(top: 5.0),
//               child: new Text(text),
//             ),
//           ],
//         ),
//       ),
//     ];
//   }

//   List<Widget> myMessage(context) {
//     return <Widget>[
//       new Expanded(
//         child: new Column(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: <Widget>[
//             new Text(this.name, style: Theme.of(context).textTheme.subhead),
//             new Container(
//               margin: const EdgeInsets.only(top: 5.0),
//               child: new Text(text),
//             ),
//           ],
//         ),
//       ),
//       new Container(
//         margin: const EdgeInsets.only(left: 16.0),
//         child: new CircleAvatar(
//             child: new Text(
//           this.name[0],
//           style: new TextStyle(fontWeight: FontWeight.bold),
//         )),
//       ),
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Container(
//       margin: const EdgeInsets.symmetric(vertical: 10.0),
//       child: new Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: this.type ? myMessage(context) : otherMessage(context),
//       ),
//     );
//   }
// }
