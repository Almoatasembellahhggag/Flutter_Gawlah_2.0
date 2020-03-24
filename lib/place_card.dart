import 'dart:ui';

import 'package:flutter/material.dart';
import 'place_profile.dart';

class PlaceCard extends StatelessWidget {
  const PlaceCard({Key key, this.name, this.image, this.placetype,this.period, this.info})
      : super(key: key);

  final String image;
  final String name;
  final String placetype;
  final String period;
  final String info;
 // final String type;
 // final String vid;
 // final int tourid;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: GestureDetector(
          
        onTap: () {
          print(info);
         
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PlaceProfile( image: image,
                        name: name,
                       
                        info: info,
                        period:period,
                        
                      //  tourid: tourid,
                      )));
        },
        child: Stack(
          children: <Widget>[
            Hero(
              tag: image,
              child: Container(
                width: 200,
                height: 300,
                decoration: BoxDecoration(
                    borderRadius: new BorderRadius.all(Radius.circular(20.0)),
                    color: Colors.redAccent,
                    image: DecorationImage(
                        image: NetworkImage(image), fit: BoxFit.cover)),
              ),
            ),
            Positioned(
                bottom: 20,
                left: 20,
                child: Text(
                  name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.yellow),
                )),
            Positioned(
                bottom: 40,
                left: 20,
                child: Text(
                  placetype,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Colors.red),
                )
                )
          ],
        ),
      ),
    );
  }
}