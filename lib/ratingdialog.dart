import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gawlah/models/post.dart';

class RatingDialog extends StatefulWidget {
final  String rate;
final String name;
final int id;
String doc;
 RatingDialog({Key key, this.rate,this.name,this.id})
      : super(key: key);

  @override
  _RatingDialogState createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  int _stars = 0;
final databaseReference = Firestore.instance;

 
  Widget _buildStar(int starCount) {
    return InkWell(
      child: Icon(
        Icons.star,
        // size: 30.0,
        color: _stars >= starCount ? Colors.orange : Colors.grey,
      ),
      onTap: () {
        setState(() {
          _stars = starCount;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
 //final CollectionReference _toursCollectionReference =
    //final String doc= Firestore.instance.collection('tours').where('name',isEqualTo: widget.name).getDocuments().toString();

//  getDocs() async {
  
  

// }
void updateData() async {
  QuerySnapshot querySnapshot = await Firestore.instance.collection("tours").where('name',isEqualTo: widget.name).getDocuments();
 for (int i = 0; i < querySnapshot.documents.length; i++) {
    var a = querySnapshot.documents[i];
    print("HIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII");
    print(a.documentID);
    widget.doc=a.documentID.toString();
    print(widget.doc);
   // return a.documentID.toString();
  }
 
 
  try {
    databaseReference
        .collection('tours')
        .document(widget.doc)
        .updateData({'rate': meanrate()});
  } catch (e) {
    print(e.toString());
  }
}

    return AlertDialog(
      title: Center(child: Text('Rate this Tour'),),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildStar(1),
          _buildStar(2),
          _buildStar(3),
          _buildStar(4),
          _buildStar(5),
        ],
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('CANCEL'),
          onPressed: Navigator.of(context).pop,
        ),
        FlatButton(
          child: Text('OK'),
          onPressed: () {
            Navigator.of(context).pop(_stars);
            meanrate();
     updateData();
    // debugPrint(doc);
   // getDocs();
    
    },
        )
      ],
    );
  }

  Map<String, dynamic> toMap() {
    return {
     // 'liked':liked,
      //'userId': userId,
     // 'title': title,
     'rate':meanrate(),

    };
  }

  meanrate(){
   var doublerate= double.parse(widget.rate);
   var mean=(doublerate+_stars)/2;
   String meanfinal=mean.toString();
   return meanfinal;
   print("mean");
   print(mean);
   //print("double rate");
   //print(doublerate);
  // print("_stars");
   //print(_stars);
    
  }


}