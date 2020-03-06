import 'package:flutter/material.dart';

class PlaceProfile extends StatefulWidget {
  final String image;
  PlaceProfile({Key key, this.image}) : super(key: key);

  PlaceProfileState createState() => PlaceProfileState();
}

class PlaceProfileState extends State<PlaceProfile> {
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
        ),
      ),
    );
  }
}
