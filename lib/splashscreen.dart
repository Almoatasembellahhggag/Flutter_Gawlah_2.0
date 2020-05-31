import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_gawlah/verticalspacer.dart';
import 'dart:async';
import 'package:shimmer/shimmer.dart';

import 'package:flutter_gawlah/ui/views/login_view.dart';

import 'Tours/Tours_Pager.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // @override
  // void initState(){
  //   super.initState();

  //   _mockCheckForSession().then(
  //       (status) {
  //         if (status) {
  //           _navigateToLogin();
  //         } else {
  //           _navigateToLogin();
  //         }
  //       }
  //   );
  // }

  // Future<bool> _mockCheckForSession() async {
  //   await Future.delayed(Duration(milliseconds: 10000), () {});

  //   return true;
  // }

  void _navigateToHome() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => TourList2()));
  }

  void _navigateToLogin() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => LoginView()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color.fromRGBO(38, 47, 62, 1),
      body:Stack(children: <Widget>[
                  Container(
child: Stack(children: <Widget>[
                      ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                          child: Container(
                            color: Colors.black38.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ])),

            Center(child:
             Shimmer.fromColors(
                period: Duration(milliseconds: 1500),
                baseColor: Colors.blue[400],
                //Color.fromRGBO(38, 47, 62, 1),
                highlightColor: Colors.blue[800],
               // Color.fromRGBO(38, 47, 62, 1),
          child: Column(
            //  alignment: Alignment.center,
            children: <Widget>[
              VSpacer(0.3),

              Hero(tag: "image",
                            child: Image.asset(
                  'images_and_icons/g_transparent.png',
                
                ),
              ),

      VSpacer(0.02),
              Shimmer.fromColors(
                period: Duration(milliseconds: 1500),
                baseColor: Colors.blue[400],
                //Color.fromRGBO(38, 47, 62, 1),
                highlightColor: Colors.white,
                //Colors.blue[600],
                child: Column(children: <Widget>[

                  Text(
                    "GAWLAH",
                    style: TextStyle(
                        fontSize: 30.0,
                        fontFamily: 'Pacifico',
                        shadows: <Shadow>[
                          Shadow(
                              blurRadius: 18.0,
                              color: Colors.black87,
                              offset: Offset.fromDirection(120, 12))
                        ]),
                  ),
                  Text(
                    "جوله",
                    style: TextStyle(
                        fontSize: 30.0,
                        fontFamily: 'Pacifico',
                        shadows: <Shadow>[
                          Shadow(
                              blurRadius: 18.0,
                              color: Colors.black87,
                              offset: Offset.fromDirection(120, 12))
                        ]),
                  ),
               
                ]),
              ),


                 Container(
                  height: 150,
                    child: RotatedBox(
                      quarterTurns: 1,
                      child: Image.asset(
                        "images_and_icons/footgif.gif",
                         height: 250.0,
                        //width: 300.0,
                      ),
                    ),
                  ),

              //   Shimmer.fromColors(
              //     period: Duration(milliseconds: 1500),
              //     baseColor: Color.fromRGBO(38 , 47 , 62, 1),
              //     highlightColor: Colors.blue[600],
              //     child: Container(
              //       padding: EdgeInsets.all(16.0),
              //       child: Text(
              //         "جوله",
              //         style: TextStyle(
              //           fontSize: 30.0,
              //           fontFamily: 'Pacifico',
              //           shadows: <Shadow>[
              //             Shadow(
              //               blurRadius: 18.0,
              //               color: Colors.black87,
              //               offset: Offset.fromDirection(120, 12)
              //             )
              //           ]
              //         ),
              //       ),
              //     ),

              // ),

              // VSpacer(0.4),
            ],
          ),
      ),)
    
    
        ]) );
      
      
      
    
  }
}
