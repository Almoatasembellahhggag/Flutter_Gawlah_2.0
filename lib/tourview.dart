import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_gawlah/itemcard.dart';
import 'package:flutter_gawlah/verticalspacer.dart';


import 'horizontalspacer.dart';

class TourView extends StatelessWidget {
  final String size;
  final String tour_name;
  final String image;
  final String tour_info;
  

  const TourView({Key key, this.size, this.tour_name, this.image, this.tour_info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Stack(
          children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child:
               Image.network (
                 
                    image,
                    
                  ),
                ),


            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 100),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 70),
                      child: Text(
                        tour_name,
                        style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          // height: 40,
                          
                        ),
                        HSpacer(0.02),
                        Chip(
                          label: Text(
                            'history',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          backgroundColor: Colors.red,
                        ),
                        HSpacer(0.02),
                        Chip(
                          label: Text(
                            'islam',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          backgroundColor: Colors.blue,
                        ),
                        HSpacer(0.02),
                        Chip(
                          label: Text(
                            'art',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          backgroundColor: Colors.green,
                        ),
                      ],
                    ),
                    VSpacer(0.02),
                    Row(
                      children: <Widget>[
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                    image),
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'From the collection of',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                  textAlign: TextAlign.left,
                                ),
                                //Container(width: 5,),
                                Text('The National Library of Egypt',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    VSpacer(0.02),
                    Text(
                      'Islamic art encompasses thes), s. Chinese art had a formative influence on Islamic painting, pottery, and textiles.Though the concept of "Islamic art" has been criticised by some modern art historians as an illusory Eurocentric construct,the similarities between art produced at widely different times and places in the Islamic world, especially in the Islamic Golden Age, have been sufficient to keep the term in wide use by scholars.',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          wordSpacing: 2.0,
                          height: 1.5,
                          fontWeight: FontWeight.bold),
                    ),
                    Center(
                        child: Container(
                            height: MediaQuery.of(context).size.height * 0.4,
                            width: MediaQuery.of(context).size.width * 0.85,
                            margin: EdgeInsets.symmetric(vertical: 20.0),
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              controller: PageController(viewportFraction: .5,keepPage: false),
                              
                              children: <Widget>[
                                ItemCard(size: 'small'),
                                ItemCard(size: 'small'),
                                ItemCard(size: 'small'),
                                ItemCard(size: 'small'),
                                
                              ],
                            ))),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
