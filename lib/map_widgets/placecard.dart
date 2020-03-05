import 'package:flutter/material.dart';
import 'package:flutter_gawlah/map_widgets/placeprofile.dart';

class PlaceCard extends StatelessWidget {
  const PlaceCard({Key key, this.name, this.image, this.period, this.size}) : super(key: key);

  final String image;
  final String name;
  final String period;
  final String size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
   
      child: Hero(
        tag: 'hey',
        child: Stack(
          children: <Widget>[
            
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: new BorderRadius.all(Radius.circular(20.0)),
                  color: Colors.redAccent,
                  image: DecorationImage(
                      image: NetworkImage(
                       image
                      ),
                      fit: BoxFit.cover)),
            ),
            Positioned (
              bottom: 20,
              left: 20,
              child: 
              Text(name,style: TextStyle(fontWeight: FontWeight.bold , fontSize: 15,color: Colors.yellow), 
              
              )),
          ],
        ),
      ),
    );
  }
}
