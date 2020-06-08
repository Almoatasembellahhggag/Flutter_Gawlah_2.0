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

class LoginView extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();


 

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<LoginViewModel>.withConsumer(
      viewModel: LoginViewModel(),
      builder: (context, model, child) => Scaffold(
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
      
                   
            
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
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
                VSpacer(0.1),
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

                  VSpacer(0.1),
                  InputField(
                    
                    placeholder: 'Email',
                    controller: emailController,
                    
                    
                  ),
                  verticalSpaceSmall,
                  InputField(
                   
                    placeholder: 'Password',
                    password: true,
                    controller: passwordController,
                    
                  ),
                  verticalSpaceMedium,
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      BusyButton(
                        title: 'Login',
                        busy: model.busy,
                        onPressed: () {
                          model.login(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                        },
                      )
                    ],
                  ),
                  verticalSpaceMedium,
                  TextLink(
                  
                    'Create an Account if you\'re new.',
                    onPressed: () {
                      model.navigateToSignUp();
                    },
                  )
                ],
              ),
              ) )]),
          )));
 
  }
}