// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';


// class MyAppe extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyAppe> {
//   var _ratingController = TextEditingController();
//   double _rating;
//   double _userRating = 3.0;
//   int _ratingBarMode = 1;
//   bool _isRTLMode = false;
//   bool _isVertical = false;
//   IconData _selectedIcon;
//   //  _userRating =
//   //                                 double.parse(_ratingController.text ?? "0.0");

//   @override
//   void initState() {
//     _ratingController.text = "3.0";
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Builder(
//         builder: (context) => Scaffold(
//           body: 
//              SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisSize: MainAxisSize.min,
//                 children: <Widget>[
//                   SizedBox(
//                     height: 40.0,
//                   ),
                 
                 
//                   SizedBox(
//                     height: 40.0,
//                   ),
//                   _heading('Rating Indicator'),
//                   RatingBarIndicator(
//                     rating: _userRating,
//                     itemBuilder: (context, index) => Icon(
//                       _selectedIcon ?? Icons.star,
//                       color: Colors.amber,
//                     ),
//                     itemCount: 5,
//                     itemSize: 50.0,
//                     unratedColor: Colors.amber.withAlpha(50),
//                     direction: _isVertical ? Axis.vertical : Axis.horizontal,
//                   ),
//                   SizedBox(
//                     height: 20.0,
//                   ),
                 
                 
                
            
//                 ],
//               ),
//             ),
          
//         ),
//       ),
//     );
//   }


 

//   Widget _heading(String text) => Column(
//         children: [
//           Text(
//             text,
//             style: TextStyle(
//               fontWeight: FontWeight.w300,
//               fontSize: 24.0,
//             ),
//           ),
//           SizedBox(
//             height: 20.0,
//           ),
//         ],
//       );
// }

// class IconAlert extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Text(
//         'Select Icon',
//         style: TextStyle(
//           fontWeight: FontWeight.w300,
//         ),
//       ),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10.0),
//       ),
//       titlePadding: EdgeInsets.all(12.0),
//       contentPadding: EdgeInsets.all(0),
//       content: Wrap(
//         children: [
//           _iconButton(context, Icons.home),
//           _iconButton(context, Icons.airplanemode_active),
//           _iconButton(context, Icons.euro_symbol),
//           _iconButton(context, Icons.beach_access),
//           _iconButton(context, Icons.attach_money),
//           _iconButton(context, Icons.music_note),
//           _iconButton(context, Icons.android),
//           _iconButton(context, Icons.toys),
//           _iconButton(context, Icons.language),
//           _iconButton(context, Icons.landscape),
//           _iconButton(context, Icons.ac_unit),
//           _iconButton(context, Icons.star),
//         ],
//       ),
//     );
//   }

//   _iconButton(BuildContext context, IconData icon) => IconButton(
//         icon: Icon(icon),
//         onPressed: () => Navigator.pop(context, icon),
//         splashColor: Colors.amberAccent,
//         color: Colors.amber,
//       );
// }