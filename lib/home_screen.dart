import 'package:flutter/material.dart';
import 'package:flutter_gawlah/ratingdialog.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rating Dialog'),
      ),

      body: Center(
        child: RaisedButton(
          child: Text('Rate'),
          onPressed: () async {
            int stars = await showDialog(
              context: context,
              builder: (_) => RatingDialog()
            );

            if(stars == null) return;

            print('Selected rate stars: $stars');
          },
        ),
      ),
    );
  }
}
