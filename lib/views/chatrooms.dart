
import 'package:flutter/material.dart';
import 'package:flutter_gawlah/helper/authenticate.dart';
import 'package:flutter_gawlah/helper/constants.dart';
import 'package:flutter_gawlah/helper/helperfunctions.dart';
import 'package:flutter_gawlah/helper/theme.dart';
import 'package:flutter_gawlah/services/authentication_service.dart';
import 'package:flutter_gawlah/servicess/auth.dart';
import 'package:flutter_gawlah/servicess/database.dart';
import 'package:flutter_gawlah/ui/shared/ui_helpers.dart';
import 'package:flutter_gawlah/ui/views/login_view.dart';
import 'package:flutter_gawlah/verticalspacer.dart';
import 'package:flutter_gawlah/views/chat.dart';
import 'package:flutter_gawlah/views/search.dart';

import '../locator.dart';

class ChatRoom extends StatefulWidget {
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  Stream chatRooms;
 final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  Widget chatRoomsList() {
    return StreamBuilder(
      stream: chatRooms,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data.documents.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ChatRoomsTile(
                    userName: snapshot.data.documents[index].data['chatRoomId']
                        .toString()
                        .replaceAll("_", "")
                        .replaceAll(Constants.myName, ""),
                    chatRoomId: snapshot.data.documents[index].data["chatRoomId"],
                  );
                })
            : Container();
      },
    );
  }

  @override
  void initState() {
    getUserInfogetChats();
    super.initState();
  }

  getUserInfogetChats() async {
    Constants.myName = _authenticationService.currentUser.fullName;
    DatabaseMethods().getUserChats(Constants.myName).then((snapshots) {
      setState(() {
        chatRooms = snapshots;
        print(
            "we got the data + ${chatRooms.toString()} this is name  ${Constants.myName}");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color.fromRGBO(38, 47, 62, 1),
      // appBar: AppBar(
      //   title: Image.asset(
      //     "images_and_icons/logo.png",
      //     height: 40,
      //   ),
      //   elevation: 0.0,
      //  centerTitle: false,
      //   actions: [
      //     GestureDetector(
      //       onTap: () {
      //         AuthenticationService().signOut();
      //         Navigator.pushReplacement(context,
      //             MaterialPageRoute(builder: (context) => LoginView()));
      //       },
      //       child: Container(
      //           padding: EdgeInsets.symmetric(horizontal: 16),
      //           child: Icon(Icons.exit_to_app)),
      //     )
      //   ],
    //  ),
      body: Container(
        child:Column(crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
          
          children: <Widget>[
          verticalSpaceMedium,
        Text("Chats", style: TextStyle(fontSize: 50,fontFamily: "DancingScript",color: Colors.white),),
        chatRoomsList(),
      ],)),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Search()));
        },
      ),
    );
  }
}

class ChatRoomsTile extends StatelessWidget {
  final String userName;
  final String chatRoomId;

  ChatRoomsTile({this.userName,@required this.chatRoomId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => Chat(
            chatRoomId: chatRoomId,
          )
        ));
      },
      child: Container(
        color: Colors.black26,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Row(
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  color: CustomTheme.colorAccent,
                  borderRadius: BorderRadius.circular(30)),
              child: Text(userName.substring(0, 1),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'OverpassRegular',
                      fontWeight: FontWeight.w300)),
            ),
            SizedBox(
              width: 12,
            ),
            Text(userName,
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'OverpassRegular',
                    fontWeight: FontWeight.w300))
          ],
        ),
      ),
    );
  }
}
