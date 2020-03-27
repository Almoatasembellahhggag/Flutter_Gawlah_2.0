import 'package:flutter/material.dart';
import 'place_profile.dart';

class Placeinfo extends StatelessWidget {
  const Placeinfo({Key key, this.name, this.image})
      : super(key: key);

  final String image;
  final String name;




  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      child: GestureDetector(
          
        onTap: () {
          // print(info);
          // print(vid);
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => PlaceProfile(
          //           name: name,
          //               image: image,
          //               info: info,
          //               vid: vid,
          //               tour_id: ,
          //             )));
        },
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 20,
              //left:0,
              child:
          Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: new BorderRadius.all(Radius.circular(20.0)),
                    color: Colors.redAccent,
                    image: DecorationImage(
                        image: NetworkImage(image), fit: BoxFit.cover)),
              ),
            ),
            Positioned(
                bottom: 20,
                left: 30,
                child: Text(
                  name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.yellow),
                )),
            Positioned(
                bottom: 40,
                left: 30,
                child: Text(name
                  ,
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