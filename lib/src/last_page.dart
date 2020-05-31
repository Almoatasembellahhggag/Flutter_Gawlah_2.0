import 'dart:ui' as ui;
import 'package:flutter/material.dart';

import 'package:flutter_gawlah/src/appviewmodel.dart';
import 'package:provider_architecture/viewmodel_provider.dart';

class LastPage extends StatefulWidget {
  LastPage({this.statusType,this.finalstring});

  final String statusType;
  final List<String> finalstring;

  @override
  LastPageState createState() {
    // TODO: implement createState
    return LastPageState();
  }
}

class LastPageState extends State<LastPage> {
  List<Feedback> feedbackList = [];
  List<String> answerfinishh = [];
  String msg = '';
  String usingTimes = 'muez street';
  String using='Remarkable';
  String imgPath = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.statusType == 'Unhappy') {
      imgPath = 'images_and_icons/angry.gif';
      msg = 'We are so sorry. What we did wrong?';
      feedbackList = [
        Feedback(
            'Not helpful and not thoughful', 'Not helpful and not thoughful'),
        Feedback('Slow and not responsive', 'Slow and not responsive'),
        Feedback('Support line is always busy', 'Support line is always busy'),
        Feedback('Confusing', 'Confusing'),
      ];
    } else if (widget.statusType == 'Neutral') {
      imgPath = 'images_and_icons/mmm.gif';
      msg = 'Neutral is okay. Why is that?';
      feedbackList = [
        Feedback('I never called support', 'I never called support'),
        Feedback('I think they are okay', 'I think they are okay'),
        Feedback('I don\'t know', 'I don\'t know'),
      ];
    } else {
      imgPath = 'images_and_icons/hearteyes.gif';
      msg = 'High five! What makes you satisfied?';
      feedbackList = [
        Feedback('Helpful and thoughful', 'Helpful and thoughful'),
        Feedback('Quick and responsive', 'Quick and responsive'),
        Feedback('Solved most of my problems', 'Solved most of my problems'),
        Feedback(
            'Good knowledge of the product', 'Good knowledge of the product'),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    final ui.Size logicalSize = MediaQuery.of(context).size;
    final double _width = logicalSize.width;
    // TODO: implement build
    return 
    
    
    
   ViewModelProvider<AppViewModel>.withConsumer(
      viewModel:AppViewModel(),
      builder:(context, model, child) =>MaterialApp(debugShowCheckedModeBanner: false,
     home:   Scaffold(
        body: Center(
          child: Container(
              color: Color.fromRGBO(38, 47, 62, 1),
              padding: EdgeInsets.all(16.0),
              child: getPages(_width)),
        ),
        bottomNavigationBar: BottomAppBar(
            child: Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(38, 47, 62, 1),
                    boxShadow: [BoxShadow(color: Colors.grey.withAlpha(200))]),
                height: 50.0,
                child: Center(
                  child: RaisedButton(
                      color: Color.fromRGBO(38, 47, 62, 1),
                      onPressed: () {
                          model.addPost(survey: widget.finalstring);
                      
                      },
                      child: Text(
                        'Finish',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.blue[600],
                          backgroundColor: Color.fromRGBO(38, 47, 62, 1),
                        ),
                      )),
                ))),
      )),
    );
  }

  Widget getPages(double _width) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          color: Color.fromRGBO(38, 47, 62, 1),
//                color: Colors.blue,
          margin: EdgeInsets.only(top: 30.0),
          height: 10.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(4, (int index) {
              return Container(
                decoration: BoxDecoration(
//                    color: Colors.orangeAccent,
                  color: Colors.blue[600],
                  borderRadius: BorderRadius.all(Radius.circular(2.0)),
                ),
                height: 10.0,
                width: (_width - 32.0 - 15.0) / 4.0,
                margin: EdgeInsets.only(left: index == 0 ? 0.0 : 5.0),
              );
            }),
          ),
        ),
        _getContent(),
      ],
    );
  }

  Widget _getContent() {
    return Expanded(
      child: Container(
        color: Color.fromRGBO(38, 47, 62, 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
                tag: widget.statusType,
                child: Container(
                  color: Color.fromRGBO(38, 47, 62, 1),
                  margin: EdgeInsets.symmetric(vertical: 40.0),
                  child: GestureDetector(
                      onTapUp: (details) {
                        Navigator.of(context).pop();
                      },
                      child: Image.asset(
                        imgPath,
                        width: 100.0,
                        height: 100.0,
                      )),
                )),
            Text(
              msg,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
       Expanded(
                  child: Center(
                    
                    child: Container(
                      color: Color.fromRGBO(38, 47, 62, 1),
                      height: 258.0,
                      child: Card(color: Color.fromRGBO(38, 47, 62, 1),
                        child: Column(
                          children: List.generate(feedbackList.length,
                              (int index) {
                            final using = feedbackList[index];
                            return GestureDetector(
                              
                              onTapUp: (detail) {
                                if(answerfinishh.isEmpty){
                                setState(() {
                                  usingTimes = using.identifier;
                                   answerfinishh.add(using.identifier);
                                   widget.finalstring.add(using.identifier);
                                     // print(answers2);
                                       print(answerfinishh);
                                        print(widget.finalstring);
                                
                                });}
                                else{
                                answerfinishh.removeLast();
                                   setState(() {
                                  usingTimes = using.identifier;
                                    answerfinishh.add(using.identifier);
                                     widget.finalstring.add(using.identifier);
                                      print(answerfinishh);
                                      print(widget.finalstring);
                                
                                });
                                
                                }
                              },
                              child: Container(
                            //  color:  Color.fromRGBO(38, 47, 62, 1),
                                height: 50.0,
                                color: usingTimes == using.identifier
                                    ? Colors.blue[600].withAlpha(100)
                                    : Color.fromRGBO(38, 47, 62, 1),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Radio(
                                            activeColor: Colors.blue[600],
                                            value: using.identifier,
                                            groupValue: usingTimes,
                                            onChanged: (String value) {
                                              setState(() {
                                                usingTimes = value;
                                
                                              });
                                            }),
                                        Text(using.displayContent,style: TextStyle(color: Colors.white),)
                                        
                                      ],
                                      
                                    ),
                                    Divider(
                                      height: index < feedbackList.length
                                          ? 1.0
                                          : 0.0,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      
    
  }
}

class Feedback {
  final String displayContent;
  final String identifier;
  //final List<String>feedback;

  Feedback(this.displayContent, this.identifier);
}
