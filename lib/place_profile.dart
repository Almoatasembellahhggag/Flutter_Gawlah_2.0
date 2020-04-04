import 'dart:async';

import 'package:chewie/chewie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gawlah/place_card.dart';
import 'package:flutter_gawlah/placeinfo.dart';
import 'package:flutter_gawlah/verticalspacer.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';
import 'package:video_player/video_player.dart';

import 'horizontalspace.dart';
import 'vedio.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class PlaceProfile extends StatefulWidget {
  final String image;
  final String info;

  final String place_type;
  //final String vid;
  // final String tag;

  final String name;
  final String period;
  final GeoPoint center;
  final String video;
   final VideoPlayerController videoPlayerController;
  final bool looping;
  //final int tourid;
  const PlaceProfile(
      {Key key,
      this.image,
      this.name,
      this.info,
      this.period,
      this.place_type,
      this.looping,
      this.center, 
      this.video,
      @required this.videoPlayerController,
      })
      : super(key: key);

  PlaceProfileState createState() => PlaceProfileState();
}

class PlaceProfileState extends State<PlaceProfile> {
  ChewieController _chewieController;
  SolidController __controller = SolidController();
  String activeplace = 'all';
  // String tag = 'all';
  Color c = const Color(0xFF7F1019);
  final FlutterTts flutterTts = FlutterTts();
  final Firestore database = Firestore.instance;
  Stream Places;
  int currentPage = 0;
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  final PageController controller =
      PageController(viewportFraction: .85, keepPage: true);

  LatLng _createcentre(GeoPoint centre) {
    return new LatLng(centre.latitude, centre.longitude);
  }

  void initState() {
    _queryDatabase();

    super.initState();
  }

  void _queryDatabase() {
    Query query = database.collection('polylines');
    Places = query
        .where("type", isEqualTo: 'place')
        .where("period", isEqualTo: widget.period)
        .where("placetype", isEqualTo: widget.place_type)
        .snapshots()
        .map((list) => list.documents.map((doc) => doc.data));

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.network(
        widget.image,
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
      bottomSheet: SolidBottomSheet(
        headerBar: Container(
          color: Colors.blueGrey,
          height: 30,
          child: Center(
            child: Text("Swipe me!"),
          ),
        ),
        body: Container(
          color: Colors.white,
          height: 30,
          child: Center(child: _bottompage()),
        ),
      ),
    );
  }

  _bottompage() {
    final Set<Marker> _markers = {
      new Marker(
          markerId: MarkerId('reference point'),
          position:
              (new LatLng(widget.center.latitude, widget.center.longitude)))
    };
    return Container( color: Colors.white,
      child:SingleChildScrollView(
      
      child: Stack(children: <Widget>[
        Row(
          children: <Widget>[
            Column(
              
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  VSpacer(0.0),
                  Row(children: <Widget>[
                    Column(children:<Widget>[
                  Text(
                    widget.name,
                    style: new TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                 
                       Text(
                    "Cairo,Egypt,1421",
                    style: new TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: MediaQuery.of(context).size.height * 0.015),
                    textAlign: TextAlign.start,
                  ),
                  ]),
                  HSpacer(0.1),
                   Column(children: <Widget>[
                    VSpacer(0.1),
                     Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: Colors.black,
                      ),
                      
                      Text(
                        "Cairo location",
                        style: new TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize:12),
                                //MediaQuery.of(context).size.height * 0.02),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),

                      Container(
                        height: 95,
                        width: 140,
                        color: Colors.white,
                        child: Stack(children: <Widget>[
                          GoogleMap(
                            minMaxZoomPreference: MinMaxZoomPreference(14, 18),
                            mapType: MapType.normal,
                            initialCameraPosition: new CameraPosition(
                                target: _createcentre(widget.center),
                                zoom: 15.5),
                            //   onMapCreated: _onMapCreated,
                            markers: _markers,
                          ),
                          Container(
                              height: 95,
                        width: 140,
                              color: Colors.black.withOpacity(0.7))
                        ]),
                      ),
                   
                  
                  
                  
                  
                  
                  ],)
                  
                  
                  
                  ]),

             
                  
              
                //  VSpacer(0.018),

                  Row(children: <Widget>[
                    new CircleAvatar(
                      minRadius: 25.0,
                      maxRadius: 25.0,
                      backgroundImage: new NetworkImage(widget.image),
                    ),
                    HSpacer(0.012),
                    Text(
                      "Read more about the place",
                      style: new TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: MediaQuery.of(context).size.height * 0.015),
                      textAlign: TextAlign.start,
                    ),
                    Icon(
                      Icons.arrow_right,
                      color: Colors.grey,
                    )
                  ]),
                  VSpacer(0.0),
                  Container(
                    height: (MediaQuery.of(context).size.height) / 2,
                    width: (MediaQuery.of(context).size.width),
                    child: new Text(
                      widget.info,
                      style: new TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: MediaQuery.of(context).size.height * 0.02),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  VSpacer(0.1),
              Text("More Places",
               style: new TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize:20),
                      textAlign: TextAlign.left,


              ),
                              Container(

                    color: Colors.transparent,
                    height: 100,
                    width: MediaQuery.of(context).size.width,

                    child: StreamBuilder<Object>(
                        stream: Places,
                        builder: (context, AsyncSnapshot snapshot) {
                          List slideList = snapshot.data.toList();
                          return PageView.builder(
                              physics: BouncingScrollPhysics(),
                              controller: PageController(
                                  viewportFraction: 0.5, initialPage: 0),
                              itemCount: slideList.length,
                              itemBuilder: (context, index) {
                                {
                                  if (slideList[index]['type'] == 'place') {
                                    return PlaceCard(
                                      w_ratio: MediaQuery.of(context).size.width*0.1,
                                      h_ratio: MediaQuery.of(context).size.height*0.35,
                                      image: slideList[index]['image'],
                                      name: slideList[index]['name'],
                                      placetype: slideList[index]['placetype'],
                                      info: slideList[index]['info'],
                                      period: slideList[index]['period'],
                                    );
                                  }
                                }
                              });
                        }),
                  ),
      //             Container(child:
      //              ListView(
      //   children: <Widget>[
         
      //     ChewieListItem(
      //       videoPlayerController: VideoPlayerController.network(
      //         'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
      //       ),
      //     ),
      //     // ChewieListItem(
      //     //   // This URL doesn't exist - will display an error
      //     //   videoPlayerController: VideoPlayerController.network(
      //     //     'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/error.mp4',
      //     //   ),
      //     // ),
      //   ],
      // ),
                


      //             ),
                ])
          ],
        ),
      ]),
    ));
    //  ),
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return _bottompage();
        });
  }




}

//         bottomSheet: SolidBottomSheet(

//           controller: __controller,
//           draggableBody: true,
//           headerBar: Container(
//             color: Colors.red[900],
//             //Theme.of(context).primaryColor,
//             height: 50,
//             child: Center(
//               child: Text("Swipe me!"),
//             ),

//           ),
//           body: Stack(
//             children: <Widget>[
//              Image.network(widget.image,height: double.infinity,width:double.infinity,fit: BoxFit.cover,),

//               Container(color:Colors.black.withOpacity(0.6)),

//             //  Column(
//               //  children: <Widget>[
//  Container(child :Stack(children: <Widget>[
//                     _buildProfileRow(widget.name,widget.image),_buildMyTasksHeader(widget.info, context)

//   ] ) ),

//             Positioned(bottom: 0,
//               child:
//                 Container(

//                     color: Colors.transparent,
//                     height: 100,
//                     width: MediaQuery.of(context).size.width,

//                     child: StreamBuilder<Object>(
//                         stream: Places,
//                         builder: (context, AsyncSnapshot snapshot) {
//                           List slideList = snapshot.data.toList();
//                           return PageView.builder(
//                               physics: BouncingScrollPhysics(),
//                               controller: PageController(
//                                   viewportFraction: 0.5, initialPage: 0),
//                               itemCount: slideList.length,
//                               itemBuilder: (context, index) {
//                                 {
//                                   if (slideList[index]['type'] == 'place') {
//                                     return PlaceCard(
//                                       w_ratio: MediaQuery.of(context).size.width*0.1,
//                                       h_ratio: MediaQuery.of(context).size.height*0.35,
//                                       image: slideList[index]['image'],
//                                       name: slideList[index]['name'],
//                                       placetype: slideList[index]['placetype'],
//                                       info: slideList[index]['info'],
//                                       period: slideList[index]['period'],
//                                     );
//                                   }
//                                 }
//                               });
//                         }),
//                   ),)
//                 ],
//               //),
//            // ],
//           ),
//         ),
//         floatingActionButton: FloatingActionButton(
//             backgroundColor: Colors.red[900],
//             child: Icon(Icons.stars),
//             onPressed: () {
//               __controller.isOpened ? __controller.hide() : __controller.show();
//             }),
//         body: Container(

//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           decoration: BoxDecoration(
//               image: DecorationImage(
//                   image: NetworkImage(widget.image, scale: 200.0),
//                   fit: BoxFit.fitHeight)),
//         ));
//   }

//   Widget _buildProfileRow(String name, String image) {
//     return new Padding(
//       padding: new EdgeInsets.only(left: 14.0, top: 5),
//       child: new Row(
//         children: <Widget>[
//           new CircleAvatar(
//             minRadius: 35.0,
//             maxRadius: 40.0,
//             backgroundImage: new NetworkImage(image),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 10.0, top: 15),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 Text(
//                   name,
//                   style: new TextStyle(color: Colors.yellow,
//                       fontSize: MediaQuery.of(context).size.height * 0.035,
//                       fontStyle: FontStyle.italic,
//                       fontWeight: FontWeight.w400,),
//                 ),
//                 //text will be changed from the database
//                 // new Text(
//                 //   'Islamic Arts',
//                 //   style: new TextStyle(
//                 //       fontSize: MediaQuery.of(context).size.height * 0.017,
//                 //       color: Colors.white,
//                 //       fontWeight: FontWeight.w300),
//                 // ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   _buildMyTasksHeader(String info, BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         new Padding(
//           padding: new EdgeInsets.only(
//               left: MediaQuery.of(context).size.width * 0.05,
//               top: MediaQuery.of(context).size.height * 0.13),
//           child: new Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 new Text(
//                   'Info',
//                   style: new TextStyle(
//                       fontSize: MediaQuery.of(context).size.height * 0.05,
//                       color: Colors.red[900],),
//                 ),
//                 new Text(
//                   info,
//                   style: new TextStyle(
//                       color: Colors.grey,
//                     fontWeight: FontWeight.bold,
//                       fontSize: MediaQuery.of(context).size.height * 0.015),
//                   textAlign: TextAlign.left,
//                 ),
//               ]),
//         ),

//         //}),
//       ],
//     );
//   }
// }




