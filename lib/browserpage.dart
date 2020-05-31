import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gawlah/ui/widgets/text_link.dart';

import 'package:flutter_tts/flutter_tts.dart';
import 'package:url_launcher/url_launcher.dart';

class Browserpage extends StatefulWidget {




   BrowserpageState createState() =>  BrowserpageState();
}

class  BrowserpageState extends State< Browserpage> {
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

  @override
  Widget build(BuildContext context) {
     return Scaffold(
        body:Container(child: Column(
          children: <Widget>[
            RaisedButton(onPressed: (){
              _launchInBrowser(_laucherUrl);
            },child: const Text('Lauch In Browser'),)
          ],
        )
        ,)
    );
  }}