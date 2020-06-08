import 'dart:ui';

import 'package:flutter_gawlah/ui/shared/ui_helpers.dart';
import 'package:flutter_gawlah/ui/views/signup_view.dart';

import 'package:flutter_gawlah/ui/widgets/input_field.dart';
import 'package:flutter_gawlah/ui/widgets/busy_button.dart';
import 'package:flutter_gawlah/ui/widgets/text_link.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gawlah/verticalspacer.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:flutter_gawlah/view_models.dart/login_view_model.dart';
import 'package:shimmer/shimmer.dart';

import 'Tours/message.dart';
import 'Tours/messagemodel.dart';
class AboutUsPage extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState  extends State<AboutUsPage> {
   String _selectedItem = '';
     final messageController = TextEditingController();
   final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color.fromRGBO(38, 47, 62, 1),
        body:
        // Container(
            // color: Colors.white,

    //         child: Stack(children: <Widget>[
    //       Container(
    //           child: Stack(children: <Widget>[
    //         ClipRect(
    //           child: BackdropFilter(
    //             filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
    //             child: Container(
    //               color: Colors.black38.withOpacity(0.5),
    //             ),
    //           ),
    //         ),
    //       ])),

    //    Padding(
    //         padding: const EdgeInsets.symmetric(horizontal: 10),
    //         child: Column(
    //           mainAxisSize: MainAxisSize.max,
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           children: <Widget>[
    //             Shimmer.fromColors(
    //                 period: Duration(milliseconds: 1500),
    //                 baseColor: Colors.blue[600],
    //                 //Color.fromRGBO(38, 47, 62, 1),
    //                 highlightColor: Colors.blue[900],
    //                 //Colors.blue[600],
    //                 child: Column(
    //                   children: <Widget>[
    //                   //  VSpacer(0.1),
    //                     Hero(
    //                         tag: "image",
    //                         child: Image.asset(
    //                             'images_and_icons/g_transparent.png')),
    //                     verticalSpaceTiny,
    //                     Text(
    //                       "GAWLAH",
    //                       style: TextStyle(
    //                         fontSize: 30.0,
    //                         fontFamily: 'Pacifico',
    //                         // shadows: <Shadow>[
    //                         //   Shadow(
    //                         //       blurRadius: 18.0,
    //                         //       color: Colors.black87,
    //                         //       offset: Offset.fromDirection(120, 12))
    //                         // ]
    //                       ),
    //                     ),
    //                   ],
    //                 )),
                    
    //    Row(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: <Widget>[
    //         ClipOval(
    //                       child: RaisedButton(
    //             color: Colors.grey,
    //             child: Text('About Us',style: TextStyle(color:Color.fromRGBO(38, 47, 62, 1),fontWeight: FontWeight.bold),),
    //             onPressed: _onButtonPressedaboutus,
    //           ),
    //         ),
    //        SizedBox(width: 10,),
           
    //                ClipOval(
    //                             child: RaisedButton( onPressed: _onButtonPressedcontactus,color: Colors.grey,
               
    //           child: Text("Contact Us",style: TextStyle(color:Color.fromRGBO(38, 47, 62, 1),fontWeight: FontWeight.bold),),
                 
    //           ),
    //             ),
            
           
    //       ],
    //     ),
    //         ]),
    // )]))
    
    
    
    
    
    Container(// color: Colors.white,
             child: Stack(children:<Widget>[
                          ClipRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                            child: Container(
                              color: Colors.black38.withOpacity(0.4),
                            ),
                          ),
                        ),
            
     SingleChildScrollView(child:
      
                   
            
             
             Column(
                crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                Shimmer.fromColors(
                period: Duration(milliseconds: 1500),
                baseColor: Colors.blue[600],
                //Color.fromRGBO(38, 47, 62, 1),
                highlightColor:Colors.blue[900],
                //Colors.blue[600],
                child:Padding( padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: Column(
                     crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                    
                  VSpacer(0.05),
                  Container(child:
                   Image.asset('images_and_icons/g_transparent.png'),height: 100,width: 80,),
                   verticalSpaceTiny,
              
               ],),
                )   ),

          
                ],
              ),
              ),
              Center(child:
                Column(
                    mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[ 
                  VSpacer(0.1),
                  ClipRRect(borderRadius: BorderRadius.circular(25),
                                      child: Container(color:Color.fromRGBO(38, 47, 62, 1),width:150,height:180,
                    child:Column(children:<Widget>
                    [ Image.asset("images_and_icons/aboutus.gif",height: 120,width: 170,fit: BoxFit.fitWidth,),
                    FlatButton(  onPressed: _onButtonPressedaboutus,
                      child: Text(
                      "About Us",style: TextStyle(color:Colors.white,fontWeight:FontWeight.bold,fontSize: 18 ),
                      
                    ))
                    ])
                    ),
                  ),
                  SizedBox(height:40),
                  ClipRRect(borderRadius: BorderRadius.circular(25),
                                      child: Container(color:Color.fromRGBO(38, 47, 62, 1),width:150,height:180,
                 child:Column(children:<Widget>
                    [ Image.asset("images_and_icons/small.gif",height: 116,),
                    FlatButton(onPressed: _onButtonPressedcontactus,
                      child: Text(
                      "Contact Us",style: TextStyle(color:Colors.white,fontWeight:FontWeight.bold,fontSize: 18 ),
                      
                    ))
                    ])
                    ),
                  )
                  
                  
                ])),
              
               ])
              
          )
    
    
    
    
    
    
    
    
    
    
    
    );
  }

  void _onButtonPressedaboutus() {
    showModalBottomSheet(
      isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          
          return 
           Container(
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 40),
              child: SingleChildScrollView(child: _buildBottomNavigationMenu()),
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
          
          );
        });
  }

    void _onButtonPressedcontactus() {
    showModalBottomSheet(
      isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          
          return 
           Container(
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 40),
              child: SingleChildScrollView(child: _buildBottomNavigationMenucontact()),
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
          
          );
        });
  }

  Column _buildBottomNavigationMenu() {
    return Column(children: <Widget>[
      Image.asset("images_and_icons/egypt.jpg"),

      Container(child:

     Padding( padding: EdgeInsets.all(16.0),
            child: Center(
         child: Text( 
                        "The tourism in Egypt has always been an important source of income for the country. Tourists come from around the globe to witness the amazing civilization of ancient Egypt. Therefore, it is essential to search for methods to encourage people to visit more and sense the spirit of that civilization. This application mainly focuses on Tours all over Egypt. Since technology plays a major role in our life, The application was to add more life in our Egyptian culture and to change the tourists’ experience in them.Egypt's antiques are both part of its cultural heritage and an opportunity for job creation and inco me raising. Tourism is one of Egypt's leading revenue sources, crucial to the economy. The wide spread of technology and smart devices have decreased the interest in live tour visits. Tour visits have become boring compared with the exciting and intriguing world of video gaming and online streaming. Galwah aims to include technology in the touristic tours visits in order to make them more interesting and to personalize the visits to each individual interest.",style: TextStyle(color: Colors.black,fontSize:14,), textAlign: TextAlign.justify, ),
       ),
     ),
               // verticalSpaceLarge,
      
  
        )
  
     ]);
        //          Center(
        //     child: Container(
        //       width: 150,
        //       height: 5,
        //       margin: EdgeInsets.only(top: 10, bottom: 10),
        //       decoration: BoxDecoration(
        //         color: Colors.grey[500],
        //         borderRadius: BorderRadius.circular(20),
        //       ),
        //     ),
          
        // ),
   
  }
  
  Column _buildBottomNavigationMenucontact() {
    return

    
    
     Column(children: <Widget>[
       x(),

     ]);
  }
x(){

 return ViewModelProvider<MessageViewModel>.withConsumer(
        viewModel: MessageViewModel(),
        builder: (context, model, child) => 
                  SingleChildScrollView(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                           VSpacer(0.03),

                            Text("Please Enter Your message.",style: TextStyle(color:Color.fromRGBO(38, 47, 62, 1),fontSize: 18),),
            //                 Text(
            //                   "  Please Enter The Message",
            //                   style: TextStyle(color: Colors.white),
            //                 ),
            //                 InputLongField(
            //                   placeholder: 'Message',
            //                   controller: messageController,
            //                 ),
            // RaisedButton(onPressed: (){model.addMessage(message: messageController.text);},child: Text('Submit'),)







Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: messageController,
            maxLines: 10,
            style: TextStyle(color:Colors.white),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          SizedBox(height: 20,)
,          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ClipOval(
                          child: RaisedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false
                  // otherwise.
                  if (_formKey.currentState.validate()) {
                    // If the form is valid, display a Snackbar.
                 {model.addMessage(message: messageController.text);}
                  }
                },
                child: Text('Submit',style: TextStyle(color:Color.fromRGBO(38, 47, 62, 1)),),
              ),
            ),
          ),
        ],
      ),
    )













                          ],
                        )),
                  ));
              
            
          




}






  void _selectItem(String name) {
    Navigator.pop(context);
    setState(() {
      _selectedItem = name;
    });
  }
}















//     return 



//Scaffold(
//         backgroundColor: Color.fromRGBO(38, 47, 62, 1),
//         body: Container(
//             // color: Colors.white,

//             child: Stack(children: <Widget>[
//           Container(
//               child: Stack(children: <Widget>[
//             ClipRect(
//               child: BackdropFilter(
//                 filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
//                 child: Container(
//                   color: Colors.black38.withOpacity(0.5),
//                 ),
//               ),
//             ),
//           ])),
//           SingleChildScrollView(
//               child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10),
//             child: Column(
//               mainAxisSize: MainAxisSize.max,
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 Shimmer.fromColors(
//                     period: Duration(milliseconds: 1500),
//                     baseColor: Colors.blue[600],
//                     //Color.fromRGBO(38, 47, 62, 1),
//                     highlightColor: Colors.blue[900],
//                     //Colors.blue[600],
//                     child: Column(
//                       children: <Widget>[
//                         VSpacer(0.1),
//                         Hero(
//                             tag: "image",
//                             child: Image.asset(
//                                 'images_and_icons/g_transparent.png')),
//                         verticalSpaceTiny,
//                         Text(
//                           "GAWLAH",
//                           style: TextStyle(
//                             fontSize: 30.0,
//                             fontFamily: 'Pacifico',
//                             // shadows: <Shadow>[
//                             //   Shadow(
//                             //       blurRadius: 18.0,
//                             //       color: Colors.black87,
//                             //       offset: Offset.fromDirection(120, 12))
//                             // ]
//                           ),
//                         ),
//                       ],
//                     )),
//                 VSpacer(0.1),
//                 Text( 
//                     "The tourism in Egypt has always been an important source of income for the country. Tourists come from around the globe to witness the amazing civilization of ancient Egypt. Therefore, it is essential to search for methods to encourage people to visit more and sense the spirit of that civilization. This application mainly focuses on Tours all over Egypt. Since technology plays a major role in our life, The application was to add more life in our Egyptian culture and to change the tourists’ experience in them.Egypt's antiques are both part of its cultural heritage and an opportunity for job creation and inco me raising. Tourism is one of Egypt's leading revenue sources, crucial to the economy. The wide spread of technology and smart devices have decreased the interest in live tour visits. Tour visits have become boring compared with the exciting and intriguing world of video gaming and online streaming. Galwah aims to include technology in the touristic tours visits in order to make them more interesting and to personalize the visits to each individual interest.",style: TextStyle(color: Colors.white,fontSize:18,), textAlign: TextAlign.justify, ),
//                 verticalSpaceLarge,
//                 TextLink(
//                   'Contact Us',
                
//                   onPressed: () {
//                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MessageView()));
//                   },
//                 )
//               ],
//             ),
//           ))
//         ])));
//   }
// }
