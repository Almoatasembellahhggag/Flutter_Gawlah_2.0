import 'dart:ui';

import 'package:flutter_gawlah/ui/shared/ui_helpers.dart';
import 'package:flutter_gawlah/ui/views/home_view.dart';
import 'package:flutter_gawlah/ui/views/home_view_places.dart';
import 'package:flutter_gawlah/ui/views/signup_view.dart';

import 'package:flutter_gawlah/ui/widgets/input_field.dart';
import 'package:flutter_gawlah/ui/widgets/busy_button.dart';
import 'package:flutter_gawlah/ui/widgets/text_link.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gawlah/verticalspacer.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:flutter_gawlah/view_models.dart/login_view_model.dart';
import 'package:shimmer/shimmer.dart';

class CreatepageView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          backgroundColor: Color.fromRGBO(38, 47, 62, 1),
          body: Container(// color: Colors.white,
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
                    [ Image.asset("images_and_icons/giphy.gif",height: 112,),
                    FlatButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeViewPlace())),
                      child: Text(
                      "Create Place",style: TextStyle(color:Colors.white,fontWeight:FontWeight.bold,fontSize: 18 ),
                      
                    ))
                    ])
                    ),
                  ),
                  SizedBox(height:40),
                  ClipRRect(borderRadius: BorderRadius.circular(25),
                                      child: Container(color:Color.fromRGBO(38, 47, 62, 1),width:150,height:180,
                 child:Column(children:<Widget>
                    [ Image.asset("images_and_icons/aaa.gif",height: 116,),
                    FlatButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeView())),
                      child: Text(
                      "Create Tour",style: TextStyle(color:Colors.white,fontWeight:FontWeight.bold,fontSize: 18 ),
                      
                    ))
                    ])
                    ),
                  )
                  
                  
                ])),
              
               ])
              
          ));
 
  }
}