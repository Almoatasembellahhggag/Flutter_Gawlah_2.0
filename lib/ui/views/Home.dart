// import 'package:flutter/material.dart';
// import 'dart:ui' as ui;
// import 'package:flutter_svg/flutter_svg.dart';

// class Home extends StatelessWidget {
//   Home({
//     Key key,
//   }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xffffffff),
//       body: Stack(
//         children: <Widget>[
//           Transform.translate(
//             offset: Offset(780.0, 0.0),
//             child: Container(
//               width: 1140.0,
//               height: 1048.0,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(1048.0),
//                 ),
//                 image: DecorationImage(
//                   image: const AssetImage(''),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           ),
//           Transform.translate(
//             offset: Offset(780.0, 0.0),
//             child: Container(
//               width: 1140.0,
//               height: 1048.0,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(1048.0),
//                 ),
//                 color: const Color(0xb27cc576),
//               ),
//             ),
//           ),
//           Transform.translate(
//             offset: Offset(160.0, 0.0),
//             child:
//                 // Adobe XD layer: 'Layer 2' (shape)
//                 Container(
//               width: 0.0,
//               height: 0.0,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: const AssetImage(''),
//                   fit: BoxFit.fill,
//                 ),
//               ),
//             ),
//           ),
//           Transform.translate(
//             offset: Offset(841.21, 56.2),
//             child: SizedBox(
//               width: 595.0,
//               child: Text(
//                 'Home          About          Service          Pricing',
//                 style: TextStyle(
//                   fontFamily: 'Roboto',
//                   fontSize: 26,
//                   color: const Color(0xffffffff),
//                   height: 1.1538462272057166,
//                 ),
//                 textAlign: TextAlign.right,
//               ),
//             ),
//           ),
//           Transform.translate(
//             offset: Offset(268.0, -2.0),
//             child:
//                 // Adobe XD layer: 'Login' (group)
//                 Stack(
//               children: <Widget>[
//                 Transform.translate(
//                   offset: Offset(1218.0, 43.0),
//                   child:
//                       // Adobe XD layer: 'Rounded Rectangle 2' (shape)
//                       Container(
//                     width: 180.0,
//                     height: 65.0,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10.0),
//                       color: const Color(0xff707070),
//                     ),
//                   ),
//                 ),
//                 Transform.translate(
//                   offset: Offset(1260.21, 58.2),
//                   child: SizedBox(
//                     width: 96.0,
//                     child: Text(
//                       'Sign In',
//                       style: TextStyle(
//                         fontFamily: 'Roboto',
//                         fontSize: 26,
//                         color: const Color(0xffffffff),
//                         fontWeight: FontWeight.w500,
//                         height: 1.1538462272057166,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Transform.translate(
//             offset: Offset(40.0, 8.0),
//             child:
//                 // Adobe XD layer: 'Logo' (group)
//                 Stack(
//               children: <Widget>[
//                 Transform.translate(
//                   offset: Offset(214.0, 28.82),
//                   child: Text.rich(
//                     TextSpan(
//                       style: TextStyle(
//                         fontFamily: 'Roboto',
//                         fontSize: 40.897491455078125,
//                         color: const Color(0xff7cc576),
//                         height: 1.2000000559647617,
//                       ),
//                       children: [
//                         TextSpan(
//                           text: 'We',
//                           style: TextStyle(
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         TextSpan(
//                           text: 'Care',
//                           style: TextStyle(
//                             color: const Color(0xff707070),
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ],
//                     ),
//                     textAlign: TextAlign.left,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Transform.translate(
//             offset: Offset(254.96, 410.4),
//             child: SizedBox(
//               width: 620.0,
//               height: 165.0,
//               child: Text.rich(
//                 TextSpan(
//                   style: TextStyle(
//                     fontFamily: 'Roboto',
//                     fontSize: 64,
//                     color: const Color(0xff7cc576),
//                     height: 1.2000000476837158,
//                   ),
//                   children: [
//                     TextSpan(
//                       text: 'How to Take Care of',
//                       style: TextStyle(
//                         fontWeight: FontWeight.w100,
//                       ),
//                     ),
//                     TextSpan(
//                       text: ' Newborn Baby',
//                       style: TextStyle(
//                         fontWeight: FontWeight.w900,
//                       ),
//                     ),
//                   ],
//                 ),
//                 textAlign: TextAlign.left,
//               ),
//             ),
//           ),
//           Transform.translate(
//             offset: Offset(254.0, 346.98),
//             child: Text.rich(
//               TextSpan(
//                 style: TextStyle(
//                   fontFamily: 'Roboto',
//                   fontSize: 26,
//                   color: const Color(0xffb0b0b0),
//                   height: 1.1923076923076923,
//                 ),
//                 children: [
//                   TextSpan(
//                     text: 'Welcome ',
//                     style: TextStyle(
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   TextSpan(
//                     text: 'We',
//                     style: TextStyle(
//                       color: const Color(0xff7cc576),
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   TextSpan(
//                     text: 'Care',
//                     style: TextStyle(
//                       color: const Color(0xff707070),
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ],
//               ),
//               textAlign: TextAlign.left,
//             ),
//           ),
//           Transform.translate(
//             offset: Offset(254.0, 598.96),
//             child: SizedBox(
//               width: 640.0,
//               height: 118.0,
//               child: Text(
//                 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,',
//                 style: TextStyle(
//                   fontFamily: 'Roboto',
//                   fontSize: 18,
//                   color: const Color(0xffb0b0b0),
//                   height: 1.7777777777777777,
//                 ),
//                 textAlign: TextAlign.left,
//               ),
//             ),
//           ),
//           Transform.translate(
//             offset: Offset(254.0, 740.67),
//             child:
//                 // Adobe XD layer: 'Button' (group)
//                 Stack(
//               children: <Widget>[
//                 // Adobe XD layer: 'Rounded Rectangle 3' (shape)
//                 Container(
//                   width: 218.5,
//                   height: 58.0,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10.0),
//                     color: const Color(0xff7cc576),
//                   ),
//                 ),
//                 Transform.translate(
//                   offset: Offset(0.0, 28.0),
//                   child:
//                       // Adobe XD layer: 'Rounded Rectangle 3' (shape)
//                       Stack(
//                     overflow: Overflow.visible,
//                     children: <Widget>[
//                       Container(
//                         width: 218.5,
//                         height: 30.0,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(100.0),
//                           color: const Color(0xff7cc576),
//                         ),
//                       ),
//                       Positioned(
//                         left: -30.0,
//                         top: -30.0,
//                         width: 278.5,
//                         height: 90.0,
//                         child: ClipRect(
//                           child: BackdropFilter(
//                             filter:
//                                 ui.ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
//                             child: Container(color: const Color(0x00000000)),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Transform.translate(
//                   offset: Offset(23.92, 10.16),
//                   child: SizedBox(
//                     width: 116.0,
//                     child: Text(
//                       'Learn More',
//                       style: TextStyle(
//                         fontFamily: 'Roboto',
//                         fontSize: 19,
//                         color: const Color(0xffffffff),
//                         fontWeight: FontWeight.w500,
//                         height: 1.5263157894736843,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//                 Transform.translate(
//                   offset: Offset(154.89, 13.33),
//                   child:
//                       // Adobe XD layer: 'arrow-right' (group)
//                       Stack(
//                     children: <Widget>[
//                       Transform.translate(
//                         offset: Offset(-9.0, 4.0),
//                         child: SvgPicture.string(
//                           _svg_x66479,
//                           allowDrawingOutsideViewBox: true,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Transform.translate(
//             offset: Offset(1116.18, 761.46),
//             child:
//                 // Adobe XD layer: 'Ellipse 2' (shape)
//                 Container(
//               width: 122.1,
//               height: 122.1,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.all(Radius.elliptical(61.03, 61.03)),
//                 color: const Color(0xffffffff),
//                 boxShadow: [
//                   BoxShadow(
//                     color: const Color(0x4f7cc576),
//                     offset: Offset(0, 3),
//                     blurRadius: 99,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Transform.translate(
//             offset: Offset(1169.59, 803.03),
//             child:
//                 // Adobe XD layer: 'Shape 1' (shape)
//                 SvgPicture.string(
//               _svg_hj92cf,
//               allowDrawingOutsideViewBox: true,
//             ),
//           ),
//           Transform.translate(
//             offset: Offset(223.0, 1545.0),
//             child:
//                 // Adobe XD layer: 'Group 2' (group)
//                 Stack(
//               children: <Widget>[
//                 // Adobe XD layer: 'Group 3' (group)
//                 Stack(
//                   children: <Widget>[
//                     // Adobe XD layer: 'Ellipse 3' (group)
//                     Stack(
//                       children: <Widget>[
//                         Transform.translate(
//                           offset: Offset(215.51, 993.63),
//                           child:
//                               // Adobe XD layer: 'Ellipse 3' (shape)
//                               SvgPicture.string(
//                             _svg_bgwo2l,
//                             allowDrawingOutsideViewBox: true,
//                           ),
//                         ),
//                         // Adobe XD layer: 'Clip' (group)
//                         Stack(
//                           children: <Widget>[
//                             Transform.translate(
//                               offset: Offset(197.0, 982.0),
//                               child:
//                                   // Adobe XD layer: 'baby-basket-blanket…' (shape)
//                                   Container(
//                                 width: 378.0,
//                                 height: 252.0,
//                                 decoration: BoxDecoration(
//                                   image: DecorationImage(
//                                     image: const AssetImage(''),
//                                     fit: BoxFit.fill,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Transform.translate(
//                               offset: Offset(215.51, 993.63),
//                               child:
//                                   // Adobe XD layer: 'Ellipse 3' (shape)
//                                   SvgPicture.string(
//                                 _svg_bgwo2l,
//                                 allowDrawingOutsideViewBox: true,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 Transform.translate(
//                   offset: Offset(329.64, 1267.88),
//                   child: SizedBox(
//                     width: 114.0,
//                     child: Text(
//                       'Clothing',
//                       style: TextStyle(
//                         fontFamily: 'Roboto',
//                         fontSize: 25,
//                         color: const Color(0xff7cc576),
//                         fontWeight: FontWeight.w900,
//                         height: 1.2000000762939453,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//                 Transform.translate(
//                   offset: Offset(270.0, 1305.82),
//                   child: SizedBox(
//                     width: 232.0,
//                     child: Text(
//                       'Lorem ipsum dolor sit amet',
//                       style: TextStyle(
//                         fontFamily: 'Roboto',
//                         fontSize: 16,
//                         color: const Color(0xffb0b0b0),
//                         fontWeight: FontWeight.w300,
//                         height: 1.8750001192092896,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//                 Transform.translate(
//                   offset: Offset(355.0, 1354.0),
//                   child:
//                       // Adobe XD layer: 'Rectangle 4' (shape)
//                       Container(
//                     width: 65.0,
//                     height: 4.0,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(100.0),
//                       gradient: LinearGradient(
//                         begin: Alignment(-1.08, 0.0),
//                         end: Alignment(1.69, 0.0),
//                         colors: [
//                           const Color(0xffffffff),
//                           const Color(0xff7cc576)
//                         ],
//                         stops: [0.0, 1.0],
//                       ),
//                     ),
//                   ),
//                 ),
//                 Transform.translate(
//                   offset: Offset(746.64, 1267.88),
//                   child: SizedBox(
//                     width: 108.0,
//                     child: Text(
//                       'Feeding',
//                       style: TextStyle(
//                         fontFamily: 'Roboto',
//                         fontSize: 25,
//                         color: const Color(0xff7cc576),
//                         fontWeight: FontWeight.w900,
//                         height: 1.2000000762939453,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//                 Transform.translate(
//                   offset: Offset(684.0, 1305.82),
//                   child: SizedBox(
//                     width: 232.0,
//                     child: Text(
//                       'Lorem ipsum dolor sit amet',
//                       style: TextStyle(
//                         fontFamily: 'Roboto',
//                         fontSize: 16,
//                         color: const Color(0xffb0b0b0),
//                         fontWeight: FontWeight.w300,
//                         height: 1.8750001192092896,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//                 Transform.translate(
//                   offset: Offset(1167.64, 1267.88),
//                   child: SizedBox(
//                     width: 112.0,
//                     child: Text(
//                       'Bedtime',
//                       style: TextStyle(
//                         fontFamily: 'Roboto',
//                         fontSize: 25,
//                         color: const Color(0xff7cc576),
//                         fontWeight: FontWeight.w900,
//                         height: 1.2000000762939453,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//                 Transform.translate(
//                   offset: Offset(1107.0, 1305.82),
//                   child: SizedBox(
//                     width: 232.0,
//                     child: Text(
//                       'Lorem ipsum dolor sit amet',
//                       style: TextStyle(
//                         fontFamily: 'Roboto',
//                         fontSize: 16,
//                         color: const Color(0xffb0b0b0),
//                         fontWeight: FontWeight.w300,
//                         height: 1.8750001192092896,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//                 // Adobe XD layer: 'Group 3 copy' (group)
//                 Stack(
//                   children: <Widget>[
//                     // Adobe XD layer: 'Ellipse 4' (group)
//                     Stack(
//                       children: <Widget>[
//                         Transform.translate(
//                           offset: Offset(630.05, 1014.08),
//                           child:
//                               // Adobe XD layer: 'Ellipse 4' (shape)
//                               SvgPicture.string(
//                             _svg_q4yslp,
//                             allowDrawingOutsideViewBox: true,
//                           ),
//                         ),
//                         // Adobe XD layer: 'Clip' (group)
//                         Stack(
//                           children: <Widget>[
//                             Transform.translate(
//                               offset: Offset(597.0, 989.0),
//                               child:
//                                   // Adobe XD layer: 'baby-child-comfort-…' (shape)
//                                   Container(
//                                 width: 394.0,
//                                 height: 262.0,
//                                 decoration: BoxDecoration(
//                                   image: DecorationImage(
//                                     image: const AssetImage(''),
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Transform.translate(
//                               offset: Offset(630.05, 1014.08),
//                               child:
//                                   // Adobe XD layer: 'Ellipse 4' (shape)
//                                   SvgPicture.string(
//                                 _svg_q4yslp,
//                                 allowDrawingOutsideViewBox: true,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 // Adobe XD layer: 'Group 3 copy 2' (group)
//                 Stack(
//                   children: <Widget>[
//                     // Adobe XD layer: 'Ellipse 3' (group)
//                     Stack(
//                       children: <Widget>[
//                         Transform.translate(
//                           offset: Offset(1059.53, 1006.94),
//                           child:
//                               // Adobe XD layer: 'Ellipse 3' (shape)
//                               SvgPicture.string(
//                             _svg_hq5ng7,
//                             allowDrawingOutsideViewBox: true,
//                           ),
//                         ),
//                         // Adobe XD layer: 'Clip' (group)
//                         Stack(
//                           children: <Widget>[
//                             Transform.translate(
//                               offset: Offset(1019.0, 989.0),
//                               child:
//                                   // Adobe XD layer: 'baby-black-and-whit…' (shape)
//                                   Container(
//                                 width: 402.0,
//                                 height: 227.0,
//                                 decoration: BoxDecoration(
//                                   image: DecorationImage(
//                                     image: const AssetImage(''),
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Transform.translate(
//                               offset: Offset(1059.53, 1006.94),
//                               child:
//                                   // Adobe XD layer: 'Ellipse 3' (shape)
//                                   SvgPicture.string(
//                                 _svg_hq5ng7,
//                                 allowDrawingOutsideViewBox: true,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 Transform.translate(
//                   offset: Offset(452.0, 810.96),
//                   child: SizedBox(
//                     width: 640.0,
//                     height: 68.0,
//                     child: Text(
//                       'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer turpis risus, rutrum imperdiet finibus in, iaculis eu leo. Duis vitae turpis augue.',
//                       style: TextStyle(
//                         fontFamily: 'Roboto',
//                         fontSize: 18,
//                         color: const Color(0xffb0b0b0),
//                         height: 1.7777777777777777,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//                 Transform.translate(
//                   offset: Offset(601.0, 750.98),
//                   child: SizedBox(
//                     width: 342.0,
//                     child: Text(
//                       'Newborn Care',
//                       style: TextStyle(
//                         fontFamily: 'Roboto',
//                         fontSize: 45,
//                         color: const Color(0xff707070),
//                         fontWeight: FontWeight.w500,
//                         height: 0.6888888888888889,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//                 Transform.translate(
//                   offset: Offset(647.0, 916.0),
//                   child: Container(
//                     width: 250.0,
//                     height: 5.0,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(100.0),
//                       gradient: LinearGradient(
//                         begin: Alignment(-1.08, 0.0),
//                         end: Alignment(1.69, 0.0),
//                         colors: [
//                           const Color(0xffffffff),
//                           const Color(0xff7cc576)
//                         ],
//                         stops: [0.0, 1.0],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Transform.translate(
//             offset: Offset(0.0, -606.0),
//             child:
//                 // Adobe XD layer: 'Best Deals' (group)
//                 Stack(
//               children: <Widget>[
//                 Stack(
//                   children: <Widget>[
//                     Transform.translate(
//                       offset: Offset(258.0, 2571.0),
//                       child: Stack(
//                         overflow: Overflow.visible,
//                         children: <Widget>[
//                           Container(
//                             width: 432.0,
//                             height: 161.0,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(34.0),
//                               color: const Color(0x577cc576),
//                             ),
//                           ),
//                           Positioned(
//                             left: -49.0,
//                             top: -49.0,
//                             width: 530.0,
//                             height: 259.0,
//                             child: ClipRect(
//                               child: BackdropFilter(
//                                 filter: ui.ImageFilter.blur(
//                                     sigmaX: 49.0, sigmaY: 49.0),
//                                 child:
//                                     Container(color: const Color(0x00000000)),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Transform.translate(
//                       offset: Offset(258.0, 2080.0),
//                       child: Container(
//                         width: 432.0,
//                         height: 608.0,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(34.0),
//                           color: const Color(0xff7cc576),
//                           boxShadow: [
//                             BoxShadow(
//                               color: const Color(0x29c8c8c8),
//                               offset: Offset(0, 0),
//                               blurRadius: 99,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Transform.translate(
//                       offset: Offset(282.0, 1978.0),
//                       child:
//                           // Adobe XD layer: '1' (shape)
//                           Container(
//                         width: 384.0,
//                         height: 512.0,
//                         decoration: BoxDecoration(
//                           image: DecorationImage(
//                             image: const AssetImage(''),
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                       ),
//                     ),
//                     Transform.translate(
//                       offset: Offset(300.64, 2529.88),
//                       child: SizedBox(
//                         width: 364.0,
//                         child: Text(
//                           'Mee Mee Baby Stroller',
//                           style: TextStyle(
//                             fontFamily: 'Roboto',
//                             fontSize: 30,
//                             color: const Color(0xffffffff),
//                             fontWeight: FontWeight.w500,
//                             height: 1.0000000635782877,
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//                     ),
//                     Transform.translate(
//                       offset: Offset(395.0, 2576.82),
//                       child: SizedBox(
//                         width: 158.0,
//                         child: Text(
//                           'Add To Cart',
//                           style: TextStyle(
//                             fontFamily: 'Roboto',
//                             fontSize: 25,
//                             color: const Color(0x94ffffff),
//                             fontWeight: FontWeight.w500,
//                             height: 1.2000000762939453,
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Transform.translate(
//                   offset: Offset(488.0, 0.0),
//                   child: Stack(
//                     children: <Widget>[
//                       Transform.translate(
//                         offset: Offset(258.0, 2571.0),
//                         child: Stack(
//                           overflow: Overflow.visible,
//                           children: <Widget>[
//                             Container(
//                               width: 432.0,
//                               height: 161.0,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(34.0),
//                                 color: const Color(0x577cc576),
//                               ),
//                             ),
//                             Positioned(
//                               left: -49.0,
//                               top: -49.0,
//                               width: 530.0,
//                               height: 259.0,
//                               child: ClipRect(
//                                 child: BackdropFilter(
//                                   filter: ui.ImageFilter.blur(
//                                       sigmaX: 49.0, sigmaY: 49.0),
//                                   child:
//                                       Container(color: const Color(0x00000000)),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Transform.translate(
//                         offset: Offset(258.0, 2080.0),
//                         child: Container(
//                           width: 432.0,
//                           height: 608.0,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(34.0),
//                             color: const Color(0xff7cc576),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: const Color(0x29c8c8c8),
//                                 offset: Offset(0, 0),
//                                 blurRadius: 99,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       Transform.translate(
//                         offset: Offset(287.0, 2003.0),
//                         child:
//                             // Adobe XD layer: '2' (shape)
//                             Container(
//                           width: 347.0,
//                           height: 486.0,
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                               image: const AssetImage(''),
//                               fit: BoxFit.fill,
//                             ),
//                           ),
//                         ),
//                       ),
//                       Transform.translate(
//                         offset: Offset(312.64, 2529.88),
//                         child: SizedBox(
//                           width: 340.0,
//                           child: Text(
//                             'Hooded Blanket Cum',
//                             style: TextStyle(
//                               fontFamily: 'Roboto',
//                               fontSize: 30,
//                               color: const Color(0xffffffff),
//                               fontWeight: FontWeight.w500,
//                               height: 1.0000000635782877,
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
//                       ),
//                       Transform.translate(
//                         offset: Offset(395.0, 2576.82),
//                         child: SizedBox(
//                           width: 158.0,
//                           child: Text(
//                             'Add To Cart',
//                             style: TextStyle(
//                               fontFamily: 'Roboto',
//                               fontSize: 25,
//                               color: const Color(0x94ffffff),
//                               fontWeight: FontWeight.w500,
//                               height: 1.2000000762939453,
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Transform.translate(
//                   offset: Offset(976.0, 0.0),
//                   child: Stack(
//                     children: <Widget>[
//                       Transform.translate(
//                         offset: Offset(258.0, 2571.0),
//                         child: Stack(
//                           overflow: Overflow.visible,
//                           children: <Widget>[
//                             Container(
//                               width: 432.0,
//                               height: 161.0,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(34.0),
//                                 color: const Color(0x577cc576),
//                               ),
//                             ),
//                             Positioned(
//                               left: -49.0,
//                               top: -49.0,
//                               width: 530.0,
//                               height: 259.0,
//                               child: ClipRect(
//                                 child: BackdropFilter(
//                                   filter: ui.ImageFilter.blur(
//                                       sigmaX: 49.0, sigmaY: 49.0),
//                                   child:
//                                       Container(color: const Color(0x00000000)),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Transform.translate(
//                         offset: Offset(258.0, 2080.0),
//                         child: Container(
//                           width: 432.0,
//                           height: 608.0,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(34.0),
//                             color: const Color(0xff7cc576),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: const Color(0x29c8c8c8),
//                                 offset: Offset(0, 0),
//                                 blurRadius: 99,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       Transform.translate(
//                         offset: Offset(319.0, 1999.0),
//                         child:
//                             // Adobe XD layer: '3' (shape)
//                             Container(
//                           width: 311.0,
//                           height: 546.0,
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                               image: const AssetImage(''),
//                               fit: BoxFit.fill,
//                             ),
//                           ),
//                         ),
//                       ),
//                       Transform.translate(
//                         offset: Offset(344.64, 2529.88),
//                         child: SizedBox(
//                           width: 276.0,
//                           child: Text(
//                             'Gentle Baby Bath',
//                             style: TextStyle(
//                               fontFamily: 'Roboto',
//                               fontSize: 30,
//                               color: const Color(0xffffffff),
//                               fontWeight: FontWeight.w500,
//                               height: 1.0000000635782877,
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
//                       ),
//                       Transform.translate(
//                         offset: Offset(395.0, 2576.82),
//                         child: SizedBox(
//                           width: 158.0,
//                           child: Text(
//                             'Add To Cart',
//                             style: TextStyle(
//                               fontFamily: 'Roboto',
//                               fontSize: 25,
//                               color: const Color(0x94ffffff),
//                               fontWeight: FontWeight.w500,
//                               height: 1.2000000762939453,
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Transform.translate(
//                   offset: Offset(675.0, 1799.96),
//                   child: SizedBox(
//                     width: 640.0,
//                     height: 68.0,
//                     child: Text(
//                       'A newborn baby can feel small and fragile. Learn how to care for your newborn and find out what',
//                       style: TextStyle(
//                         fontFamily: 'Roboto',
//                         fontSize: 18,
//                         color: const Color(0xffb0b0b0),
//                         height: 1.7777777777777777,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//                 Transform.translate(
//                   offset: Offset(870.0, 1890.0),
//                   child: Container(
//                     width: 250.0,
//                     height: 5.0,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(100.0),
//                       gradient: LinearGradient(
//                         begin: Alignment(-1.08, 0.0),
//                         end: Alignment(1.69, 0.0),
//                         colors: [
//                           const Color(0xffffffff),
//                           const Color(0xff7cc576)
//                         ],
//                         stops: [0.0, 1.0],
//                       ),
//                     ),
//                   ),
//                 ),
//                 Transform.translate(
//                   offset: Offset(867.0, 1739.98),
//                   child: SizedBox(
//                     width: 256.0,
//                     child: Text(
//                       'Best Deals',
//                       style: TextStyle(
//                         fontFamily: 'Roboto',
//                         fontSize: 45,
//                         color: const Color(0xff707070),
//                         fontWeight: FontWeight.w500,
//                         height: 0.6888888888888889,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Transform.translate(
//             offset: Offset(0.0, 3302.0),
//             child: Container(
//               width: 952.0,
//               height: 558.0,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topRight: Radius.circular(30.0),
//                   bottomRight: Radius.circular(146.0),
//                 ),
//                 color: const Color(0xff7cc576),
//               ),
//             ),
//           ),
//           Transform.translate(
//             offset: Offset(284.0, 3018.0),
//             child:
//                 // Adobe XD layer: '4' (shape)
//                 Container(
//               width: 593.0,
//               height: 842.0,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: const AssetImage(''),
//                   fit: BoxFit.fill,
//                 ),
//               ),
//             ),
//           ),
//           Transform.translate(
//             offset: Offset(1026.02, 3465.96),
//             child: SizedBox(
//               width: 640.0,
//               height: 68.0,
//               child: Text(
//                 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer turpis risus, rutrum imperdiet finibus in, iaculis eu leo. Duis vitae turpis augue.',
//                 style: TextStyle(
//                   fontFamily: 'Roboto',
//                   fontSize: 18,
//                   color: const Color(0xffb0b0b0),
//                   height: 1.7777777777777777,
//                 ),
//                 textAlign: TextAlign.left,
//               ),
//             ),
//           ),
//           Transform.translate(
//             offset: Offset(1026.02, 3399.98),
//             child: Text(
//               'Baby Carrier One Air',
//               style: TextStyle(
//                 fontFamily: 'Roboto',
//                 fontSize: 45,
//                 color: const Color(0xff707070),
//                 fontWeight: FontWeight.w500,
//                 height: 0.6888888888888889,
//               ),
//               textAlign: TextAlign.left,
//             ),
//           ),
//           Transform.translate(
//             offset: Offset(1026.02, 3584.33),
//             child: Text.rich(
//               TextSpan(
//                 style: TextStyle(
//                   fontFamily: 'Roboto',
//                   fontSize: 43,
//                   color: const Color(0xff7cc576),
//                   height: 0.7441860465116279,
//                 ),
//                 children: [
//                   TextSpan(
//                     text: 'Price ',
//                   ),
//                   TextSpan(
//                     text: '\$219.99',
//                     style: TextStyle(
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                 ],
//               ),
//               textAlign: TextAlign.left,
//             ),
//           ),
//           Transform.translate(
//             offset: Offset(-177.0, 3369.0),
//             child:
//                 // Adobe XD layer: '5' (shape)
//                 Stack(
//               overflow: Overflow.visible,
//               children: <Widget>[
//                 Container(
//                   width: 570.0,
//                   height: 424.0,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: const AssetImage(''),
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   left: -5.0,
//                   top: -5.0,
//                   width: 580.0,
//                   height: 434.0,
//                   child: ClipRect(
//                     child: BackdropFilter(
//                       filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
//                       child: Container(color: const Color(0x00000000)),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Transform.translate(
//             offset: Offset(1026.0, 3672.67),
//             child:
//                 // Adobe XD layer: 'Button' (group)
//                 Stack(
//               children: <Widget>[
//                 // Adobe XD layer: 'Rounded Rectangle 3' (shape)
//                 Container(
//                   width: 218.5,
//                   height: 58.0,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10.0),
//                     color: const Color(0xff7cc576),
//                   ),
//                 ),
//                 Transform.translate(
//                   offset: Offset(0.0, 28.0),
//                   child:
//                       // Adobe XD layer: 'Rounded Rectangle 3' (shape)
//                       Stack(
//                     overflow: Overflow.visible,
//                     children: <Widget>[
//                       Container(
//                         width: 218.5,
//                         height: 30.0,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(100.0),
//                           color: const Color(0xff7cc576),
//                         ),
//                       ),
//                       Positioned(
//                         left: -30.0,
//                         top: -30.0,
//                         width: 278.5,
//                         height: 90.0,
//                         child: ClipRect(
//                           child: BackdropFilter(
//                             filter:
//                                 ui.ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
//                             child: Container(color: const Color(0x00000000)),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Transform.translate(
//                   offset: Offset(19.92, 10.16),
//                   child: SizedBox(
//                     width: 124.0,
//                     child: Text(
//                       'View Details',
//                       style: TextStyle(
//                         fontFamily: 'Roboto',
//                         fontSize: 19,
//                         color: const Color(0xffffffff),
//                         fontWeight: FontWeight.w500,
//                         height: 1.5263157894736843,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//                 Transform.translate(
//                   offset: Offset(154.89, 13.33),
//                   child:
//                       // Adobe XD layer: 'arrow-right' (group)
//                       Stack(
//                     children: <Widget>[
//                       Transform.translate(
//                         offset: Offset(-9.0, 4.0),
//                         child: SvgPicture.string(
//                           _svg_x66479,
//                           allowDrawingOutsideViewBox: true,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           // Adobe XD layer: 'BabyCare Articles' (group)
//           Stack(
//             children: <Widget>[
//               Transform.translate(
//                 offset: Offset(223.0, 3326.0),
//                 child:
//                     // Adobe XD layer: 'Group 2' (group)
//                     Stack(
//                   children: <Widget>[
//                     Transform.translate(
//                       offset: Offset(452.0, 810.96),
//                       child: SizedBox(
//                         width: 640.0,
//                         height: 68.0,
//                         child: Text(
//                           'A newborn baby can feel small and fragile. Learn how to care for your newborn and find out what',
//                           style: TextStyle(
//                             fontFamily: 'Roboto',
//                             fontSize: 18,
//                             color: const Color(0xffb0b0b0),
//                             height: 1.7777777777777777,
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//                     ),
//                     Transform.translate(
//                       offset: Offset(556.0, 750.98),
//                       child: SizedBox(
//                         width: 432.0,
//                         child: Text(
//                           'BabyCare Articles',
//                           style: TextStyle(
//                             fontFamily: 'Roboto',
//                             fontSize: 45,
//                             color: const Color(0xff707070),
//                             fontWeight: FontWeight.w500,
//                             height: 0.6888888888888889,
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//                     ),
//                     Transform.translate(
//                       offset: Offset(647.0, 916.0),
//                       child: Container(
//                         width: 250.0,
//                         height: 5.0,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(100.0),
//                           gradient: LinearGradient(
//                             begin: Alignment(-1.08, 0.0),
//                             end: Alignment(1.69, 0.0),
//                             colors: [
//                               const Color(0xffffffff),
//                               const Color(0xff7cc576)
//                             ],
//                             stops: [0.0, 1.0],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Transform.translate(
//                 offset: Offset(0.0, 2231.0),
//                 child:
//                     // Adobe XD layer: '1' (group)
//                     Stack(
//                   children: <Widget>[
//                     Transform.translate(
//                       offset: Offset(258.0, 2657.0),
//                       child: Stack(
//                         overflow: Overflow.visible,
//                         children: <Widget>[
//                           Container(
//                             width: 432.0,
//                             height: 161.0,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(34.0),
//                               color: const Color(0x26dbffd8),
//                             ),
//                           ),
//                           Positioned(
//                             left: -49.0,
//                             top: -49.0,
//                             width: 530.0,
//                             height: 259.0,
//                             child: ClipRect(
//                               child: BackdropFilter(
//                                 filter: ui.ImageFilter.blur(
//                                     sigmaX: 49.0, sigmaY: 49.0),
//                                 child:
//                                     Container(color: const Color(0x00000000)),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Transform.translate(
//                       offset: Offset(258.0, 2080.0),
//                       child: Container(
//                         width: 432.0,
//                         height: 694.0,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(34.0),
//                           color: const Color(0xffffffff),
//                           boxShadow: [
//                             BoxShadow(
//                               color: const Color(0x29c8c8c8),
//                               offset: Offset(0, 0),
//                               blurRadius: 99,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Transform.translate(
//                       offset: Offset(311.0, 2423.3),
//                       child: SizedBox(
//                         width: 323.0,
//                         height: 63.0,
//                         child: Text(
//                           'Congratulations! You\'ve got a new member of your family.',
//                           style: TextStyle(
//                             fontFamily: 'Lato',
//                             fontSize: 20,
//                             color: const Color(0xff5a5454),
//                             fontWeight: FontWeight.w700,
//                             height: 1.3,
//                           ),
//                           textAlign: TextAlign.left,
//                         ),
//                       ),
//                     ),
//                     Transform.translate(
//                       offset: Offset(311.0, 2527.67),
//                       child: SizedBox(
//                         width: 323.0,
//                         height: 150.0,
//                         child: Text(
//                           'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer turpis risus, rutrum imperdiet finibus in, iaculis eu leo. Duis vitae turpis augue. Sed ullamcorper faucibus volutpat. Fusce faucibus euismod auctor.',
//                           style: TextStyle(
//                             fontFamily: 'Roboto',
//                             fontSize: 15,
//                             color: const Color(0xff747474),
//                             height: 1.8666666666666667,
//                           ),
//                           textAlign: TextAlign.left,
//                         ),
//                       ),
//                     ),
//                     Transform.translate(
//                       offset: Offset(311.0, 2484.67),
//                       child: Text(
//                         'By Olivia - May 28, 2019',
//                         style: TextStyle(
//                           fontFamily: 'Roboto',
//                           fontSize: 15,
//                           color: const Color(0xff7cc576),
//                           height: 1.8666666666666667,
//                         ),
//                         textAlign: TextAlign.left,
//                       ),
//                     ),
//                     Transform.translate(
//                       offset: Offset(243.0, 2280.57),
//                       child: Stack(
//                         children: <Widget>[
//                           Transform.translate(
//                             offset: Offset(68.5, 430.93),
//                             child: SvgPicture.string(
//                               _svg_xzbps5,
//                               allowDrawingOutsideViewBox: true,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Transform.translate(
//                       offset: Offset(258.0, 2080.0),
//                       child:
//                           // Adobe XD layer: '10' (shape)
//                           Container(
//                         width: 432.0,
//                         height: 285.0,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(34.0),
//                             topRight: Radius.circular(34.0),
//                           ),
//                           image: DecorationImage(
//                             image: const AssetImage(''),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Transform.translate(
//                 offset: Offset(488.0, 2231.0),
//                 child:
//                     // Adobe XD layer: '1' (group)
//                     Stack(
//                   children: <Widget>[
//                     Transform.translate(
//                       offset: Offset(258.0, 2657.0),
//                       child: Stack(
//                         overflow: Overflow.visible,
//                         children: <Widget>[
//                           Container(
//                             width: 432.0,
//                             height: 161.0,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(34.0),
//                               color: const Color(0x26dbffd8),
//                             ),
//                           ),
//                           Positioned(
//                             left: -49.0,
//                             top: -49.0,
//                             width: 530.0,
//                             height: 259.0,
//                             child: ClipRect(
//                               child: BackdropFilter(
//                                 filter: ui.ImageFilter.blur(
//                                     sigmaX: 49.0, sigmaY: 49.0),
//                                 child:
//                                     Container(color: const Color(0x00000000)),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Transform.translate(
//                       offset: Offset(258.0, 2080.0),
//                       child: Container(
//                         width: 432.0,
//                         height: 694.0,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(34.0),
//                           color: const Color(0xffffffff),
//                           boxShadow: [
//                             BoxShadow(
//                               color: const Color(0x29c8c8c8),
//                               offset: Offset(0, 0),
//                               blurRadius: 99,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Transform.translate(
//                       offset: Offset(311.0, 2423.3),
//                       child: SizedBox(
//                         width: 323.0,
//                         height: 63.0,
//                         child: Text(
//                           'Changing diapers frequently is an important aspect',
//                           style: TextStyle(
//                             fontFamily: 'Lato',
//                             fontSize: 20,
//                             color: const Color(0xff5a5454),
//                             fontWeight: FontWeight.w700,
//                             height: 1.3,
//                           ),
//                           textAlign: TextAlign.left,
//                         ),
//                       ),
//                     ),
//                     Transform.translate(
//                       offset: Offset(311.0, 2527.67),
//                       child: SizedBox(
//                         width: 323.0,
//                         height: 150.0,
//                         child: Text(
//                           'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer turpis risus, rutrum imperdiet finibus in, iaculis eu leo. Duis vitae turpis augue. Sed ullamcorper faucibus volutpat. Fusce faucibus euismod auctor.',
//                           style: TextStyle(
//                             fontFamily: 'Roboto',
//                             fontSize: 15,
//                             color: const Color(0xff747474),
//                             height: 1.8666666666666667,
//                           ),
//                           textAlign: TextAlign.left,
//                         ),
//                       ),
//                     ),
//                     Transform.translate(
//                       offset: Offset(311.0, 2484.67),
//                       child: Text(
//                         'By Olivia - May 28, 2019',
//                         style: TextStyle(
//                           fontFamily: 'Roboto',
//                           fontSize: 15,
//                           color: const Color(0xff7cc576),
//                           height: 1.8666666666666667,
//                         ),
//                         textAlign: TextAlign.left,
//                       ),
//                     ),
//                     Transform.translate(
//                       offset: Offset(243.0, 2280.57),
//                       child: Stack(
//                         children: <Widget>[
//                           Transform.translate(
//                             offset: Offset(68.5, 430.93),
//                             child: SvgPicture.string(
//                               _svg_xzbps5,
//                               allowDrawingOutsideViewBox: true,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Transform.translate(
//                       offset: Offset(258.0, 2080.0),
//                       child:
//                           // Adobe XD layer: '11' (shape)
//                           Container(
//                         width: 432.0,
//                         height: 285.0,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(34.0),
//                             topRight: Radius.circular(34.0),
//                           ),
//                           image: DecorationImage(
//                             image: const AssetImage(''),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Transform.translate(
//                 offset: Offset(976.0, 2231.0),
//                 child:
//                     // Adobe XD layer: '1' (group)
//                     Stack(
//                   children: <Widget>[
//                     Transform.translate(
//                       offset: Offset(258.0, 2657.0),
//                       child: Stack(
//                         overflow: Overflow.visible,
//                         children: <Widget>[
//                           Container(
//                             width: 432.0,
//                             height: 161.0,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(34.0),
//                               color: const Color(0x26dbffd8),
//                             ),
//                           ),
//                           Positioned(
//                             left: -49.0,
//                             top: -49.0,
//                             width: 530.0,
//                             height: 259.0,
//                             child: ClipRect(
//                               child: BackdropFilter(
//                                 filter: ui.ImageFilter.blur(
//                                     sigmaX: 49.0, sigmaY: 49.0),
//                                 child:
//                                     Container(color: const Color(0x00000000)),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Transform.translate(
//                       offset: Offset(258.0, 2080.0),
//                       child: Container(
//                         width: 432.0,
//                         height: 694.0,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(34.0),
//                           color: const Color(0xffffffff),
//                           boxShadow: [
//                             BoxShadow(
//                               color: const Color(0x29c8c8c8),
//                               offset: Offset(0, 0),
//                               blurRadius: 99,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Transform.translate(
//                       offset: Offset(311.0, 2423.3),
//                       child: SizedBox(
//                         width: 323.0,
//                         height: 63.0,
//                         child: Text(
//                           'Here’s How You Can Get Your Kids to Eat Whole Grains',
//                           style: TextStyle(
//                             fontFamily: 'Lato',
//                             fontSize: 20,
//                             color: const Color(0xff5a5454),
//                             fontWeight: FontWeight.w700,
//                             height: 1.3,
//                           ),
//                           textAlign: TextAlign.left,
//                         ),
//                       ),
//                     ),
//                     Transform.translate(
//                       offset: Offset(311.0, 2527.67),
//                       child: SizedBox(
//                         width: 323.0,
//                         height: 150.0,
//                         child: Text(
//                           'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer turpis risus, rutrum imperdiet finibus in, iaculis eu leo. Duis vitae turpis augue. Sed ullamcorper faucibus volutpat. Fusce faucibus euismod auctor.',
//                           style: TextStyle(
//                             fontFamily: 'Roboto',
//                             fontSize: 15,
//                             color: const Color(0xff747474),
//                             height: 1.8666666666666667,
//                           ),
//                           textAlign: TextAlign.left,
//                         ),
//                       ),
//                     ),
//                     Transform.translate(
//                       offset: Offset(311.0, 2484.67),
//                       child: Text(
//                         'By Olivia - May 28, 2019',
//                         style: TextStyle(
//                           fontFamily: 'Roboto',
//                           fontSize: 15,
//                           color: const Color(0xff7cc576),
//                           height: 1.8666666666666667,
//                         ),
//                         textAlign: TextAlign.left,
//                       ),
//                     ),
//                     Transform.translate(
//                       offset: Offset(243.0, 2280.57),
//                       child: Stack(
//                         children: <Widget>[
//                           Transform.translate(
//                             offset: Offset(68.5, 430.93),
//                             child: SvgPicture.string(
//                               _svg_xzbps5,
//                               allowDrawingOutsideViewBox: true,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Transform.translate(
//                       offset: Offset(258.0, 2080.0),
//                       child:
//                           // Adobe XD layer: '12' (shape)
//                           Container(
//                         width: 432.0,
//                         height: 285.0,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(34.0),
//                             topRight: Radius.circular(34.0),
//                           ),
//                           image: DecorationImage(
//                             image: const AssetImage(''),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Transform.translate(
//                 offset: Offset(886.0, 5100.67),
//                 child:
//                     // Adobe XD layer: 'Button' (group)
//                     Stack(
//                   children: <Widget>[
//                     Transform.translate(
//                       offset: Offset(0.0, 0.33),
//                       child:
//                           // Adobe XD layer: 'Rounded Rectangle 3' (shape)
//                           SvgPicture.string(
//                         _svg_igbqdo,
//                         allowDrawingOutsideViewBox: true,
//                       ),
//                     ),
//                     Transform.translate(
//                       offset: Offset(64.0, 10.16),
//                       child: SizedBox(
//                         width: 90.0,
//                         child: Text(
//                           'All Posts',
//                           style: TextStyle(
//                             fontFamily: 'Roboto',
//                             fontSize: 19,
//                             color: const Color(0xffb0b0b0),
//                             fontWeight: FontWeight.w500,
//                             height: 1.5263157894736843,
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           Transform.translate(
//             offset: Offset(0.0, 5301.0),
//             child: Container(
//               width: 1920.0,
//               height: 558.0,
//               decoration: BoxDecoration(
//                 color: const Color(0xff7cc576),
//               ),
//             ),
//           ),
//           Transform.translate(
//             offset: Offset(0.0, -30.0),
//             child:
//                 // Adobe XD layer: 'Footer' (group)
//                 Stack(
//               children: <Widget>[
//                 Transform.translate(
//                   offset: Offset(0.0, 6986.67),
//                   child: SvgPicture.string(
//                     _svg_w087tr,
//                     allowDrawingOutsideViewBox: true,
//                   ),
//                 ),
//                 Transform.translate(
//                   offset: Offset(857.0, 7669.67),
//                   child: Text(
//                     'Designed by @uiexpert - 2019',
//                     style: TextStyle(
//                       fontFamily: 'Roboto',
//                       fontSize: 16,
//                       color: const Color(0xffb0b0b0),
//                       height: 1.75,
//                     ),
//                     textAlign: TextAlign.left,
//                   ),
//                 ),
//                 Transform.translate(
//                   offset: Offset(1501.0, 7356.5),
//                   child: SvgPicture.string(
//                     _svg_a0kocv,
//                     allowDrawingOutsideViewBox: true,
//                   ),
//                 ),
//                 Transform.translate(
//                   offset: Offset(-87.0, 1430.0),
//                   child: Stack(
//                     children: <Widget>[
//                       Transform.translate(
//                         offset: Offset(467.0, 5809.0),
//                         child: Stack(
//                           children: <Widget>[
//                             Transform.translate(
//                               offset: Offset(0.0, 56.67),
//                               child: SizedBox(
//                                 width: 168.0,
//                                 height: 28.0,
//                                 child: Text(
//                                   'Privacy and policy',
//                                   style: TextStyle(
//                                     fontFamily: 'Roboto',
//                                     fontSize: 20,
//                                     color: const Color(0xff4b647e),
//                                     height: 1.4,
//                                   ),
//                                   textAlign: TextAlign.left,
//                                 ),
//                               ),
//                             ),
//                             Transform.translate(
//                               offset: Offset(0.0, 105.67),
//                               child: SizedBox(
//                                 width: 140.0,
//                                 height: 28.0,
//                                 child: Text(
//                                   'Our Customer',
//                                   style: TextStyle(
//                                     fontFamily: 'Roboto',
//                                     fontSize: 20,
//                                     color: const Color(0xff4b647e),
//                                     height: 1.4,
//                                   ),
//                                   textAlign: TextAlign.left,
//                                 ),
//                               ),
//                             ),
//                             Transform.translate(
//                               offset: Offset(0.0, 154.67),
//                               child: SizedBox(
//                                 width: 140.0,
//                                 height: 28.0,
//                                 child: Text(
//                                   'Blog Post',
//                                   style: TextStyle(
//                                     fontFamily: 'Roboto',
//                                     fontSize: 20,
//                                     color: const Color(0xff4b647e),
//                                     height: 1.4,
//                                   ),
//                                   textAlign: TextAlign.left,
//                                 ),
//                               ),
//                             ),
//                             Transform.translate(
//                               offset: Offset(0.0, 203.67),
//                               child: SizedBox(
//                                 width: 140.0,
//                                 height: 28.0,
//                                 child: Text(
//                                   'Help & Support',
//                                   style: TextStyle(
//                                     fontFamily: 'Roboto',
//                                     fontSize: 20,
//                                     color: const Color(0xff4b647e),
//                                     height: 1.4,
//                                   ),
//                                   textAlign: TextAlign.left,
//                                 ),
//                               ),
//                             ),
//                             Transform.translate(
//                               offset: Offset(0.0, 0.67),
//                               child: SizedBox(
//                                 width: 140.0,
//                                 height: 28.0,
//                                 child: SingleChildScrollView(
//                                     child: Text(
//                                   'About Us',
//                                   style: TextStyle(
//                                     fontFamily: 'Roboto',
//                                     fontSize: 24,
//                                     color: const Color(0xff747474),
//                                     height: 1.1666666666666667,
//                                   ),
//                                   textAlign: TextAlign.left,
//                                 )),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Transform.translate(
//                         offset: Offset(1009.74, 5809.0),
//                         child: Stack(
//                           children: <Widget>[
//                             Transform.translate(
//                               offset: Offset(0.0, 56.67),
//                               child: SizedBox(
//                                 width: 192.0,
//                                 height: 28.0,
//                                 child: Text(
//                                   'Help Center',
//                                   style: TextStyle(
//                                     fontFamily: 'Roboto',
//                                     fontSize: 20,
//                                     color: const Color(0xff4b647e),
//                                     height: 1.4,
//                                   ),
//                                   textAlign: TextAlign.left,
//                                 ),
//                               ),
//                             ),
//                             Transform.translate(
//                               offset: Offset(0.0, 105.67),
//                               child: SizedBox(
//                                 width: 185.0,
//                                 height: 28.0,
//                                 child: Text(
//                                   'Contact Support',
//                                   style: TextStyle(
//                                     fontFamily: 'Roboto',
//                                     fontSize: 20,
//                                     color: const Color(0xff4b647e),
//                                     height: 1.4,
//                                   ),
//                                   textAlign: TextAlign.left,
//                                 ),
//                               ),
//                             ),
//                             Transform.translate(
//                               offset: Offset(0.0, 154.67),
//                               child: SizedBox(
//                                 width: 192.0,
//                                 height: 28.0,
//                                 child: Text(
//                                   'Instructions',
//                                   style: TextStyle(
//                                     fontFamily: 'Roboto',
//                                     fontSize: 20,
//                                     color: const Color(0xff4b647e),
//                                     height: 1.4,
//                                   ),
//                                   textAlign: TextAlign.left,
//                                 ),
//                               ),
//                             ),
//                             Transform.translate(
//                               offset: Offset(0.0, 203.67),
//                               child: SizedBox(
//                                 width: 192.0,
//                                 height: 28.0,
//                                 child: Text(
//                                   'Some Question',
//                                   style: TextStyle(
//                                     fontFamily: 'Roboto',
//                                     fontSize: 20,
//                                     color: const Color(0xff4b647e),
//                                     height: 1.4,
//                                   ),
//                                   textAlign: TextAlign.left,
//                                 ),
//                               ),
//                             ),
//                             Transform.translate(
//                               offset: Offset(0.0, 0.67),
//                               child: SizedBox(
//                                 width: 198.0,
//                                 height: 28.0,
//                                 child: SingleChildScrollView(
//                                     child: Text(
//                                   'Help & Advice',
//                                   style: TextStyle(
//                                     fontFamily: 'Roboto',
//                                     fontSize: 24,
//                                     color: const Color(0xff747474),
//                                     height: 1.1666666666666667,
//                                   ),
//                                   textAlign: TextAlign.left,
//                                 )),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Transform.translate(
//                         offset: Offset(752.3, 5809.0),
//                         child: Stack(
//                           children: <Widget>[
//                             Transform.translate(
//                               offset: Offset(0.0, 56.67),
//                               child: SizedBox(
//                                 width: 140.0,
//                                 height: 28.0,
//                                 child: Text(
//                                   'About us',
//                                   style: TextStyle(
//                                     fontFamily: 'Roboto',
//                                     fontSize: 20,
//                                     color: const Color(0xff4b647e),
//                                     height: 1.4,
//                                   ),
//                                   textAlign: TextAlign.left,
//                                 ),
//                               ),
//                             ),
//                             Transform.translate(
//                               offset: Offset(0.0, 105.67),
//                               child: SizedBox(
//                                 width: 140.0,
//                                 height: 28.0,
//                                 child: Text(
//                                   'Our clients',
//                                   style: TextStyle(
//                                     fontFamily: 'Roboto',
//                                     fontSize: 20,
//                                     color: const Color(0xff4b647e),
//                                     height: 1.4,
//                                   ),
//                                   textAlign: TextAlign.left,
//                                 ),
//                               ),
//                             ),
//                             Transform.translate(
//                               offset: Offset(0.0, 154.67),
//                               child: SizedBox(
//                                 width: 140.0,
//                                 height: 28.0,
//                                 child: Text(
//                                   'Legal notic',
//                                   style: TextStyle(
//                                     fontFamily: 'Roboto',
//                                     fontSize: 20,
//                                     color: const Color(0xff4b647e),
//                                     height: 1.4,
//                                   ),
//                                   textAlign: TextAlign.left,
//                                 ),
//                               ),
//                             ),
//                             Transform.translate(
//                               offset: Offset(0.0, 0.67),
//                               child: SizedBox(
//                                 width: 140.0,
//                                 height: 28.0,
//                                 child: SingleChildScrollView(
//                                     child: Text(
//                                   'Community',
//                                   style: TextStyle(
//                                     fontFamily: 'Roboto',
//                                     fontSize: 24,
//                                     color: const Color(0xff747474),
//                                     height: 1.1666666666666667,
//                                   ),
//                                   textAlign: TextAlign.left,
//                                 )),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Transform.translate(
//                         offset: Offset(1442.0, 5791.54),
//                         child: Stack(
//                           children: <Widget>[
//                             Transform.translate(
//                               offset: Offset(-116.0, 155.0),
//                               child:
//                                   // Adobe XD layer: 'Social' (group)
//                                   Stack(
//                                 children: <Widget>[
//                                   Container(
//                                     width: 43.0,
//                                     height: 43.0,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.all(
//                                           Radius.elliptical(21.5, 21.5)),
//                                       color: const Color(0xff7bc576),
//                                     ),
//                                   ),
//                                   Transform.translate(
//                                     offset: Offset(56.0, 0.0),
//                                     child: Container(
//                                       width: 43.0,
//                                       height: 43.0,
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.all(
//                                             Radius.elliptical(21.5, 21.5)),
//                                         color: const Color(0xff7bc576),
//                                       ),
//                                     ),
//                                   ),
//                                   Transform.translate(
//                                     offset: Offset(115.0, 0.0),
//                                     child: Container(
//                                       width: 43.0,
//                                       height: 43.0,
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.all(
//                                             Radius.elliptical(21.5, 21.5)),
//                                         color: const Color(0xff7bc576),
//                                       ),
//                                     ),
//                                   ),
//                                   Transform.translate(
//                                     offset: Offset(180.0, 0.0),
//                                     child: Container(
//                                       width: 43.0,
//                                       height: 43.0,
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.all(
//                                             Radius.elliptical(21.5, 21.5)),
//                                         color: const Color(0xff7bc576),
//                                       ),
//                                     ),
//                                   ),
//                                   Transform.translate(
//                                     offset: Offset(18.0, 15.0),
//                                     child:
//                                         // Adobe XD layer: 'Facebook' (group)
//                                         Stack(
//                                       children: <Widget>[
//                                         Stack(
//                                           children: <Widget>[
//                                             Stack(
//                                               children: <Widget>[
//                                                 Transform.translate(
//                                                   offset: Offset(0.12, -0.02),
//                                                   child: SvgPicture.string(
//                                                     _svg_olzint,
//                                                     allowDrawingOutsideViewBox:
//                                                         true,
//                                                   ),
//                                                 ),
//                                                 Container(
//                                                   width: 8.0,
//                                                   height: 14.5,
//                                                   color:
//                                                       const Color(0xccffffff),
//                                                 ),
//                                               ],
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   Transform.translate(
//                                     offset: Offset(71.0, 16.0),
//                                     child:
//                                         // Adobe XD layer: 'Twitter' (group)
//                                         Stack(
//                                       children: <Widget>[
//                                         SvgPicture.string(
//                                           _svg_21whw2,
//                                           allowDrawingOutsideViewBox: true,
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   Transform.translate(
//                                     offset: Offset(128.0, 16.0),
//                                     child:
//                                         // Adobe XD layer: 'Google+' (group)
//                                         Stack(
//                                       children: <Widget>[
//                                         SvgPicture.string(
//                                           _svg_4kca55,
//                                           allowDrawingOutsideViewBox: true,
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   Transform.translate(
//                                     offset: Offset(194.0, 16.0),
//                                     child:
//                                         // Adobe XD layer: 'Youtube' (group)
//                                         Stack(
//                                       children: <Widget>[
//                                         SvgPicture.string(
//                                           _svg_ohlhok,
//                                           allowDrawingOutsideViewBox: true,
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Transform.translate(
//                               offset: Offset(-117.0, -70.0),
//                               child: Stack(
//                                 children: <Widget>[
//                                   Transform.translate(
//                                     offset: Offset(127.48, 87.46),
//                                     child:
//                                         // Adobe XD layer: 'star-half-alt' (group)
//                                         Stack(
//                                       children: <Widget>[
//                                         SvgPicture.string(
//                                           _svg_9occue,
//                                           allowDrawingOutsideViewBox: true,
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   Transform.translate(
//                                     offset: Offset(95.49, 87.46),
//                                     child:
//                                         // Adobe XD layer: 'star' (group)
//                                         Stack(
//                                       children: <Widget>[
//                                         SvgPicture.string(
//                                           _svg_13fpr0,
//                                           allowDrawingOutsideViewBox: true,
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   Transform.translate(
//                                     offset: Offset(63.98, 87.46),
//                                     child:
//                                         // Adobe XD layer: 'star' (group)
//                                         Stack(
//                                       children: <Widget>[
//                                         SvgPicture.string(
//                                           _svg_13fpr0,
//                                           allowDrawingOutsideViewBox: true,
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   Transform.translate(
//                                     offset: Offset(31.99, 87.46),
//                                     child:
//                                         // Adobe XD layer: 'star' (group)
//                                         Stack(
//                                       children: <Widget>[
//                                         SvgPicture.string(
//                                           _svg_13fpr0,
//                                           allowDrawingOutsideViewBox: true,
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   Transform.translate(
//                                     offset: Offset(0.0, 87.46),
//                                     child:
//                                         // Adobe XD layer: 'star' (group)
//                                         Stack(
//                                       children: <Widget>[
//                                         SvgPicture.string(
//                                           _svg_13fpr0,
//                                           allowDrawingOutsideViewBox: true,
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Transform.translate(
//                               offset: Offset(-115.0, 74.67),
//                               child: SizedBox(
//                                 width: 323.0,
//                                 height: 57.0,
//                                 child: Text(
//                                   '10,000 Trust people The full-stack design team who focuses on digital products whatever they are.',
//                                   style: TextStyle(
//                                     fontFamily: 'Roboto',
//                                     fontSize: 14,
//                                     color: const Color(0xff747474),
//                                     height: 2,
//                                   ),
//                                   textAlign: TextAlign.left,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Transform.translate(
//                   offset: Offset(892.0, 7570.82),
//                   child:
//                       // Adobe XD layer: 'Logo' (group)
//                       Stack(
//                     children: <Widget>[
//                       Transform.translate(
//                         offset: Offset(0.0, -4.0),
//                         child: Text.rich(
//                           TextSpan(
//                             style: TextStyle(
//                               fontFamily: 'Roboto',
//                               fontSize: 40.897491455078125,
//                               color: const Color(0xff7cc576),
//                               height: 1.2000000559647617,
//                             ),
//                             children: [
//                               TextSpan(
//                                 text: 'We',
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                               TextSpan(
//                                 text: 'Care',
//                                 style: TextStyle(
//                                   color: const Color(0xff707070),
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           textAlign: TextAlign.left,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Transform.translate(
//                   offset: Offset(922.5, 7653.5),
//                   child: SvgPicture.string(
//                     _svg_35rr6s,
//                     allowDrawingOutsideViewBox: true,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Transform.translate(
//             offset: Offset(0.0, 90.0),
//             child:
//                 // Adobe XD layer: 'Subscribe' (group)
//                 Stack(
//               children: <Widget>[
//                 Transform.translate(
//                   offset: Offset(254.0, 6928.0),
//                   child: Stack(
//                     overflow: Overflow.visible,
//                     children: <Widget>[
//                       Container(
//                         width: 1412.0,
//                         height: 124.0,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(34.0),
//                           color: const Color(0x4f7cc576),
//                           boxShadow: [
//                             BoxShadow(
//                               color: const Color(0x0dc8c8c8),
//                               offset: Offset(0, 0),
//                               blurRadius: 99,
//                             ),
//                           ],
//                         ),
//                       ),
//                       Positioned(
//                         left: -35.0,
//                         top: -35.0,
//                         width: 1482.0,
//                         height: 194.0,
//                         child: ClipRect(
//                           child: BackdropFilter(
//                             filter:
//                                 ui.ImageFilter.blur(sigmaX: 35.0, sigmaY: 35.0),
//                             child: Container(color: const Color(0x00000000)),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Transform.translate(
//                   offset: Offset(254.0, 6684.0),
//                   child: Container(
//                     width: 1412.0,
//                     height: 368.0,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(34.0),
//                       color: const Color(0xff7cc576),
//                       boxShadow: [
//                         BoxShadow(
//                           color: const Color(0x29c8c8c8),
//                           offset: Offset(0, 0),
//                           blurRadius: 99,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Transform.translate(
//                   offset: Offset(377.96, 6799.4),
//                   child: SizedBox(
//                     width: 730.0,
//                     height: 165.0,
//                     child: Text.rich(
//                       TextSpan(
//                         style: TextStyle(
//                           fontFamily: 'Roboto',
//                           fontSize: 64,
//                           color: const Color(0xffffffff),
//                           height: 1.2000000476837158,
//                         ),
//                         children: [
//                           TextSpan(
//                             text: 'Sign up for our newsletter',
//                             style: TextStyle(
//                               fontWeight: FontWeight.w100,
//                             ),
//                           ),
//                           TextSpan(
//                             text: ' Newborn Baby',
//                             style: TextStyle(
//                               fontWeight: FontWeight.w900,
//                             ),
//                           ),
//                         ],
//                       ),
//                       textAlign: TextAlign.left,
//                     ),
//                   ),
//                 ),
//                 Transform.translate(
//                   offset: Offset(1211.0, 6838.67),
//                   child:
//                       // Adobe XD layer: 'Button' (group)
//                       Stack(
//                     children: <Widget>[
//                       // Adobe XD layer: 'Rounded Rectangle 3' (shape)
//                       Container(
//                         width: 218.5,
//                         height: 58.0,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10.0),
//                           color: const Color(0xff707070),
//                         ),
//                       ),
//                       Transform.translate(
//                         offset: Offset(0.0, 28.0),
//                         child:
//                             // Adobe XD layer: 'Rounded Rectangle 3' (shape)
//                             Stack(
//                           overflow: Overflow.visible,
//                           children: <Widget>[
//                             Container(
//                               width: 218.5,
//                               height: 30.0,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(100.0),
//                                 color: const Color(0xff707070),
//                               ),
//                             ),
//                             Positioned(
//                               left: -30.0,
//                               top: -30.0,
//                               width: 278.5,
//                               height: 90.0,
//                               child: ClipRect(
//                                 child: BackdropFilter(
//                                   filter: ui.ImageFilter.blur(
//                                       sigmaX: 30.0, sigmaY: 30.0),
//                                   child:
//                                       Container(color: const Color(0x00000000)),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Transform.translate(
//                         offset: Offset(25.92, 10.16),
//                         child: SizedBox(
//                           width: 112.0,
//                           child: Text(
//                             'Get started',
//                             style: TextStyle(
//                               fontFamily: 'Roboto',
//                               fontSize: 19,
//                               color: const Color(0xffffffff),
//                               fontWeight: FontWeight.w500,
//                               height: 1.5263157894736843,
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
//                       ),
//                       Transform.translate(
//                         offset: Offset(154.89, 13.33),
//                         child:
//                             // Adobe XD layer: 'arrow-right' (group)
//                             Stack(
//                           children: <Widget>[
//                             Transform.translate(
//                               offset: Offset(-9.0, 4.0),
//                               child: SvgPicture.string(
//                                 _svg_x66479,
//                                 allowDrawingOutsideViewBox: true,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Transform.translate(
//             offset: Offset(0.0, 1915.0),
//             child:
//                 // Adobe XD layer: 'BabyCare Articles' (group)
//                 Stack(
//               children: <Widget>[
//                 Transform.translate(
//                   offset: Offset(223.0, 3326.0),
//                   child:
//                       // Adobe XD layer: 'Title' (group)
//                       Stack(
//                     children: <Widget>[
//                       Transform.translate(
//                         offset: Offset(452.0, 810.96),
//                         child: SizedBox(
//                           width: 640.0,
//                           height: 68.0,
//                           child: Text(
//                             'A newborn baby can feel small and fragile. Learn how to care for your newborn and find out what',
//                             style: TextStyle(
//                               fontFamily: 'Roboto',
//                               fontSize: 18,
//                               color: const Color(0xffb0b0b0),
//                               height: 1.7777777777777777,
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
//                       ),
//                       Transform.translate(
//                         offset: Offset(548.0, 750.98),
//                         child: SizedBox(
//                           width: 448.0,
//                           child: Text(
//                             'Customer Reviews',
//                             style: TextStyle(
//                               fontFamily: 'Roboto',
//                               fontSize: 45,
//                               color: const Color(0xff707070),
//                               fontWeight: FontWeight.w500,
//                               height: 0.6888888888888889,
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
//                       ),
//                       Transform.translate(
//                         offset: Offset(647.0, 916.0),
//                         child: Container(
//                           width: 250.0,
//                           height: 5.0,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(100.0),
//                             gradient: LinearGradient(
//                               begin: Alignment(-1.08, 0.0),
//                               end: Alignment(1.69, 0.0),
//                               colors: [
//                                 const Color(0xffffffff),
//                                 const Color(0xff7cc576)
//                               ],
//                               stops: [0.0, 1.0],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Transform.translate(
//                   offset: Offset(382.0, 4311.0),
//                   child:
//                       // Adobe XD layer: '1' (group)
//                       Stack(
//                     children: <Widget>[
//                       Transform.translate(
//                         offset: Offset(0.0, 263.06),
//                         child: Stack(
//                           overflow: Overflow.visible,
//                           children: <Widget>[
//                             Container(
//                               width: 432.0,
//                               height: 161.0,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(34.0),
//                                 color: const Color(0x26dbffd8),
//                               ),
//                             ),
//                             Positioned(
//                               left: -49.0,
//                               top: -49.0,
//                               width: 530.0,
//                               height: 259.0,
//                               child: ClipRect(
//                                 child: BackdropFilter(
//                                   filter: ui.ImageFilter.blur(
//                                       sigmaX: 49.0, sigmaY: 49.0),
//                                   child:
//                                       Container(color: const Color(0x00000000)),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         width: 432.0,
//                         height: 380.1,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(34.0),
//                           color: const Color(0xffffffff),
//                           boxShadow: [
//                             BoxShadow(
//                               color: const Color(0x29c8c8c8),
//                               offset: Offset(0, 0),
//                               blurRadius: 99,
//                             ),
//                           ],
//                         ),
//                       ),
//                       Transform.translate(
//                         offset: Offset(50.0, 43.54),
//                         child: Stack(
//                           children: <Widget>[
//                             Transform.translate(
//                               offset: Offset(95.49, 87.46),
//                               child:
//                                   // Adobe XD layer: 'star' (group)
//                                   Stack(
//                                 children: <Widget>[
//                                   SvgPicture.string(
//                                     _svg_13fpr0,
//                                     allowDrawingOutsideViewBox: true,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Transform.translate(
//                               offset: Offset(127.49, 87.46),
//                               child:
//                                   // Adobe XD layer: 'star' (group)
//                                   Stack(
//                                 children: <Widget>[
//                                   SvgPicture.string(
//                                     _svg_13fpr0,
//                                     allowDrawingOutsideViewBox: true,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Transform.translate(
//                               offset: Offset(63.98, 87.46),
//                               child:
//                                   // Adobe XD layer: 'star' (group)
//                                   Stack(
//                                 children: <Widget>[
//                                   SvgPicture.string(
//                                     _svg_13fpr0,
//                                     allowDrawingOutsideViewBox: true,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Transform.translate(
//                               offset: Offset(31.99, 87.46),
//                               child:
//                                   // Adobe XD layer: 'star' (group)
//                                   Stack(
//                                 children: <Widget>[
//                                   SvgPicture.string(
//                                     _svg_13fpr0,
//                                     allowDrawingOutsideViewBox: true,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Transform.translate(
//                               offset: Offset(0.0, 87.46),
//                               child:
//                                   // Adobe XD layer: 'star' (group)
//                                   Stack(
//                                 children: <Widget>[
//                                   SvgPicture.string(
//                                     _svg_13fpr0,
//                                     allowDrawingOutsideViewBox: true,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Transform.translate(
//                         offset: Offset(53.0, 59.3),
//                         child: Text(
//                           'Jon L. Clarkson',
//                           style: TextStyle(
//                             fontFamily: 'Lato',
//                             fontSize: 20,
//                             color: const Color(0xff5a5454),
//                             fontWeight: FontWeight.w700,
//                             height: 1.3,
//                           ),
//                           textAlign: TextAlign.left,
//                         ),
//                       ),
//                       Transform.translate(
//                         offset: Offset(53.0, 168.67),
//                         child: SizedBox(
//                           width: 331.0,
//                           height: 150.0,
//                           child: Text(
//                             'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer turpis risus, rutrum imperdiet finibus in, iaculis eu leo. Duis vitae turpis augue. Sed ullamcorper faucibus volutpat. Fusce faucibus euismod auctor.',
//                             style: TextStyle(
//                               fontFamily: 'Roboto',
//                               fontSize: 15,
//                               color: const Color(0xff747474),
//                               height: 1.8666666666666667,
//                             ),
//                             textAlign: TextAlign.left,
//                           ),
//                         ),
//                       ),
//                       Transform.translate(
//                         offset: Offset(53.0, 84.67),
//                         child: Text(
//                           'a day ago',
//                           style: TextStyle(
//                             fontFamily: 'Roboto',
//                             fontSize: 15,
//                             color: const Color(0xff7cc576),
//                             height: 1.8666666666666667,
//                           ),
//                           textAlign: TextAlign.left,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Transform.translate(
//                   offset: Offset(870.0, 4311.0),
//                   child:
//                       // Adobe XD layer: '2' (group)
//                       Stack(
//                     children: <Widget>[
//                       Transform.translate(
//                         offset: Offset(0.0, 263.06),
//                         child: Stack(
//                           overflow: Overflow.visible,
//                           children: <Widget>[
//                             Container(
//                               width: 432.0,
//                               height: 161.0,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(34.0),
//                                 color: const Color(0x26dbffd8),
//                               ),
//                             ),
//                             Positioned(
//                               left: -49.0,
//                               top: -49.0,
//                               width: 530.0,
//                               height: 259.0,
//                               child: ClipRect(
//                                 child: BackdropFilter(
//                                   filter: ui.ImageFilter.blur(
//                                       sigmaX: 49.0, sigmaY: 49.0),
//                                   child:
//                                       Container(color: const Color(0x00000000)),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         width: 432.0,
//                         height: 380.1,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(34.0),
//                           color: const Color(0xffffffff),
//                           boxShadow: [
//                             BoxShadow(
//                               color: const Color(0x29c8c8c8),
//                               offset: Offset(0, 0),
//                               blurRadius: 99,
//                             ),
//                           ],
//                         ),
//                       ),
//                       Transform.translate(
//                         offset: Offset(50.0, 43.54),
//                         child: Stack(
//                           children: <Widget>[
//                             Transform.translate(
//                               offset: Offset(127.48, 87.46),
//                               child:
//                                   // Adobe XD layer: 'star-half-alt' (group)
//                                   Stack(
//                                 children: <Widget>[
//                                   SvgPicture.string(
//                                     _svg_9occue,
//                                     allowDrawingOutsideViewBox: true,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Transform.translate(
//                               offset: Offset(95.49, 87.46),
//                               child:
//                                   // Adobe XD layer: 'star' (group)
//                                   Stack(
//                                 children: <Widget>[
//                                   SvgPicture.string(
//                                     _svg_13fpr0,
//                                     allowDrawingOutsideViewBox: true,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Transform.translate(
//                               offset: Offset(63.98, 87.46),
//                               child:
//                                   // Adobe XD layer: 'star' (group)
//                                   Stack(
//                                 children: <Widget>[
//                                   SvgPicture.string(
//                                     _svg_13fpr0,
//                                     allowDrawingOutsideViewBox: true,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Transform.translate(
//                               offset: Offset(31.99, 87.46),
//                               child:
//                                   // Adobe XD layer: 'star' (group)
//                                   Stack(
//                                 children: <Widget>[
//                                   SvgPicture.string(
//                                     _svg_13fpr0,
//                                     allowDrawingOutsideViewBox: true,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Transform.translate(
//                               offset: Offset(0.0, 87.46),
//                               child:
//                                   // Adobe XD layer: 'star' (group)
//                                   Stack(
//                                 children: <Widget>[
//                                   SvgPicture.string(
//                                     _svg_13fpr0,
//                                     allowDrawingOutsideViewBox: true,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Transform.translate(
//                         offset: Offset(53.0, 59.3),
//                         child: Text(
//                           'Todd Jefferies',
//                           style: TextStyle(
//                             fontFamily: 'Lato',
//                             fontSize: 20,
//                             color: const Color(0xff5a5454),
//                             fontWeight: FontWeight.w700,
//                             height: 1.3,
//                           ),
//                           textAlign: TextAlign.left,
//                         ),
//                       ),
//                       Transform.translate(
//                         offset: Offset(53.0, 168.67),
//                         child: SizedBox(
//                           width: 331.0,
//                           height: 150.0,
//                           child: Text(
//                             'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer turpis risus, rutrum imperdiet finibus in, iaculis eu leo. Duis vitae turpis augue. Sed ullamcorper faucibus volutpat. Fusce faucibus euismod auctor.',
//                             style: TextStyle(
//                               fontFamily: 'Roboto',
//                               fontSize: 15,
//                               color: const Color(0xff747474),
//                               height: 1.8666666666666667,
//                             ),
//                             textAlign: TextAlign.left,
//                           ),
//                         ),
//                       ),
//                       Transform.translate(
//                         offset: Offset(53.0, 84.67),
//                         child: Text(
//                           '10 days ago',
//                           style: TextStyle(
//                             fontFamily: 'Roboto',
//                             fontSize: 15,
//                             color: const Color(0xff7cc576),
//                             height: 1.8666666666666667,
//                           ),
//                           textAlign: TextAlign.left,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Transform.translate(
//                   offset: Offset(1358.0, 4311.0),
//                   child:
//                       // Adobe XD layer: '3' (group)
//                       Stack(
//                     children: <Widget>[
//                       Transform.translate(
//                         offset: Offset(0.0, 263.06),
//                         child: Stack(
//                           overflow: Overflow.visible,
//                           children: <Widget>[
//                             Container(
//                               width: 432.0,
//                               height: 161.0,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(34.0),
//                                 color: const Color(0x26dbffd8),
//                               ),
//                             ),
//                             Positioned(
//                               left: -49.0,
//                               top: -49.0,
//                               width: 530.0,
//                               height: 259.0,
//                               child: ClipRect(
//                                 child: BackdropFilter(
//                                   filter: ui.ImageFilter.blur(
//                                       sigmaX: 49.0, sigmaY: 49.0),
//                                   child:
//                                       Container(color: const Color(0x00000000)),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         width: 432.0,
//                         height: 380.1,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(34.0),
//                           color: const Color(0xffffffff),
//                           boxShadow: [
//                             BoxShadow(
//                               color: const Color(0x29c8c8c8),
//                               offset: Offset(0, 0),
//                               blurRadius: 99,
//                             ),
//                           ],
//                         ),
//                       ),
//                       Transform.translate(
//                         offset: Offset(50.0, 43.54),
//                         child: Stack(
//                           children: <Widget>[
//                             Transform.translate(
//                               offset: Offset(127.48, 87.46),
//                               child:
//                                   // Adobe XD layer: 'star-half-alt' (group)
//                                   Stack(
//                                 children: <Widget>[
//                                   SvgPicture.string(
//                                     _svg_9occue,
//                                     allowDrawingOutsideViewBox: true,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Transform.translate(
//                               offset: Offset(95.49, 87.46),
//                               child:
//                                   // Adobe XD layer: 'star' (group)
//                                   Stack(
//                                 children: <Widget>[
//                                   SvgPicture.string(
//                                     _svg_13fpr0,
//                                     allowDrawingOutsideViewBox: true,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Transform.translate(
//                               offset: Offset(63.98, 87.46),
//                               child:
//                                   // Adobe XD layer: 'star' (group)
//                                   Stack(
//                                 children: <Widget>[
//                                   SvgPicture.string(
//                                     _svg_13fpr0,
//                                     allowDrawingOutsideViewBox: true,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Transform.translate(
//                               offset: Offset(31.99, 87.46),
//                               child:
//                                   // Adobe XD layer: 'star' (group)
//                                   Stack(
//                                 children: <Widget>[
//                                   SvgPicture.string(
//                                     _svg_13fpr0,
//                                     allowDrawingOutsideViewBox: true,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Transform.translate(
//                               offset: Offset(0.0, 87.46),
//                               child:
//                                   // Adobe XD layer: 'star' (group)
//                                   Stack(
//                                 children: <Widget>[
//                                   SvgPicture.string(
//                                     _svg_13fpr0,
//                                     allowDrawingOutsideViewBox: true,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Transform.translate(
//                         offset: Offset(53.0, 59.3),
//                         child: Text(
//                           'Jackie Parker',
//                           style: TextStyle(
//                             fontFamily: 'Lato',
//                             fontSize: 20,
//                             color: const Color(0xff5a5454),
//                             fontWeight: FontWeight.w700,
//                             height: 1.3,
//                           ),
//                           textAlign: TextAlign.left,
//                         ),
//                       ),
//                       Transform.translate(
//                         offset: Offset(53.0, 168.67),
//                         child: SizedBox(
//                           width: 331.0,
//                           height: 150.0,
//                           child: Text(
//                             'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer turpis risus, rutrum imperdiet finibus in, iaculis eu leo. Duis vitae turpis augue. Sed ullamcorper faucibus volutpat. Fusce faucibus euismod auctor.',
//                             style: TextStyle(
//                               fontFamily: 'Roboto',
//                               fontSize: 15,
//                               color: const Color(0xff747474),
//                               height: 1.8666666666666667,
//                             ),
//                             textAlign: TextAlign.left,
//                           ),
//                         ),
//                       ),
//                       Transform.translate(
//                         offset: Offset(53.0, 84.67),
//                         child: Text(
//                           'a month ago',
//                           style: TextStyle(
//                             fontFamily: 'Roboto',
//                             fontSize: 15,
//                             color: const Color(0xff7cc576),
//                             height: 1.8666666666666667,
//                           ),
//                           textAlign: TextAlign.left,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Transform.translate(
//                   offset: Offset(1846.0, 4311.0),
//                   child:
//                       // Adobe XD layer: '3' (group)
//                       Stack(
//                     children: <Widget>[
//                       Transform.translate(
//                         offset: Offset(0.0, 263.06),
//                         child: Stack(
//                           overflow: Overflow.visible,
//                           children: <Widget>[
//                             Container(
//                               width: 432.0,
//                               height: 161.0,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(34.0),
//                                 color: const Color(0x26dbffd8),
//                               ),
//                             ),
//                             Positioned(
//                               left: -49.0,
//                               top: -49.0,
//                               width: 530.0,
//                               height: 259.0,
//                               child: ClipRect(
//                                 child: BackdropFilter(
//                                   filter: ui.ImageFilter.blur(
//                                       sigmaX: 49.0, sigmaY: 49.0),
//                                   child:
//                                       Container(color: const Color(0x00000000)),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         width: 432.0,
//                         height: 380.1,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(34.0),
//                           color: const Color(0xffffffff),
//                           boxShadow: [
//                             BoxShadow(
//                               color: const Color(0x29c8c8c8),
//                               offset: Offset(0, 0),
//                               blurRadius: 99,
//                             ),
//                           ],
//                         ),
//                       ),
//                       Transform.translate(
//                         offset: Offset(50.0, 43.54),
//                         child: Stack(
//                           children: <Widget>[
//                             Transform.translate(
//                               offset: Offset(127.48, 87.46),
//                               child:
//                                   // Adobe XD layer: 'star-half-alt' (group)
//                                   Stack(
//                                 children: <Widget>[
//                                   SvgPicture.string(
//                                     _svg_9occue,
//                                     allowDrawingOutsideViewBox: true,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Transform.translate(
//                               offset: Offset(95.49, 87.46),
//                               child:
//                                   // Adobe XD layer: 'star' (group)
//                                   Stack(
//                                 children: <Widget>[
//                                   SvgPicture.string(
//                                     _svg_13fpr0,
//                                     allowDrawingOutsideViewBox: true,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Transform.translate(
//                               offset: Offset(63.98, 87.46),
//                               child:
//                                   // Adobe XD layer: 'star' (group)
//                                   Stack(
//                                 children: <Widget>[
//                                   SvgPicture.string(
//                                     _svg_13fpr0,
//                                     allowDrawingOutsideViewBox: true,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Transform.translate(
//                               offset: Offset(31.99, 87.46),
//                               child:
//                                   // Adobe XD layer: 'star' (group)
//                                   Stack(
//                                 children: <Widget>[
//                                   SvgPicture.string(
//                                     _svg_13fpr0,
//                                     allowDrawingOutsideViewBox: true,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Transform.translate(
//                               offset: Offset(0.0, 87.46),
//                               child:
//                                   // Adobe XD layer: 'star' (group)
//                                   Stack(
//                                 children: <Widget>[
//                                   SvgPicture.string(
//                                     _svg_13fpr0,
//                                     allowDrawingOutsideViewBox: true,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Transform.translate(
//                         offset: Offset(53.0, 59.3),
//                         child: Text(
//                           'Alvin  Clark',
//                           style: TextStyle(
//                             fontFamily: 'Lato',
//                             fontSize: 20,
//                             color: const Color(0xff5a5454),
//                             fontWeight: FontWeight.w700,
//                             height: 1.3,
//                           ),
//                           textAlign: TextAlign.left,
//                         ),
//                       ),
//                       Transform.translate(
//                         offset: Offset(53.0, 168.67),
//                         child: SizedBox(
//                           width: 331.0,
//                           height: 150.0,
//                           child: Text(
//                             'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer turpis risus, rutrum imperdiet finibus in, iaculis eu leo. Duis vitae turpis augue. Sed ullamcorper faucibus volutpat. Fusce faucibus euismod auctor.',
//                             style: TextStyle(
//                               fontFamily: 'Roboto',
//                               fontSize: 15,
//                               color: const Color(0xff747474),
//                               height: 1.8666666666666667,
//                             ),
//                             textAlign: TextAlign.left,
//                           ),
//                         ),
//                       ),
//                       Transform.translate(
//                         offset: Offset(53.0, 84.67),
//                         child: Text(
//                           'a month ago',
//                           style: TextStyle(
//                             fontFamily: 'Roboto',
//                             fontSize: 15,
//                             color: const Color(0xff7cc576),
//                             height: 1.8666666666666667,
//                           ),
//                           textAlign: TextAlign.left,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Transform.translate(
//                   offset: Offset(254.0, 4525.0),
//                   child: Stack(
//                     overflow: Overflow.visible,
//                     children: <Widget>[
//                       Container(
//                         width: 90.0,
//                         height: 50.0,
//                         decoration: BoxDecoration(
//                           borderRadius:
//                               BorderRadius.all(Radius.elliptical(45.0, 25.0)),
//                           color: const Color(0x99dbffd8),
//                         ),
//                       ),
//                       Positioned(
//                         left: -49.0,
//                         top: -49.0,
//                         width: 188.0,
//                         height: 148.0,
//                         child: ClipOval(
//                           child: BackdropFilter(
//                             filter:
//                                 ui.ImageFilter.blur(sigmaX: 49.0, sigmaY: 49.0),
//                             child: Container(color: const Color(0x00000000)),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Transform.translate(
//                   offset: Offset(254.0, 4458.0),
//                   child: Container(
//                     width: 90.0,
//                     height: 90.0,
//                     decoration: BoxDecoration(
//                       borderRadius:
//                           BorderRadius.all(Radius.elliptical(45.0, 45.0)),
//                       color: const Color(0xffffffff),
//                       boxShadow: [
//                         BoxShadow(
//                           color: const Color(0x4dc8c8c8),
//                           offset: Offset(0, 0),
//                           blurRadius: 99,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Transform.translate(
//                   offset: Offset(274.0, 4479.5),
//                   child:
//                       // Adobe XD layer: 'ic_keyboard_arrow_l…' (group)
//                       Stack(
//                     children: <Widget>[
//                       Transform.translate(
//                         offset: Offset(16.0, 11.5),
//                         child: SvgPicture.string(
//                           _svg_c4kpdh,
//                           allowDrawingOutsideViewBox: true,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Transform.translate(
//             offset: Offset(870.0, 5402.0),
//             child: Container(
//               width: 250.0,
//               height: 5.0,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(100.0),
//                 gradient: LinearGradient(
//                   begin: Alignment(-1.08, 0.0),
//                   end: Alignment(1.69, 0.0),
//                   colors: [const Color(0xffffffff), const Color(0xff7cc576)],
//                   stops: [0.0, 1.0],
//                 ),
//               ),
//             ),
//           ),
//           Stack(
//             children: <Widget>[
//               Transform.translate(
//                 offset: Offset(935.0, 5301.0),
//                 child:
//                     // Adobe XD layer: 'The-Boss-Baby-PNG-I…' (shape)
//                     Stack(
//                   overflow: Overflow.visible,
//                   children: <Widget>[
//                     Container(
//                       width: 992.0,
//                       height: 558.0,
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                           image: const AssetImage(''),
//                           fit: BoxFit.fill,
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       left: -21.0,
//                       top: -21.0,
//                       width: 1034.0,
//                       height: 600.0,
//                       child: ClipRect(
//                         child: BackdropFilter(
//                           filter:
//                               ui.ImageFilter.blur(sigmaX: 21.0, sigmaY: 21.0),
//                           child: Container(color: const Color(0x00000000)),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Transform.translate(
//                 offset: Offset(0.0, 5301.0),
//                 child: Container(
//                   width: 1920.0,
//                   height: 558.0,
//                   decoration: BoxDecoration(
//                     color: const Color(0xff7cc576),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Transform.translate(
//             offset: Offset(253.96, 5473.73),
//             child: SizedBox(
//               width: 1412.0,
//               height: 321.0,
//               child: Text.rich(
//                 TextSpan(
//                   style: TextStyle(
//                     fontFamily: 'Roboto',
//                     fontSize: 44,
//                     color: const Color(0xffffffff),
//                     height: 0.8636363636363636,
//                   ),
//                   children: [
//                     TextSpan(
//                       text:
//                           'Since 2002, Baby Care Advice has assisted thousands of parents\n\nworldwide solve minor and complex baby care problems by\n\nour articles and consultations.\n\n',
//                       style: TextStyle(
//                         fontWeight: FontWeight.w100,
//                       ),
//                     ),
//                     TextSpan(
//                       text: 'Book a consultation now!',
//                       style: TextStyle(
//                         fontWeight: FontWeight.w900,
//                       ),
//                     ),
//                   ],
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// const String _svg_x66479 =
//     '<svg viewBox="-9.0 4.0 42.7 23.0" ><path  d="M 33.46256256103516 14.87075805664063 L 22.85041427612305 4.258608341217041 C 22.50515174865723 3.913155078887939 21.94521331787109 3.913155078887939 21.599853515625 4.258513927459717 C 21.25449562072754 4.603872299194336 21.25449562072754 5.163809776306152 21.59985542297363 5.50916862487793 L 30.70163536071777 14.61075973510742 L -8.115653991699219 14.61075973510742 C -8.60406494140625 14.61075973510742 -9 15.00669479370117 -9 15.4951057434082 C -9 15.9835147857666 -8.60406494140625 16.37945175170898 -8.115653991699219 16.37945175170898 L 30.70163536071777 16.37945175170898 L 21.59994888305664 25.48113822937012 C 21.25464248657227 25.82693481445313 21.25503730773926 26.38718414306641 21.60083198547363 26.73248863220215 C 21.94662666320801 27.07779502868652 22.50687599182129 27.07740020751953 22.85218238830566 26.73160552978516 L 33.46433258056641 16.11945533752441 C 33.80956268310547 15.77411842346191 33.80956268310547 15.21432685852051 33.46433258056641 14.86899185180664 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_bgwo2l =
//     '<svg viewBox="215.5 993.6 349.6 216.8" ><path  d="M 361.6109924316406 997.019775390625 C 383.6199951171875 1000.281188964844 405.5578918457031 1009.234191894531 427.8265075683594 1016.780578613281 C 449.9749145507813 1024.793212890625 472.4541015625 1031.399169921875 492.7666931152344 1040.755737304688 C 513.0512084960938 1050.113037109375 531.1708984375 1062.212158203125 543.9716186523438 1081.1474609375 C 556.8377075195313 1099.611572265625 564.3847045898438 1124.911987304688 565.0285034179688 1149.820556640625 C 566.279296875 1202.68505859375 542.6699829101563 1205.905639648438 509.8854064941406 1197.107788085938 C 476.9751892089844 1187.150634765625 433.1534118652344 1176.350219726563 390.1778869628906 1180.175659179688 C 368.385009765625 1179.646362304688 349.3442993164063 1192.163452148438 331.5141906738281 1200.416137695313 C 313.7464904785156 1209.137573242188 297.1897888183594 1213.594116210938 281.8027038574219 1207.75537109375 C 266.4779968261719 1202.3857421875 252.322998046875 1186.720947265625 240.7935028076172 1165.989135742188 C 229.3264007568359 1145.726440429688 220.4850006103516 1120.396728515625 217.22509765625 1106.509765625 C 213.7236938476563 1089.852905273438 215.6925964355469 1077.366333007813 222.0816955566406 1063.706909179688 C 228.4501953125 1050.403930664063 239.2386932373047 1035.928466796875 252.9004058837891 1023.544128417969 C 266.5780029296875 1011.186889648438 283.12939453125 1000.914611816406 301.39599609375 996.5878295898438 C 319.7153930664063 991.9545288085938 339.75 993.2670288085938 361.6109924316406 997.019775390625 Z" fill="#7cc576" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
// const String _svg_q4yslp =
//     '<svg viewBox="630.0 1014.1 351.5 217.7" ><path  d="M 802.459716796875 1027.752319335938 C 843.182373046875 1024.55224609375 880.132080078125 1008.884704589844 915.22802734375 1015.839172363281 C 949.0172119140625 1021.077026367188 980.9525756835938 1048.937255859375 981.473388671875 1093.15380859375 C 983.4315185546875 1136.743041992188 950.4843139648438 1180.119018554688 912.4016723632813 1204.13134765625 C 873.3839111328125 1229.299560546875 829.2308959960938 1235.104248046875 787.1773071289063 1230.255493164063 C 744.397216796875 1224.788452148438 705.8245239257813 1215.045043945313 677.3930053710938 1199.271850585938 C 649.0853881835938 1183.97900390625 630.417724609375 1151.712158203125 630.0498046875 1106.623779296875 C 629.9907836914063 1085.097290039063 635.206298828125 1064.903442382813 645.0410766601563 1051.354125976563 C 654.8125 1037.495239257813 669.203125 1030.280395507813 685.9688720703125 1027.497924804688 C 720.1885986328125 1022.402526855469 761.739013671875 1032.791748046875 802.459716796875 1027.752319335938 C 802.459716796875 1027.752319335938 802.459716796875 1027.752319335938 802.459716796875 1027.752319335938 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
// const String _svg_hq5ng7 =
//     '<svg viewBox="1059.5 1006.9 324.0 203.9" ><path  d="M 1239.375732421875 1209.082275390625 C 1217.10693359375 1207.335815429688 1193.947875976563 1202.560424804688 1171.107055664063 1198.22314453125 C 1148.370727539063 1193.536254882813 1125.961181640625 1189.359008789063 1107.032958984375 1181.45556640625 C 1088.1357421875 1173.62939453125 1072.866821289063 1161.695434570313 1065.380004882813 1143.487670898438 C 1057.696533203125 1125.592651367188 1057.874633789063 1102.893188476563 1064.186279296875 1081.305053710938 C 1064.607055664063 1079.858764648438 1065.037231445313 1078.455444335938 1065.475708007813 1077.0927734375 C 1065.9140625 1075.72998046875 1066.360961914063 1074.407470703125 1066.815551757813 1073.12353515625 C 1067.724731445313 1070.55517578125 1068.66455078125 1068.1396484375 1069.630249023438 1065.861694335938 C 1071.561767578125 1061.30615234375 1073.596557617188 1057.297119140625 1075.703979492188 1053.745727539063 C 1079.92041015625 1046.647827148438 1084.42333984375 1041.374389648438 1089.015502929688 1037.461547851563 C 1098.2607421875 1029.667358398438 1107.588745117188 1027.211669921875 1117.286010742188 1027.424560546875 C 1136.16650390625 1028.623657226563 1163.670043945313 1033.233764648438 1195.751342773438 1028.337768554688 C 1212.2705078125 1027.731201171875 1225.376831054688 1017.953674316406 1238.345092773438 1013.090209960938 C 1244.857543945313 1010.379821777344 1251.644653320313 1008.502624511719 1259.24267578125 1007.55712890625 C 1261.141357421875 1007.323486328125 1263.08935546875 1007.151184082031 1265.092407226563 1007.048706054688 C 1266.093872070313 1006.997375488281 1267.109252929688 1006.963500976563 1268.138793945313 1006.948791503906 C 1269.16845703125 1006.934020996094 1270.212158203125 1006.937683105469 1271.270751953125 1006.962219238281 C 1275.504272460938 1007.060729980469 1279.976928710938 1007.480712890625 1284.693115234375 1008.359497070313 C 1303.30029296875 1011.3779296875 1326.053466796875 1022.695495605469 1344.520874023438 1041.869750976563 C 1363.08984375 1060.395874023438 1376.229248046875 1085.648681640625 1380.712890625 1099.183959960938 C 1381.990112304688 1103.248779296875 1382.801879882813 1107.037963867188 1383.213256835938 1110.633544921875 C 1383.316040039063 1111.532836914063 1383.393798828125 1112.419677734375 1383.447265625 1113.295776367188 C 1383.500732421875 1114.172241210938 1383.529907226563 1115.03759765625 1383.53564453125 1115.893920898438 C 1383.547241210938 1117.6064453125 1383.465454101563 1119.281982421875 1383.296142578125 1120.932250976563 C 1382.616455078125 1127.533569335938 1380.55029296875 1133.72119140625 1377.40283203125 1140.284545898438 C 1371.09033203125 1152.997802734375 1360.5283203125 1167.56494140625 1347.167846679688 1180.50244140625 C 1333.776977539063 1193.436157226563 1317.54443359375 1203.967041015625 1299.54638671875 1207.974243164063 C 1295.034545898438 1209.073608398438 1290.407836914063 1209.804443359375 1285.658447265625 1210.260009765625 C 1283.28369140625 1210.487548828125 1280.878173828125 1210.646118164063 1278.44091796875 1210.746948242188 C 1277.222290039063 1210.797241210938 1275.99560546875 1210.832763671875 1274.760864257813 1210.855590820313 C 1273.526245117188 1210.878051757813 1272.283447265625 1210.887451171875 1271.032348632813 1210.884643554688 C 1261.025268554688 1210.858276367188 1250.4833984375 1210.093383789063 1239.375732421875 1209.082275390625 C 1239.375732421875 1209.082275390625 1239.375732421875 1209.082275390625 1239.375732421875 1209.082275390625 Z" fill="#7cc576" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
// const String _svg_hj92cf =
//     '<svg viewBox="1169.6 803.0 26.5 38.9" ><path transform="translate(744.59, 75.03)" d="M 424.9999694824219 727.9998168945313 L 424.9999694824219 766.921875 L 451.5378112792969 746.7898559570313 L 424.9999694824219 727.9998168945313 Z" fill="#7cc576" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
// const String _svg_xzbps5 =
//     '<svg viewBox="68.5 430.9 37.0 26.0" ><path transform="translate(68.5, 443.93)" d="M 0 0 L 37 0" fill="none" stroke="#a0d59b" stroke-width="2" stroke-miterlimit="4" stroke-linecap="round" /><path transform="translate(93.5, 430.93)" d="M 0 0 L 12 12" fill="none" stroke="#a0d59b" stroke-width="2" stroke-miterlimit="4" stroke-linecap="round" /><path transform="matrix(0.0, 1.0, -1.0, 0.0, 105.5, 444.93)" d="M 0 0 L 12 12" fill="none" stroke="#a0d59b" stroke-width="2" stroke-miterlimit="4" stroke-linecap="round" /></svg>';
// const String _svg_igbqdo =
//     '<svg viewBox="0.0 0.3 218.5 58.0" ><path transform="translate(0.0, 0.33)" d="M 10 0 L 208.4771270751953 0 C 213.9999694824219 0 218.4771270751953 4.477152347564697 218.4771270751953 10 L 218.4771270751953 47.98239135742188 C 218.4771270751953 53.5052375793457 213.9999694824219 57.98239135742188 208.4771270751953 57.98239135742188 L 10 57.98239135742188 C 4.477152347564697 57.98239135742188 0 53.5052375793457 0 47.98239135742188 L 0 10 C 0 4.477152347564697 4.477152347564697 0 10 0 Z" fill="#7cc576" fill-opacity="0.1" stroke="none" stroke-width="1" stroke-opacity="0.1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
// const String _svg_w087tr =
//     '<svg viewBox="0.0 6986.7 1920.0 767.3" ><path transform="translate(0.0, 6986.67)" d="M 0 0 L 1920 0 L 1920 767.33349609375 L 0 767.33349609375 L 0 0 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_olzint =
//     '<svg viewBox="0.1 0.0 7.8 14.4" ><path transform="translate(-276.54, -382.81)" d="M 284.1455078125 382.7948608398438 L 282.2797546386719 382.7920532226563 C 280.183837890625 382.7920532226563 278.8297424316406 384.1819458007813 278.8297424316406 386.3327026367188 L 278.8297424316406 387.9654541015625 L 276.9537048339844 387.9654541015625 C 276.7914733886719 387.9654541015625 276.6600036621094 388.0962524414063 276.6600036621094 388.2584228515625 L 276.6600036621094 390.6242065429688 C 276.6600036621094 390.78564453125 276.7914733886719 390.9171752929688 276.9537048339844 390.9171752929688 L 278.8297424316406 390.9171752929688 L 278.8297424316406 396.8859252929688 C 278.8297424316406 397.0474243164063 278.9605102539063 397.1788940429688 279.1227416992188 397.1788940429688 L 281.5701293945313 397.1788940429688 C 281.7323608398438 397.1788940429688 281.86328125 397.0474243164063 281.86328125 396.8859252929688 L 281.86328125 390.9171752929688 L 284.0562744140625 390.9171752929688 C 284.218505859375 390.9171752929688 284.3501892089844 390.78564453125 284.3501892089844 390.6242065429688 L 284.3509216308594 388.2584228515625 C 284.3509216308594 388.1810302734375 284.3200378417969 388.1065673828125 284.2646484375 388.0509643554688 C 284.2098693847656 387.9961547851563 284.13525390625 387.9654541015625 284.0570373535156 387.9654541015625 L 281.86328125 387.9654541015625 L 281.86328125 386.5813598632813 C 281.86328125 385.916259765625 282.0217590332031 385.5785522460938 282.8885192871094 385.5785522460938 L 284.144775390625 385.5778198242188 C 284.3069458007813 385.5778198242188 284.4384765625 385.4462890625 284.4384765625 385.2848510742188 L 284.4384765625 383.0887451171875 C 284.4384765625 382.9263916015625 284.3069458007813 382.7955932617188 284.1455078125 382.7948608398438 L 284.1455078125 382.7948608398438 Z M 284.1455078125 382.7948608398438" fill="#ffffff" fill-opacity="0.8" stroke="none" stroke-width="1" stroke-opacity="0.8" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
// const String _svg_21whw2 =
//     '<svg viewBox="0.0 0.0 14.0 11.4" ><path transform="translate(-52.0, -222.89)" d="M 66 224.2355499267578 C 65.48461151123047 224.4638214111328 64.93181610107422 224.6186370849609 64.35089111328125 224.6877899169922 C 64.94399261474609 224.3325958251953 65.39804840087891 223.7692108154297 65.61328125 223.1000213623047 C 65.05692291259766 223.4288482666016 64.44270324707031 223.6677398681641 63.78837585449219 223.7972259521484 C 63.26428985595703 223.2381744384766 62.5189208984375 222.8900299072266 61.69223785400391 222.8900299072266 C 60.10612487792969 222.8900299072266 58.82016754150391 224.1760101318359 58.82016754150391 225.7612152099609 C 58.82016754150391 225.9860382080078 58.84549713134766 226.2056427001953 58.89454650878906 226.4155426025391 C 56.50800323486328 226.2957000732422 54.39180374145508 225.1523284912109 52.97544860839844 223.4149017333984 C 52.72782516479492 223.8383026123047 52.58696746826172 224.3316802978516 52.58696746826172 224.8583526611328 C 52.58696746826172 225.8548126220703 53.09440231323242 226.7339630126953 53.86422729492188 227.2483367919922 C 53.39365005493164 227.2327117919922 52.95100784301758 227.1031341552734 52.56340408325195 226.8880157470703 L 52.56340408325195 226.9238433837891 C 52.56340408325195 228.3148651123047 53.55371856689453 229.4757232666016 54.86684036254883 229.7398834228516 C 54.62624740600586 229.8046722412109 54.37257766723633 229.8404998779297 54.11008834838867 229.8404998779297 C 53.92467498779297 229.8404998779297 53.74528503417969 229.8222198486328 53.56947326660156 229.7871551513672 C 53.93517684936523 230.9287872314453 54.99540710449219 231.7590179443359 56.25167846679688 231.7818450927734 C 55.269287109375 232.5516510009766 54.03045272827148 233.0091400146484 52.6850471496582 233.0091400146484 C 52.45316696166992 233.0091400146484 52.22483825683594 232.9952239990234 52 232.9698333740234 C 53.27112197875977 233.7860260009766 54.78025054931641 234.2619476318359 56.40223693847656 234.2619476318359 C 61.68531799316406 234.2619476318359 64.57315063476563 229.8859710693359 64.57315063476563 226.0910491943359 L 64.56342315673828 225.7192230224609 C 65.12774658203125 225.3167572021484 65.61585998535156 224.8111114501953 66 224.2355499267578 L 66 224.2355499267578 Z M 66 224.2355499267578" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
// const String _svg_4kca55 =
//     '<svg viewBox="0.0 0.0 22.2 13.9" ><path transform="translate(-358.42, -342.35)" d="M 377.8143005371094 347.8973083496094 L 377.8143005371094 345.0889892578125 L 376.4102478027344 345.0889892578125 L 376.4102478027344 347.8973083496094 L 373.6019897460938 347.8973083496094 L 373.6019897460938 349.3016357421875 L 376.4102478027344 349.3016357421875 L 376.4102478027344 352.1099548339844 L 377.8143005371094 352.1099548339844 L 377.8143005371094 349.3016357421875 L 380.6228332519531 349.3016357421875 L 380.6228332519531 347.8973083496094 L 377.8143005371094 347.8973083496094 Z M 377.8143005371094 347.8973083496094" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(-92.0, -293.89)" d="M 99.0208740234375 299.4398193359375 L 99.0208740234375 302.2146911621094 L 102.9932556152344 302.2146911621094 C 102.4132690429688 303.8298645019531 100.8519439697266 304.9898986816406 99.0208740234375 304.9898986816406 C 96.69827270507813 304.9898986816406 94.80828857421875 303.1221618652344 94.80828857421875 300.827392578125 C 94.80828857421875 298.5324096679688 96.69827270507813 296.6648864746094 99.0208740234375 296.6648864746094 C 100.0276489257813 296.6648864746094 100.9965972900391 297.0214233398438 101.7492523193359 297.6694641113281 L 103.5942687988281 295.5771484375 C 102.3305511474609 294.4893188476563 100.7073059082031 293.8900146484375 99.0208740234375 293.8900146484375 C 95.14962768554688 293.8900146484375 92 297.002197265625 92 300.827392578125 C 92 304.6526184082031 95.14962768554688 307.7648010253906 99.0208740234375 307.7648010253906 C 102.8921203613281 307.7648010253906 106.041748046875 304.6526184082031 106.041748046875 300.827392578125 L 106.041748046875 299.4398193359375 L 99.0208740234375 299.4398193359375 Z M 99.0208740234375 299.4398193359375" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
// const String _svg_ohlhok =
//     '<svg viewBox="0.0 0.0 16.0 11.3" ><path transform="translate(-173.0, -333.89)" d="M 188.3762664794922 334.8565368652344 C 187.7989044189453 334.1700439453125 186.7325897216797 333.8900146484375 184.6960754394531 333.8900146484375 L 177.3036804199219 333.8900146484375 C 175.2207794189453 333.8900146484375 174.1363220214844 334.1881713867188 173.5609741210938 334.9190673828125 C 173 335.6317138671875 173 336.681884765625 173 338.135009765625 L 173 340.9051818847656 C 173 343.7206726074219 173.6655578613281 345.150146484375 177.3036804199219 345.150146484375 L 184.6960754394531 345.150146484375 C 186.4622039794922 345.150146484375 187.4407806396484 344.9031982421875 188.0738830566406 344.2970581054688 C 188.7230377197266 343.6758422851563 189 342.6614379882813 189 340.9051818847656 L 189 338.135009765625 C 189 336.6024780273438 188.9566497802734 335.5462951660156 188.3762664794922 334.8565368652344 L 188.3762664794922 334.8565368652344 Z M 183.2722015380859 339.9026794433594 L 179.9153594970703 341.6569213867188 C 179.8402099609375 341.6962280273438 179.7580718994141 341.7156372070313 179.6761322021484 341.7156372070313 C 179.5834197998047 341.7156372070313 179.4906463623047 341.6907348632813 179.4087829589844 341.6410522460938 C 179.2542724609375 341.5473022460938 179.1600036621094 341.3799438476563 179.1600036621094 341.1995239257813 L 179.1600036621094 337.7020263671875 C 179.1600036621094 337.5218505859375 179.2540588378906 337.3545532226563 179.4082641601563 337.2607421875 C 179.5625305175781 337.167236328125 179.7540588378906 337.1609802246094 179.9140625 337.243896484375 L 183.2709045410156 338.987060546875 C 183.4415588378906 339.0757751464844 183.5489044189453 339.251953125 183.5491638183594 339.4444885253906 C 183.5494232177734 339.6367797851563 183.4425201416016 339.8134460449219 183.2722015380859 339.9026794433594 L 183.2722015380859 339.9026794433594 Z M 183.2722015380859 339.9026794433594" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
// const String _svg_9occue =
//     '<svg viewBox="0.0 0.0 23.5 22.5" ><path transform="translate(0.0, 0.0)" d="M 22.31121253967285 7.525944232940674 L 15.8884162902832 6.590850830078125 L 13.0181884765625 0.781511664390564 C 12.76016998291016 0.2624053955078125 12.25686073303223 0 11.7535514831543 0 C 11.2533130645752 0 10.75351238250732 0.2588949799537659 10.49461841583252 0.781511664390564 L 7.623512744903564 6.590412616729736 L 1.200276613235474 7.524628639221191 C 0.0484117679297924 7.691374778747559 -0.4132117331027985 9.108275413513184 0.4218353629112244 9.920065879821777 L 5.068347454071045 14.43975639343262 L 3.968701362609863 20.82349014282227 C 3.812485694885254 21.73532867431641 4.540463924407959 22.46681594848633 5.355764389038086 22.46681594848633 C 5.57209587097168 22.46681594848633 5.794569969177246 22.41547584533691 6.0082688331604 22.30226516723633 L 11.75442790985107 19.28855133056641 L 17.50015068054199 22.30314064025879 C 17.71340751647949 22.4150390625 17.93544387817383 22.46593856811523 18.15089797973633 22.46593856811523 C 18.96707534790039 22.46593856811523 19.69636917114258 21.73708152770996 19.5401554107666 20.82480812072754 L 18.44182395935059 14.44063472747803 L 23.0892162322998 9.921821594238281 C 23.92470169067383 9.110031127929688 23.46308135986328 7.692690849304199 22.31121444702148 7.52594518661499 Z M 16.96919441223145 12.93202209472656 L 16.1740779876709 13.70519638061523 L 16.36188697814941 14.79694366455078 L 17.21843528747559 19.77518653869629 L 12.73691272735596 17.42362976074219 L 11.75486660003662 16.90847206115723 L 11.75618267059326 2.990016460418701 L 13.9954080581665 7.522433757781982 L 14.48599243164063 8.515450477600098 L 15.58344554901123 8.675174713134766 L 20.59592247009277 9.404908180236816 L 16.96919441223145 12.93202209472656 Z" fill="#fd6921" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_13fpr0 =
//     '<svg viewBox="0.0 0.0 23.5 22.5" ><path transform="translate(-20.5, 0.01)" d="M 30.99790573120117 0.7704235911369324 L 28.12712287902832 6.591147422790527 L 21.70412826538086 7.527562141418457 C 20.55229759216309 7.694622993469238 20.0906867980957 9.11463451385498 20.92598152160645 9.927952766418457 L 25.57287216186523 14.45615863800049 L 24.47379684448242 20.8528003692627 C 24.27596282958984 22.00903129577637 25.49373817443848 22.8751049041748 26.51367950439453 22.33436012268066 L 32.2596435546875 19.31408882141113 L 38.00561141967773 22.33436012268066 C 39.02555465698242 22.8707103729248 40.24333190917969 22.00903129577637 40.04549789428711 20.85279846191406 L 38.94641876220703 14.45615768432617 L 43.59331130981445 9.927951812744141 C 44.42860794067383 9.114632606506348 43.96699523925781 7.694621086120605 42.81516265869141 7.527561664581299 L 36.39216995239258 6.591147422790527 L 33.52138519287109 0.7704235911369324 C 33.00701904296875 -0.2671072483062744 31.51667022705078 -0.2802961468696594 30.9979076385498 0.7704235911369324 Z" fill="#fd6921" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_a0kocv =
//     '<svg viewBox="1501.0 7356.5 25.7 25.7" ><path transform="translate(1501.0, 7356.5)" d="M 25.2673225402832 0.4195044040679932 C 25.26586532592773 0.4179999232292175 25.26461219787598 0.4163950681686401 25.26315879821777 0.4148906469345093 C 25.26165390014648 0.413436233997345 25.26004791259766 0.4121825098991394 25.25854301452637 0.4107783138751984 C 24.85890007019043 0.01449273340404034 24.28573417663574 -0.1045634523034096 23.76106643676758 0.1006003469228745 L 0.8917438983917236 9.042703628540039 C 0.2871350944042206 9.279060363769531 -0.06712474673986435 9.870980262756348 0.01010631211102009 10.51545906066895 C 0.08748781681060791 11.15993690490723 0.5715860724449158 11.65130710601807 1.214860558509827 11.73801708221436 L 12.3922004699707 13.24542808532715 C 12.41311264038086 13.2482852935791 12.42986297607422 13.26493549346924 12.43267154693604 13.28599834442139 L 13.9401330947876 24.46319007873535 C 14.02684211730957 25.10646438598633 14.51816368103027 25.59061050415039 15.16269111633301 25.66794204711914 C 15.22156715393066 25.67496109008789 15.27989101409912 25.67837142944336 15.3376636505127 25.67837142944336 C 15.91228294372559 25.67837142944336 16.42060470581055 25.33564758300781 16.63544654846191 24.78630638122559 L 25.57759666442871 1.916833877563477 C 25.78265953063965 1.39221453666687 25.66365432739258 0.8191500902175903 25.2673225402832 0.4195044040679932 Z M 1.355431199073792 10.3541259765625 C 1.351118087768555 10.31781768798828 1.361749887466431 10.31360530853271 1.385170102119446 10.30452728271484 L 22.78188514709473 1.938198089599609 L 12.77419376373291 11.94598865509033 C 12.70894813537598 11.92708301544189 1.396152973175049 10.39535045623779 1.396152973175049 10.39535045623779 C 1.37107789516449 10.39193916320801 1.359794139862061 10.39043521881104 1.355431199073792 10.3541259765625 Z M 15.37352180480957 24.29292869567871 C 15.36434364318848 24.31639862060547 15.36068248748779 24.3271312713623 15.3239221572876 24.32261848449707 C 15.28766441345215 24.3182544708252 15.28610992431641 24.30687141418457 15.28280067443848 24.28194618225098 C 15.28280067443848 24.28194618225098 13.75106716156006 12.96915054321289 13.73216247558594 12.90390491485596 L 23.7398509979248 2.896214485168457 L 15.37352180480957 24.29292869567871 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
// const String _svg_35rr6s =
//     '<svg viewBox="922.5 7653.5 80.0 1.0" ><path transform="translate(922.5, 7653.5)" d="M 0 0 L 80 0" fill="none" stroke="#7cc576" stroke-width="5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// const String _svg_c4kpdh =
//     '<svg viewBox="16.0 11.5 14.8 24.0" ><path  d="M 30.82999992370605 32.66999816894531 L 21.65999984741211 23.49999809265137 L 30.82999992370605 14.32999801635742 L 28 11.5 L 16 23.5 L 28 35.5 L 30.82999992370605 32.66999816894531 Z" fill="#727272" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
