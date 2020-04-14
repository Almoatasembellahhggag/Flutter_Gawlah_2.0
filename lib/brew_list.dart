
// import 'package:flutter_gawlah/settings_form.dart';
// import 'package:flutter_gawlah/sign_in.dart';
// import 'package:flutter_gawlah/user.dart';

// import 'auth.dart';
// import 'brew.dart';

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import 'brew_title.dart';
// import 'database.dart';

// class BrewList extends StatefulWidget {
//   @override
//   _BrewListState createState() => _BrewListState();
// }

// class _BrewListState extends State<BrewList> {
//   @override
//   Widget build(BuildContext context) {

//       void _showSettingsPanel() {
//       showModalBottomSheet(context: context, builder: (context) {
//         return Container(
//           padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
//           child: SettingsForm(),
//         );
//       });
//     }
//     final AuthService _auth = AuthService();

//    User user = Provider.of<User>(context);

//     return StreamBuilder<UserData>(
//       stream: DatabaseService(uid: user.uid).userData,
//       builder:(context,snapshot) {
//         if(snapshot.hasData){
//           UserData userData = snapshot.data;
//          return  ClipRRect(
//       borderRadius: BorderRadius.circular(30),
//           child: Drawer(
        
//         child: Column(
//           children: <Widget>[
//             Container(
//                 width: double.infinity,
//                 padding: EdgeInsets.all(20),
//                 color: Color.fromRGBO(38, 47, 62, 1),
//                 child: Center(
//                     child: Column(
//                   children: <Widget>[
//                     Container(
//                       width: 100,
//                       height: 100,
//                       margin: EdgeInsets.only(top: 30,bottom: 10),
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         image: DecorationImage(
//                           image: AssetImage("images_and_icons/Dinapic.jpg"),
//                           fit: BoxFit.fill,
//                         ),
//                       ),
//                     ),
//                     Text(
//                       userData.name,
//                       style: TextStyle(fontSize: 22, color: Colors.white),
//                     ),
//                      Text(userData.email,
                      
//                       style: TextStyle( color: Colors.white),
//                     )
//                   ],
//                 )
//                 )
//                 ),
//                 ListTile(leading: Icon(Icons.person),
//                 title: Text("Profile",style: TextStyle(fontSize:18),),
//                 onTap: null,
//                 ),
//                      ListTile(leading: Icon(Icons.settings),
//                 title: Text("Settings",style: TextStyle(fontSize:18),),
//                 onTap:(){
//                   _showSettingsPanel();
//                 }
//                 ),
//                      ListTile(leading: Icon(Icons.arrow_back),
//                 title: Text("Logout",style: TextStyle(fontSize:18),),
//                  onTap: ()async{
//                  await _auth.signOut();

//                  }

//                 )

//           ],
//         ),
//       ),
//     );
//         }
//         else return Container(child:Text("null"));
//         }
//         );}
//         }
