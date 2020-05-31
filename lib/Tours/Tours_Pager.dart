import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gawlah/locator.dart';
import 'package:flutter_gawlah/services/authentication_service.dart';
import 'package:shimmer/shimmer.dart';

import 'Tour_card.dart';
import 'brew_list.dart';
class TourList2 extends StatefulWidget {


  _TourListState2 createState() => _TourListState2();

}
class _TourListState2 extends State<TourList2>{
   final AuthenticationService _authenticationService =
   locator<AuthenticationService>();
    final CollectionReference _usersCollectionReference =
      Firestore.instance.collection('Users');
  
  final PageController controller = PageController(
      viewportFraction: .8,
      keepPage:true
  );
  final Firestore database = Firestore.instance;
  //can be changed within the app
  Color _BackGroundColor;
  Stream slides;
  String activeTag = 'all';
  int currentPage = 0;

  @override
  void initState() {
    _BackGroundColor = Color.fromRGBO(38 , 47 , 62, 1);

    _queryDatabase();
    controller.addListener(() {
      int next = controller.page.round();
      if (currentPage != next) {
        setState(() {
          currentPage = next;
        });
      }
    });
    super.initState();
  }
  void _queryDatabase({String tag = 'all'}) {
    if (tag == 'all') {
      Query query = database.collection('tours');
      slides = query
          .snapshots()
          .map((list) => list.documents.map((doc) => doc.data));
    } else {
      Query query =
      database.collection('tours').where('tags', arrayContains: tag);
      slides = query
          .snapshots()
          .map((list) => list.documents.map((doc) => doc.data));
    }
    // Map the slides to the data payload

    // Update the active tag
    setState(() {
      activeTag = tag;
    });
  }
  Container _buildThemesPage() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //VSpacer(0.1),
          //_buildb(),
         // VSpacer(0.18),
          Text(
            'Themes',
            style: TextStyle(
                fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Container(
            height: 15,
          ),
          Row(
            children: <Widget>[

              Container(
                width: 10,
              ),
            
              Text('FILTERS',
                  style: TextStyle(color: Colors.white, fontSize: 20,fontFamily: "DancingScript")),
            ],
          ),
          Container(
            height: 20,
          ),
          _buildButton('Art'),
          _buildButton('War'),
          _buildButton('Qurans'),
          _buildButton('Painting'),
          _buildButton('Education'),

          
        //   Stack(children:<Widget>[
        //    _buildb()])
        // ],
          ]  ),
    );
  }
  FlatButton _buildButton(tag) {
    Color color = tag == activeTag ? Colors.blue : Colors.transparent;
    return 
    FlatButton(
      
      color: color,
      child: SizedBox(
        width: 150,
        child: Text(
          '#$tag',
          textAlign: TextAlign.left,
          style: TextStyle(color: Colors.white,fontSize: 25),
        ),
      ),
      onPressed: () => _queryDatabase(tag: tag),
    );
  }




  Widget _buildStoryPage(Map data, bool active ,BuildContext context ) {
    // Animated properties
    final double blur = active ? 100: 30;
    final double offset = active ? 10 : 0;
    final double top = active ? 200 : 240;

    return AnimatedContainer(
        duration: Duration(milliseconds: 400),
        curve: Curves.easeOutQuint,
        margin: EdgeInsets.only(top: top, bottom: 100, right: 10, left: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black87,
              blurRadius: blur,
              offset: Offset(offset, offset),
            ),
          ],
        ),
   
        child:new TourCard(data),
        
      
      );

  }


  Widget _buildbackground() {
    return Stack(children:<Widget>[
    Container(
      color: _BackGroundColor,
    
       
   ),
     Container(
                        child: Stack(children: <Widget>[
                      ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                          child: Container(
                            color: Colors.black38.withOpacity(0.4),
                          ),
                        ),
                      ),
                    ])),

 Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
         Shimmer.fromColors(
                period: Duration(milliseconds: 1500),
                baseColor: Colors.blue[400],
                highlightColor: Colors.blue[100],
                child:
          Image.asset(
            'images_and_icons/g_transparent.png',
          height: 80,
          ),),
        
       
          Container(
            height: 550,
          ),
        
        ],
      ),
       
      
    
    
    ]);
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
     drawer:BrewList(),
     //HomeView(),
        primary: true,
        body: Center(
          child: Stack(children: [
            _buildbackground(),
            
            StreamBuilder(
              stream: slides,
              initialData: [],
              builder: (context, AsyncSnapshot snap) {
                List slideList = snap.data.toList();
                return PageView.builder(
                  controller: controller,

                  itemCount: slideList.length+1 ,
                  itemBuilder: (context, int currentIndex) {
                    if (currentIndex == 0) {
                      return _buildThemesPage();
                    } else if (slideList.length >= currentIndex) {
                      bool active = currentIndex == currentPage;
                      return _buildStoryPage(slideList[currentIndex-1], active,context,);
                    }

                  },
                );
              },
            )
          ]),
        ));
  }




}
