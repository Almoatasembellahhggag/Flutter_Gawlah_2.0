// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:english_words/english_words.dart';

// import 'listitem.dart';

// class MyLikes extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Startup Name Generator',
//       home: RandomWords(),
//     );
//   }
// }

// class RandomWordsState extends State<RandomWords> {

//   final _suggestions = <String>["Tour1","Tour2","Tour3"];
//   final _biggerFont = const TextStyle(fontSize: 11.0);
//   final _saved = Set<String>();
//    final Firestore database = Firestore.instance;
//    Stream slides;
  


//  @override
//   void initState() {
//     _queryDatabase();
  
//     super.initState();
//   }

//     void _queryDatabase({String tag = 'all'}) {
//     if (tag == 'all') {
//       Query query = database.collection('tours');
//       slides = query
//           .snapshots()
//           .map((list) => list.documents.map((doc) => doc.data));
//     }
//     }





//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(debugShowCheckedModeBanner: false,
//           home: Scaffold(
//         appBar: 
//         PreferredSize(
//           preferredSize: Size.fromHeight(50.0),
          
//                   child: AppBar(
            
//             title: Text('Liked Tours'),
//             actions: <Widget>[
//               IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
//             ],
//           ),
//         ),
//         body: _buildSuggestions(),
//       ),
//     );
//   }

//   void _pushSaved() {
//     Navigator.of(context).push(
//       MaterialPageRoute<void>(
//         builder: (BuildContext context) {
//           final Iterable<ListTile> tiles = _saved.map(
//             (String pair) {
//               return ListTile(
//                 title: Text(
//                   pair,
//                   style: _biggerFont,
//                 ),
//               );
//             },
//           );
//           final List<Widget> divided = ListTile.divideTiles(
//             context: context,
//             tiles: tiles,
//           ).toList();

//           return Scaffold(
//             appBar: AppBar(
//               title: Text('Saved Suggestions'),
//             ),
//             body: ListView(children: divided),
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildSuggestions() {
// return ListView.builder(
//         itemCount: _suggestions.length,
//         itemBuilder: (context, index) {
//           return _buildRow(_suggestions[index]);
          
//         },
//       );






//   }
//   //   return ListView.builder(
//   //       padding: const EdgeInsets.all(5.0),
//   //       itemBuilder: (context, i) {
//   //         //if (i.isOdd) return Divider();

//   //        // final index = i ~/ 2;
//   //         // if (index >= _suggestions.length) {
//   //         //   _suggestions.add(_suggestions[0]);
//   //         // }
          
//   //         return _buildRow((_suggestions[0]));
//   //       });
//   // }

//   Widget _buildRow(String pair) {
//     final alreadySaved = _saved.contains(pair);
//     return ListTile(
//       title: Text(
//         pair,
//         style: _biggerFont,
//       ),
//       trailing: Icon(
//         alreadySaved ? Icons.favorite : Icons.favorite_border,
//         color: alreadySaved ? Colors.red : null,
//       ),
//       onTap: () {
//         setState(() {
//           if (alreadySaved) {
//             _saved.remove(pair);
//           } else {
//             _saved.add(pair);
//           }
//         });
//       },
//     );
//   }
// }

// class RandomWords extends StatefulWidget {
//   @override
//   RandomWordsState createState() => RandomWordsState();
// }