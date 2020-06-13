import 'dart:ui';

import 'package:flutter_gawlah/ui/shared/ui_helpers.dart';
import 'package:flutter_gawlah/view_models.dart/startup_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:shimmer/shimmer.dart';

import '../../verticalspacer.dart';

class StartUpView extends StatelessWidget {
  const StartUpView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<StartUpViewModel>.withConsumer(
      viewModel: StartUpViewModel(),
      onModelReady: (model) => model.handleStartUpLogic(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Color.fromRGBO(38, 47, 62, 1),
        body:   Container(// color: Colors.white,
             child: Stack(children:<Widget>[
                          ClipRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                            child: Container(
                              color: Colors.black38.withOpacity(0.4),
                            ),
                          ),
                        ),
        
        
        Center(child:
           
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                Shimmer.fromColors(
                period: Duration(milliseconds: 1500),
                baseColor: Colors.blue[600],
                //Color.fromRGBO(38, 47, 62, 1),
                highlightColor:Colors.blue[900],
                //Colors.blue[600],
                child:Column(children: <Widget>[
                VSpacer(0.05),
                 Hero(tag:"image",child: Image.asset('images_and_icons/g_transparent.png')),
                 verticalSpaceTiny,
                  Text(
                    "GAWLAH",
                    style: TextStyle(
                        fontSize: 30.0,
                        fontFamily: 'Pacifico',
                        // shadows: <Shadow>[
                        //   Shadow(
                        //       blurRadius: 18.0,
                        //       color: Colors.black87,
                        //       offset: Offset.fromDirection(120, 12))
                        // ]
                        ),
                  ),



               ],)   ),
               verticalSpaceSmall,
              Container(width: 120,
                child: LinearProgressIndicator(
                 // strokeWidth: 6,
                 
                  valueColor: AlwaysStoppedAnimation(
                    Colors.blue[700],
                  ),
                ),
              )
            ],
          ),
        ),
      ),]))
    ));
  }
}