import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gawlah/diagonal.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:video_player/video_player.dart';
import 'vedio.dart';

class PlaceProfile extends StatefulWidget {
  final String image;
  final String info;
  final String vid;
  final String name;
  final String tag;

  const PlaceProfile({Key key, this.name, this.tag,this.image, this.info, this.vid})
      : super(key: key);

  PlaceProfileState createState() => PlaceProfileState();
}

class PlaceProfileState extends State<PlaceProfile> {
  final FlutterTts flutterTts = FlutterTts();
  final Firestore database = Firestore.instance;
  Stream Mapobjects;
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;


@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Stack(
      children: <Widget>[
        Center(
          child:Scaffold(
        body: Hero(
      tag: widget.tag,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(widget.image, scale: 200.0),
                fit: BoxFit.fitHeight)),
        ),
        )

        )

        ),
        SlidingSheet(
          elevation: 8,
          cornerRadius: 16,

          snapSpec: const SnapSpec(

            // Enable snapping. This is true by default.
            snap: true,
            // Set custom snapping points.
            snappings: [0.1, 0.1, 1.0],
            // Define to what the snappings relate to. In this case,
            // the total available space that the sheet can expand to.
            positioning: SnapPositioning.relativeToAvailableSpace,
          ),
          builder: (context, state) {
            // This is the content of the sheet that will get
            // scrolled, if the content is bigger than the available
            // height of the sheet.
            return Container(
              color: Colors.blueGrey[100],
              height: MediaQuery.of(context).size.height,
              child: Stack(children: <Widget>[
                Container(child:
                  _buildProfileRow(),
                  

                ),
Container(
child:_buildMyTasksHeader(widget.info,context),

),

          //     Center(
          //          child: Card(
          //     color: Colors.transparent,
          //     child: Text(
          //       widget.info,
          //       style: TextStyle(
          //         fontSize: 20,
          //         color: Colors.white,
          //         fontWeight: FontWeight.bold,
          //         // backgroundColor: Colors.black
          //       ),
          //     ),
          //   ),
          // ),
          SizedBox(height:20),
           Container(
            alignment: Alignment.bottomLeft,
            //hena haykhod el info mn el database
            child: FloatingActionButton(
              backgroundColor: Colors.transparent,
              child: Icon(Icons.volume_up),
              onPressed: () => speak(),
                          ),
                        ),
                         Container(
                            alignment: Alignment.bottomRight,

                            //hena haykhod el info mn el database
                            child: FloatingActionButton(
backgroundColor: Colors.transparent,
                                child: Icon(Icons.video_library),
                                onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => VideoDemo(vid:widget.vid)),
                                    ))),

              ],)

                          );
                        },
                      )
                    ],
                  ),
                );
              }

                speak() async {
    await flutterTts.speak(widget.info);
  }

Widget _buildProfileRow() {
  return new Padding(
    padding: new EdgeInsets.only(left: 16.0, top: 400 /18),
    child: new Row(
      children: <Widget>[
        new CircleAvatar(
          minRadius: 40.0,
          maxRadius: 40.0,
        
          backgroundImage: new NetworkImage(
              "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/Cairo%2C_moschea_di_al-muayyad%2C_tetti%2C_con_cupola_del_mausoleo_e_minareti_di_bab_zuweila%2C_17.JPG/512px-Cairo%2C_moschea_di_al-muayyad%2C_tetti%2C_con_cupola_del_mausoleo_e_minareti_di_bab_zuweila%2C_17.JPG"),
        ),
        new Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Text(
                'Mosque of mo' 'yad ',
                style: new TextStyle(
                    fontSize: 26.0,
                    color: Colors.yellowAccent[300],
                    fontWeight: FontWeight.w400),
              ),
              new Text(
                'Islamic Arts',
                style: new TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}


 Widget _buildMyTasksHeader(String info, BuildContext context) {
  return Stack(
    children: <Widget>[
      new Padding(
        padding: new EdgeInsets.only(left: 50.0,top: 400/3),
        child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(
                'Info',
                style: new TextStyle(fontSize: 34.0,color: Colors.grey),
              ),
              new Text(
                info,
                style: new TextStyle(color: Colors.grey, fontSize: 12.0),
              ),
              SizedBox(height: MediaQuery.of(context).size.height-502),
              
//               // SizedBox(height: 10),
//               // Container(
//               //     alignment: Alignment.bottomRight,

//               //     //hena haykhod el info mn el database
//               //     child: RaisedButton(
//               //         child: Icon(Icons.video_library), onPressed: () => {}
//               //         //Navigator.push(
//               //         //       // context,
//               //         // MaterialPageRoute(builder: (context) => VideoDemo(vid:widget.vid)),
//               //         // )
//               //         )),
            ]),
      ),
    ],
  );
}





}












//   double _imageHeight = 256.0;
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       body: new Stack(
//         children: <Widget>[
//           _buildIamge(),
//           _buildTopHeader(),
//           _buildProfileRow(),
//           _buildBottomPart(widget.info, context),
//         ],
//       ),
//     );
//   }

//   Widget _buildIamge() {
//     return new ClipPath(
//         clipper: new DialogonalClipper(),
//         child: new Image.asset(
//           "images_and_icons/gawlah.png",
//           fit: BoxFit.fitHeight,
//           height: 400,
//           //width: 500,
//           colorBlendMode: BlendMode.srcOver,
//           color: new Color.fromARGB(120, 20, 10, 40),
//         ));
//   }
// }

// Widget _buildTopHeader() {
//   return new Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 32.0),
//     child: new Row(
//       children: <Widget>[
//         new Icon(Icons.menu, size: 32.0, color: Colors.white),
//         new Expanded(
//           child: new Padding(
//             padding: const EdgeInsets.only(left: 8.0),
//             child: new Text(
//               "Timeline",
//               style: new TextStyle(
//                   fontSize: 30.0,
//                   color: Colors.white,
//                   fontWeight: FontWeight.w300),
//             ),
//           ),
//         ),
//         new Icon(Icons.linear_scale, color: Colors.white),
//       ],
//     ),
//   );
// }

// Widget _buildProfileRow() {
//   return new Padding(
//     padding: new EdgeInsets.only(left: 16.0, top: 400 / 2.5),
//     child: new Row(
//       children: <Widget>[
//         new CircleAvatar(
//           minRadius: 40.0,
//           maxRadius: 40.0,
//           backgroundImage: new NetworkImage(
//               "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/Cairo%2C_moschea_di_al-muayyad%2C_tetti%2C_con_cupola_del_mausoleo_e_minareti_di_bab_zuweila%2C_17.JPG/512px-Cairo%2C_moschea_di_al-muayyad%2C_tetti%2C_con_cupola_del_mausoleo_e_minareti_di_bab_zuweila%2C_17.JPG"),
//         ),
//         new Padding(
//           padding: const EdgeInsets.only(left: 16.0),
//           child: new Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               new Text(
//                 'Mosque of mo' 'yad ',
//                 style: new TextStyle(
//                     fontSize: 26.0,
//                     color: Colors.white,
//                     fontWeight: FontWeight.w400),
//               ),
//               new Text(
//                 'Islamic Arts',
//                 style: new TextStyle(
//                     fontSize: 14.0,
//                     color: Colors.white,
//                     fontWeight: FontWeight.w300),
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//   );
// }

// Widget _buildBottomPart(String info, BuildContext context) {
//   return new Padding(
//     padding: new EdgeInsets.only(top: 400),
//     child: new Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         _buildMyTasksHeader(info, context),
//         _buildTasksList(),
//       ],
//     ),
//   );
// }

// //TODO
// Widget _buildTasksList() {
//   return new Container();
// }

// Widget _buildMyTasksHeader(String info, BuildContext context) {
//   return Stack(
//     children: <Widget>[
//       new Padding(
//         padding: new EdgeInsets.only(left: 64.0),
//         child: new Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               new Text(
//                 'Inforamtion',
//                 style: new TextStyle(fontSize: 34.0),
//               ),
//               new Text(
//                 info,
//                 style: new TextStyle(color: Colors.grey, fontSize: 12.0),
//               ),
//               SizedBox(height: MediaQuery.of(context).size.height-502),
//               Container(
                
//                 alignment: Alignment.bottomRight,

//                 //hena haykhod el info mn el database
//                 child: RaisedButton(
//                   color: Colors.transparent,
//                   child: Icon(Icons.volume_up),
//                   onPressed: () => speak(info),
//                 ),
//               ),
//               // SizedBox(height: 10),
//               // Container(
//               //     alignment: Alignment.bottomRight,

//               //     //hena haykhod el info mn el database
//               //     child: RaisedButton(
//               //         child: Icon(Icons.video_library), onPressed: () => {}
//               //         //Navigator.push(
//               //         //       // context,
//               //         // MaterialPageRoute(builder: (context) => VideoDemo(vid:widget.vid)),
//               //         // )
//               //         )),
//             ]),
//       ),
//     ],
//   );
// }

// speak(String info) async {
//   final FlutterTts flutterTts = FlutterTts();
//   await flutterTts.speak(info);
// }


//   // @override
//   // Widget build(BuildContext context) {
//   //   print(widget.vid);
//   //   return Scaffold(
//   //       body: Hero(
//   //     tag: widget.image,
//   //     child: Container(
//   //       width: MediaQuery.of(context).size.width,
//   //       height: MediaQuery.of(context).size.height,
//   //       decoration: BoxDecoration(
//   //           image: DecorationImage(
//   //               image: NetworkImage(widget.image, scale: 200.0),
//   //               fit: BoxFit.fitHeight)),
//   //       child: Stack(children: [
//   //         Center(
//   //           child: Card(
//   //             color: Colors.transparent,
//   //             child: Text(
//   //               widget.info,
//   //               style: TextStyle(
//   //                 fontSize: 20,
//   //                 color: Colors.white,
//   //                 fontWeight: FontWeight.bold,
//   //                 // backgroundColor: Colors.black
//   //               ),
//   //             ),
//   //           ),
//   //         ),
//   //         SizedBox(height: 20),
//   //         Container(
//   //           alignment: Alignment.bottomLeft,

//   //           //hena haykhod el info mn el database
//   //           child: RaisedButton(
//   //             child: Icon(Icons.volume_down),
//   //             onPressed: () => speak(),
//   //           ),
//   //         ),
//   //         Container(
//   //             alignment: Alignment.bottomRight,

//   //             //hena haykhod el info mn el database
//   //             child: RaisedButton(

//   //                 child: Icon(Icons.video_library),
//   //                 onPressed: () => Navigator.push(
//   //                       context,
//   //                       MaterialPageRoute(builder: (context) => VideoDemo(vid:widget.vid)),
//   //                     ))),

//   //       ]),
//   //     ),
//   //   ));
//   // }

//   // speak() async {
//   //   await flutterTts.speak(widget.info);
//   // }}