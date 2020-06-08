import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gawlah/horizontalspace.dart';
import 'package:flutter_gawlah/ratingdialog.dart';
import 'package:flutter_gawlah/ui/widgets/text_link.dart';
import 'package:flutter_gawlah/verticalspacer.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:url_launcher/url_launcher.dart';


import 'package:flutter_tts/flutter_tts.dart';

class TourView extends StatefulWidget {
  final int tourid;
  final String image;
  final String info;
  final String rate;
  final String name;
  final String image3D;


  TourView({Key key, this.image, this.info, this.name, this.rate,this.tourid,this.image3D})
      : super(key: key);

  TourViewState createState() => TourViewState();
}

class TourViewState extends State<TourView> {


  final FlutterTts flutterTts = FlutterTts();
  bool loading = false;
  final Firestore database = Firestore.instance;
  // Stream Mapobjects;
  bool _isVertical = false;
  IconData _selectedIcon;
  Stream Polylines;
Future<void>_lauched;
String _laucherUrl='https://my.matterport.com/show/?m=QaGBAsT6yg4&mls=1';
  
Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'header_key': 'header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
 
    
    }
  //  Future getinfo() async{
  //    var firestore = Firestore.instance;
  //   QuerySnapshot qn = await firestore.collection("tours").getDocuments();
  //   return qn.documents;
  //  }
  @override
  Widget build(BuildContext context) {
  

  
    print(widget.tourid);
    print("objecthhhhhhhhhhhhhhhhhhhhhhh");
    List<String> x = widget.name.split(" ");
    double rate = double.parse(widget.rate ?? "0.0");
  
    return Scaffold(
        body:
        //  StreamBuilder(
        //     stream: Polylines,
        //     builder: (context, AsyncSnapshot snapshot) {
        //       List Info = snapshot.data.toList();

             Container(
                child: Stack(
                  children: [
                    Hero(
                        tag: widget.image,
                        child: Image.network(widget.image,
                            fit: BoxFit.fitHeight,
                            height: double.infinity,
                            width: double.infinity)),
                     
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
                    

                    Positioned(
                        child: Row(children: <Widget>[
                          Text(
                            widget.name,
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 45,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                backgroundColor: Colors.transparent),
                          ),
                        
                
          HSpacer(0.1),
             
                          FloatingActionButton(
                            backgroundColor: Colors.transparent,
                            child: Icon(Icons.headset),
                            onPressed: () => null,
                            //speak(),
                          ),
        
                        ]),
                        top: 100),

                          
                    Positioned(
                        child: RatingBarIndicator(
                          rating: rate,
                          itemBuilder: (context, index) => Icon(
                            _selectedIcon ?? Icons.star,
                            color: Colors.amber,
                          ),
                          itemCount: 5,
                          itemSize: 20.0,
                          unratedColor: Colors.amber.withAlpha(50),
                          direction:
                              _isVertical ? Axis.vertical : Axis.horizontal,
                        ),
                        top: 155),


                        HSpacer(0.2),

                    

                    Column( crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.end,
                      
                      
                      children: <Widget>[
                     VSpacer(0.26),
                                                                       ClipOval(
                                                                           child: RaisedButton(color: Colors.white,
          child: Text('Rate',style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold),),
          onPressed: () async {
            int stars = await showDialog(
              context: context,
              builder: (_) => RatingDialog(rate: widget.rate,name:widget.name,id:widget.tourid),
             
            );

            if(stars == null) return;
             var x =stars;
            print('Selected rate stars: $stars');
          },
        ),
                                                                     ), 
                                                                       VSpacer(0.03),  
            
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.6,
                          width: MediaQuery.of(context).size.width,
                          child: Column(children: <Widget>[
                            Text(
                            
                             widget.info,
                              style: TextStyle(
                               
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  backgroundColor: Colors.transparent),
                            textAlign: TextAlign.justify, ),
                          ]),
                        ),
                      ),
        //  TextLink(
                
        //           'Click to see the place 3D',
        //           onPressed: () {
                    
        //            _launchInBrowser(_laucherUrl);
        //           }
        //  ),


         

//              FlatButton(
//     child: Container(child:Text("HIII"),color: Colors.lightBlue,width: 30,height: 50,),
//     onPressed: () { print("hhiii") ;}//Navigator.push(context,MaterialPageRoute(builder:(context)=>AnimalQuizz()));},
// )
// RaisedButton(
//   onPressed: () { Navigator.push(context,MaterialPageRoute(builder:(context)=>AnimalQuizz()));},
//   child: Text("Game Time!!!",style: TextStyle(color: Colors.lightBlue),),
// )
        
       
        
                      //  VSpacer(0.08),

                      //        Text("Video",
                      //      style: TextStyle(

                      //             fontSize: 15,
                      //             color: Colors.white,
                      //             fontWeight: FontWeight.bold,

                      //             ),textAlign:TextAlign.center,
                      //             ),

                      //       Container(width:MediaQuery.of(context).size.width/2,height: MediaQuery.of(context).size.height*0.16,
                      //       //  child:Align(alignment: Alignment.bottomLeft,),
                      //  child:ButterFlyAssetVideo()
                      //         ),
                      //       //  ],)



                    ]),


                    // SizedBox(height: 20),
                    // Container(
                    //   alignment: Alignment.bottomLeft,

                    //   //hena haykhod el info mn el database
                    //   child: RaisedButton(
                    //     child: Icon(Icons.hearing),
                    //     onPressed: () => speak(),

                    //   ),
                    // )
                  ],
                ),
              ),
            );
  }

  
  // speak() async {
  //   await flutterTts.speak(Info[0]['info']);
  // }
}
