
import 'package:flutter/material.dart';
import 'package:flutter_gawlah/settings_form.dart';
import 'package:provider/provider.dart';

import 'auth.dart';
import 'brew.dart';
import 'brew_list.dart';
import 'database.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: SettingsForm(),
        );
      });
    }

    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      child: Scaffold(
        backgroundColor: Colors.blue[500],
        appBar: AppBar(
          title: Text('User profile'),
          backgroundColor: Colors.blue[900],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
            FlatButton.icon(
              icon: Icon(Icons.settings),
              label: Text('settings'),
              onPressed: () => _showSettingsPanel(),
            )
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images_and_icons/g_transparent.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: BrewList()
        ),
      ),
    );
  }
}