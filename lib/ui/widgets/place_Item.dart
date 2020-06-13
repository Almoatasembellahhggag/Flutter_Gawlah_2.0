

import 'package:flutter/material.dart';
import 'package:flutter_gawlah/models/place.dart';
import 'package:flutter_gawlah/models/post.dart';

class PlaceItem extends StatelessWidget {
  final Place  post;
  final Function onDeleteItem;
  const PlaceItem({
    Key key,
    this.post,
    this.onDeleteItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.only(top: 20),
      alignment: Alignment.center,
      child:  Row(
        children: <Widget>[
           Container(height: 80,width: 80
      ,child: Image.network(post.image,fit: BoxFit.fill,)),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(post.name,style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,color:Color.fromRGBO(38, 47, 62, 1)),),
          )),
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              if (onDeleteItem != null) {
                onDeleteItem();
              }
            },
          ),
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(blurRadius: 8, color: Color.fromRGBO(38, 47, 62, 1), spreadRadius: 3)
          ]),
    );
  }
}