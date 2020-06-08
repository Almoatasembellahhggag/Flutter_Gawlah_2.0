import 'dart:ui';

import 'package:flutter_gawlah/ui/shared/ui_helpers.dart';
import 'package:flutter_gawlah/ui/views/signup_view.dart';

import 'package:flutter_gawlah/ui/widgets/input_field.dart';
import 'package:flutter_gawlah/ui/widgets/busy_button.dart';
import 'package:flutter_gawlah/ui/widgets/inputfeildlong.dart';
import 'package:flutter_gawlah/ui/widgets/text_link.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gawlah/verticalspacer.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:flutter_gawlah/view_models.dart/login_view_model.dart';
import 'package:shimmer/shimmer.dart';

import 'messagemodel.dart';

class MessageView extends StatelessWidget {
  final messageController = TextEditingController();
   final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<MessageViewModel>.withConsumer(
        viewModel: MessageViewModel(),
        builder: (context, model, child) => Scaffold(
            backgroundColor: Color.fromRGBO(38, 47, 62, 1),
            body: Container(
              // color: Colors.white,

              child: Stack(
                children: <Widget>[
                  Container(
                      child: Stack(children: <Widget>[
                    ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                        child: Container(
                          color: Colors.black38.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ])),
                  SingleChildScrollView(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            VSpacer(0.2),

                            Text("Please Enter Your message.",style: TextStyle(color:Colors.white,fontSize: 18),),
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
                child: Text('Submit'),
              ),
            ),
          ),
        ],
      ),
    )













                          ],
                        )),
                  ),
                ],
              ),
            )));
  }
}
