import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gawlah/placeinfo.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:video_player/video_player.dart';
import 'vedio.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class PlaceProfile extends StatefulWidget {
  final String image;
  final String info;
  //final String vid;
 // final String tag;

  final String name;
  final String period;
  //final int tourid;
  const PlaceProfile(
      {Key key,
     this.image,
      this.name,

      this.info,
      this.period,
      })
      : super(key: key);

  PlaceProfileState createState() => PlaceProfileState();
 
}

class PlaceProfileState extends State<PlaceProfile> {
  
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
   var notname=widget.name;
      Query query = database.collection('polylines');
      Places = query
          .where("type", isEqualTo:'place').where('period',isEqualTo: widget.period)
          .snapshots()
          .map((list) => list.documents.map((doc) => doc.data));
    
    
    // Map the slides to the data payload

    // Update the active tag
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
  
     return Scaffold(
        body: Hero(
            tag: widget.image,
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.image, scale: 200.0),
                        fit: BoxFit.fitHeight)),
                child: Stack(children: [
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
                        return 
                        Container(
                          height: MediaQuery.of(context).size.height,
                          child:
                             Stack(children: <Widget>[
                             Image.network(widget.image,fit: BoxFit.fitHeight,height: double.infinity,width: double.infinity,),
                               Container(
                
                            color: Colors.black.withOpacity(0.5),
                          
),                              Container(
                                child:
                                    _buildProfileRow(widget.name, widget.image),
                              ),
                              Container(
                                child:
                                    _buildMyTasksHeader(widget.info, context),
                              ),
                              Center(
                                  child: StreamBuilder<Object>(
                                      stream: Places,
                                      builder:
                                          (context, AsyncSnapshot snapshot) {
                                        List slideList = snapshot.data.toList();
                                        print(snapshot.data.toString());
                                        print("DDDDDDDDDDDDDD");
                                        return Stack(
                                          children: <Widget>[
                                            PageView.builder(
                                                physics:
                                                    BouncingScrollPhysics(),
                                                controller: PageController(
                                                    viewportFraction: 0.7,
                                                    initialPage: 0),
                                                itemCount: slideList.length,
                                                itemBuilder: (context, index) {
                                                  {
                                                    if (slideList[index]
                                                            ['type'] ==
                                                        'place'&&slideList[index]
                                                            ['period'] ==
                                                        widget.period && slideList[index]
                                                            ['name'] ==
                                                        widget.name){
                                                      return Placeinfo(
                                                        name: slideList[index]
                                                            ['name'],
                                                        image: slideList[index]
                                                            ['image'],
                                                      );
                                                    }
                                                  }
                                                }),
                                          ],
                                        );
                                      })),
                            ]));
                      })
                ]))));
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
