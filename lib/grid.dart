// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

// class GridViewExample extends StatefulWidget {
//   @override
//   _GridViewExampleState createState() => new _GridViewExampleState();

// }

// class _GridViewExampleState extends State<GridViewExample> {
//     List<String> widgetList =["https://upload.wikimedia.org/wikipedia/commons/2/2d/El-Moez_Street-Old_Cairo-Egypt.jpg","https://upload.wikimedia.org/wikipedia/commons/3/3a/Cairo%2C_madrasa_del_sultano_qalaun%2C_02.JPG","https://upload.wikimedia.org/wikipedia/commons/8/85/%D9%85%D8%B3%D8%AC%D8%AF_%D9%88%D9%85%D8%AF%D8%B1%D8%B3%D8%A9_%D9%82%D9%86%D8%B5%D9%88%D9%87_%D8%A7%D9%84%D8%BA%D9%88%D8%B1%D9%8A.jpg"];
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       body: new Padding(
//        padding: const EdgeInsets.all(5.0),
//         child: new StaggeredGridView.countBuilder(
//   crossAxisCount: widgetList.length,
//   itemCount: widgetList.length,
//   itemBuilder: (BuildContext context, int index) => new Container(
//         decoration: new BoxDecoration(
//           image: new DecorationImage(
//             image: new NetworkImage(widgetList[index]),
//             fit: BoxFit.cover
//           )
//         )

//         ),

//   staggeredTileBuilder: (int index) =>
//       new StaggeredTile.count(2, index.isEven ? 2 : 1),
//   mainAxisSpacing: 4.0,
//   crossAxisSpacing: 4.0,
// ),),

//     );
//   }
// }