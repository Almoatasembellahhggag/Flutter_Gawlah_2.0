import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gawlah/verticalspacer.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'horizontalspace.dart';
import 'loading.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TourView extends StatefulWidget {
  final String image;
  final String info;
 final String rate;
  final String name;

  TourView({Key key, this.image, this.info, this.name, this.rate}) : super(key: key);

  TourViewState createState() => TourViewState();
 

}

class TourViewState extends State<TourView> {
  final FlutterTts flutterTts = FlutterTts();
  bool loading = false;
  final Firestore database = Firestore.instance;
  Stream Mapobjects;
  bool _isVertical = false;
  IconData _selectedIcon;

  //  Future getinfo() async{
  //    var firestore = Firestore.instance;
  //   QuerySnapshot qn = await firestore.collection("tours").getDocuments();
  //   return qn.documents;
  //  }
  @override
  Widget build(BuildContext context) {
     List<String>x=widget.name.split(" ");
  double rate= double.parse(widget.rate?? "0.0");
 
    return Scaffold(
        body: Container(
       
      
    child: Stack(
        children: [
         
            
          Hero(
            tag: widget.image, child: Image.network(widget.image,fit: BoxFit.fitHeight,height: double.infinity,width:double.infinity)
           
            
          ),
           Container(
child:Stack(children: <Widget>[

  ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3,sigmaY: 3),
          child: Container(
            color: Colors.black38.withOpacity(0.5),
          ),
        
      ),
  ),



])),
         
       
              Positioned(child: Row(children: <Widget>[ 
              Text(
              x[0],
              style: TextStyle(
                decoration: TextDecoration.underline,
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  backgroundColor: Colors.transparent
                  ),
            ), 
            HSpacer(0.1),
            
            //    FloatingActionButton(
            //      backgroundColor: Colors.transparent,
            //   child: Icon(Icons.headset),
            //   onPressed: () => speak(),

            // ),
              ]),top:100
          
            ),
      Positioned(child: 
             RatingBarIndicator(
                    rating: rate,
                    itemBuilder: (context, index) => Icon(
                      _selectedIcon ?? Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 20.0,
                    unratedColor: Colors.amber.withAlpha(50),
                    direction: _isVertical ? Axis.vertical : Axis.horizontal,
                  ),
                  top:150
      ),
            
            Positioned(child: 
            Container(
              height: MediaQuery.of(context).size.height*0.9,
              width:MediaQuery.of(context).size.width,
                           
               child:Text(
                widget.info,
                style: TextStyle(
                  
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    backgroundColor: Colors.transparent
                    ),
              ),
             
            ),top:180),

            

            
        

           
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
    ));
  }

  speak() async {
    await flutterTts.speak(widget.info);
  }
}
