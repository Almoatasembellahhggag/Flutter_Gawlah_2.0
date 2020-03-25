import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gawlah/place_card.dart';
import 'package:flutter_gawlah/placeinfo.dart';
import 'package:flutter_gawlah/verticalspacer.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';
import 'package:video_player/video_player.dart';
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
  //final int tourid;
  const PlaceProfile({
    Key key,
    this.image,
    this.name,
    this.info,
    this.period,
    this.place_type,
  }) : super(key: key);

  PlaceProfileState createState() => PlaceProfileState();
}

class PlaceProfileState extends State<PlaceProfile> {
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
        bottomSheet: SolidBottomSheet(
          controller: __controller,
          draggableBody: true,
          headerBar: Container(
            color: Theme.of(context).primaryColor,
            height: 50,
            child: Center(
              child: Text("Swipe me!"),
            ),
          ),
          body: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  VSpacer(0.2),
                  Container(
                    color: Colors.red,
                    height: MediaQuery.of(context).size.height*0.35,
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
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.stars),
            onPressed: () {
              __controller.isOpened ? __controller.hide() : __controller.show();
            }),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(widget.image, scale: 200.0),
                  fit: BoxFit.fitHeight)),
        ));
  }

  Widget _buildProfileRow(String name, String image) {
    return new Padding(
      padding: new EdgeInsets.only(left: 14.0, top: 5),
      child: new Row(
        children: <Widget>[
          new CircleAvatar(
            minRadius: 35.0,
            maxRadius: 40.0,
            backgroundImage: new NetworkImage(image),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  name,
                  style: new TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.035,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w400),
                ),
                //text will be changed from the database
                new Text(
                  'Islamic Arts',
                  style: new TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.017,
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

  _buildMyTasksHeader(String info, BuildContext context) {
    return Stack(
      children: <Widget>[
        new Padding(
          padding: new EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.05,
              top: MediaQuery.of(context).size.height * 0.13),
          child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  'Info',
                  style: new TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.05,
                      color: Colors.black),
                ),
                new Text(
                  info,
                  style: new TextStyle(
                      color: Colors.grey,
                      fontSize: MediaQuery.of(context).size.height * 0.015),
                  textAlign: TextAlign.left,
                ),
              ]),
        ),

        //}),
      ],
    );
  }
}
