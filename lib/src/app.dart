import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_gawlah/datastore.dart';
import 'package:flutter_gawlah/src/last_page.dart';
import 'package:flutter_gawlah/verticalspacer.dart';
import 'package:shimmer/shimmer.dart';


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue[600]),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() {
    // TODO: implement createState
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  AnimationController _animateController;
  AnimationController _longPressController;
  AnimationController _secondStepController;
  AnimationController _thirdStepController;
  AnimationController _fourStepController;

  double overall = 3.0;
  String overallStatus = "Good";
  int curIndex = 0;
  String usingTimes = 'muez street';
  String using='Remarkable';
 final List<String> answers33= [];
  final List<String> answers2= [];
  final List<String> answers1= [];
  final List<String> answers4= [];
  final List<String>answerfinal=[];
  bool isFairly = false;
  bool isClear = false;
  bool isEasy = false;
  bool isFriendly = false;
  bool liked=false;

  List<SecondQuestion> usingCollection = [
    SecondQuestion('muez street', 'Muez Street Tour'),
    SecondQuestion('tahrir square', 'El Tahrir Square Tour'),
    SecondQuestion('pyramids', 'Pyramids Tour'),
    // SecondQuestion('everyMoths', 'Every 2-3 months'),
    // SecondQuestion('lessThanYears', 'Less than 5 a years'),
  ];
    List<ThirdQuestion> collection = [
    ThirdQuestion('Remarkable', 'Remarkable'),
    ThirdQuestion('Nice', 'Nice'),
    ThirdQuestion('Not bad', 'Not bad'),
    ThirdQuestion('Worse', 'Worse'),

  ];

  Animation<double> longPressAnimation;
  Animation<double> secondTranformAnimation;
  Animation<double> thirdTranformAnimation;
  Animation<double> fourTranformAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _animateController = AnimationController(
        duration: Duration(milliseconds: 2000), vsync: this);
    _longPressController = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);
    _secondStepController = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);
    _thirdStepController = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);
    _fourStepController = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);
    longPressAnimation =
        Tween<double>(begin: 1.0, end: 2.0).animate(CurvedAnimation(
            parent: _longPressController,
            curve: Interval(
              0.1,
              1.0,
              curve: Curves.fastOutSlowIn,
            )));

    fourTranformAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: _fourStepController,
            curve: Interval(
              0.1,
              1.0,
              curve: Curves.fastOutSlowIn,
            )));

    secondTranformAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: _secondStepController,
            curve: Interval(
              0.1,
              1.0,
              curve: Curves.fastOutSlowIn,
            )));

    thirdTranformAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: _thirdStepController,
            curve: Interval(
              0.1,
              1.0,
              curve: Curves.fastOutSlowIn,
            )));

    _longPressController.addListener(() {
      setState(() {});
    });

    _secondStepController.addListener(() {
      setState(() {});
    });

    _thirdStepController.addListener(() {
      setState(() {});
    });

    _fourStepController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animateController.dispose();
    _secondStepController.dispose();
    _thirdStepController.dispose();
    _fourStepController.dispose();
    _longPressController.dispose();
    super.dispose();
  }

  Future _startAnimation() async {
    try {
      await _animateController.forward().orCancel;
      setState(() {});
    } on TickerCanceled {}
  }

  Future _startLongPressAnimation() async {
    try {
      await _longPressController.forward().orCancel;
    } on TickerCanceled {}
  }

  Future _startSecondStepAnimation() async {
    try {
      await _secondStepController.forward().orCancel;
    } on TickerCanceled {}
  }

  Future _startThirdStepAnimation() async {
    try {
      await _thirdStepController.forward().orCancel;
    } on TickerCanceled {}
  }

  Future _startFourStepAnimation() async {
    try {
      await _fourStepController.forward().orCancel;
    } on TickerCanceled {}
  }

  @override
  Widget build(BuildContext context) {
 //   final ui.Size logicalSize = MediaQuery.of(context).size;
   // final double _width = logicalSize.width;

    // TODO: implement build
    return Scaffold(
      backgroundColor:  Color.fromRGBO(38 , 47 , 62, 1),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height:  MediaQuery.of(context).size.height,
         padding: EdgeInsets.all(16.0),
          child: _animateController.isCompleted
              ? getPages(MediaQuery.of(context).size.width)
              : AnimationBox(
                  controller: _animateController,
                  screenWidth: MediaQuery.of(context).size.width,
                  onStartAnimation: () {
                    _startAnimation();
                  },
                ),
        ),
      ),
      bottomNavigationBar: _animateController.isCompleted
          ? BottomAppBar(
              child: Container(

              decoration: BoxDecoration(
                  color: Color.fromRGBO(38, 47, 62, 1),
                  boxShadow: [BoxShadow(color: Colors.grey.withAlpha(200))]),
              height: 50.0,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    curIndex += 1;
                    if (curIndex == 1) {
                      _startSecondStepAnimation();
                    } else if (curIndex == 2) {
                      _startThirdStepAnimation();
                    } else if (curIndex == 3) {
                      _startFourStepAnimation();
                    }
                  });
                },
                child: Center(
                    child: Text(
                  curIndex < 3 ? 'Continue' : 'Finish',
                  style: TextStyle(fontSize: 20.0, color: Colors.blue[600],backgroundColor:Colors.transparent ),
                )),
              ),
            ))
          : null,
    );
  }

  Widget getPages(double _width) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
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
                  color: index <= curIndex ? Colors.blue[600] : Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(2.0)),
                ),
               height: 10.0,
                width: (_width - 32.0 - 15.0) / 4.0,
                margin: EdgeInsets.only(left: index == 0 ? 0.0 : 5.0),
              );
            }),
          ),
        ),
        curIndex == 0
            ? _getFirstStep()
            : curIndex == 1
                ? _getSecondStep()
                : curIndex == 2 ? _getThirdStep() : _getFourStep(),
      ],
    );
  }

  Widget _getFirstStep() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 34.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text('Question 1',style: TextStyle(color:Colors.white),),
            Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Text('The overall experince of your tour was?',style: TextStyle(color:Colors.white),)),
            Container(
              margin: EdgeInsets.symmetric(vertical: 50.0),
              child: Text(
                overallStatus,
                style: TextStyle(
                    color: Colors.blue[600],
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Center(
                child: Slider(
                  value: overall,
                  onChanged: (value) {
                    setState(() {
                      if(answers1.isEmpty){
                      overall = value.round().toDouble();
                      _getOverallStatus(overall);
                       print(answers1);
                       print(answerfinal);
                       }
                      else{
                        answers1.removeLast();
                        answerfinal.removeLast();
                         overall = value.round().toDouble();
                      _getOverallStatus(overall);
                       print(answers1);
                       print(answerfinal);
                      }
                    
                    });
                  },
                  label: '${overall.toInt()}',
                  divisions: 30,
                  min: 1.0,
                  max: 5.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _getSecondStep() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 34.0),
        child: Transform(
          transform: new Matrix4.translationValues(
              0.0, 50.0 * (1.0 - secondTranformAnimation.value), 0.0),
          child: Opacity(
            opacity: secondTranformAnimation.value,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text('Question 2',style: TextStyle(color:Colors.white),),
                Container(
                    margin: EdgeInsets.only(top: 16.0),
                    child: Text('Which tour did you enjoy the most?',style: TextStyle(color:Colors.white),)),
                Expanded(
                  child: Center(
                    
                    child: Container(
                      color: Color.fromRGBO(38, 47, 62, 1),
                      height: 258.0,
                      child: Card(color: Color.fromRGBO(38, 47, 62, 1),
                        child: Column(
                          children: List.generate(usingCollection.length,
                              (int index) {
                            final using = usingCollection[index];
                            return GestureDetector(
                              
                              onTapUp: (detail) {
                                if(answers2.isEmpty){
                                setState(() {
                                  usingTimes = using.identifier;
                                   answers2.add(using.identifier);
                                   answerfinal.add(using.identifier);
                                      print(answers2);
                                       print(answerfinal);
                                
                                });}
                                else{
                                answers2.removeLast();
                                answerfinal.removeLast();
                                   setState(() {
                                  usingTimes = using.identifier;
                                    answers2.add(using.identifier);
                                     answerfinal.add(using.identifier);
                                      print(answerfinal);
                                      print(answers2);
                                
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
                                      height: index < usingCollection.length
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
        ),
      ),
    );
    
  }
 _pressed(){
  
    setState(() {   
      liked=!liked;
          
    });

  }


  Widget _getThirdStep() {
        return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 34.0),
        child: Transform(
          transform: new Matrix4.translationValues(
              0.0, 50.0 * (1.0 - thirdTranformAnimation.value), 0.0),
          child: Opacity(
            opacity: thirdTranformAnimation.value,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text('Question 3',style: TextStyle(color:Colors.white),),
                Container(
                    margin: EdgeInsets.only(top: 16.0),
                    child: Text('How would you rate your experince?',style: TextStyle(color:Colors.white),)),
                Expanded(
                  child: Center(
                    
                    child: Container(
                      color: Color.fromRGBO(38, 47, 62, 1),
                      height: 258.0,
                      child: Card(color: Color.fromRGBO(38, 47, 62, 1),
                        child: Column(
                          children: List.generate(collection.length,
                              (int index) {
                            final usingg = collection[index];
                            return GestureDetector(
                              
                              onTapUp: (detail) {
                                if(answers33.isEmpty){
                                      setState(() {
                           using = usingg.identifier;
                           liked=!liked;
                           answers33.add(usingg.identifier);
                           answerfinal.add(usingg.identifier);
                           //answers3.add(usingg.displayContent);
                           print(answers33);
                           print(answerfinal);
                          
                                });
                                }
                                else{
                                answers33.removeLast();
                                  setState(() {
                           using = usingg.identifier;
                           liked=!liked;
                           answers33.add(usingg.identifier);
                           answerfinal.add(usingg.identifier);
                           //answers3.add(usingg.displayContent);
                           print(answers33);
                          print(answerfinal);
                          
                                });

                                }
                              },
                              child: Container(
                            //  color:  Color.fromRGBO(38, 47, 62, 1),
                                height: 50.0,
                                color: using == usingg.identifier
                                    ? Colors.blue[600].withAlpha(100)
                                    : Color.fromRGBO(38, 47, 62, 1),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Radio(
                                            activeColor: Colors.blue[600],
                                            value: usingg.identifier,
                                            groupValue: usingTimes,
                                            onChanged: (String value) {
                                              print(value);
                                              setState(() {
                                                print("HIII");
                                                using = value;
                                                print(value);
                                              });
                                            }),
                                        Text(usingg.displayContent,style: TextStyle(color: Colors.white),)
                                        
                                      ],
                                      
                                    ),
                                    Divider(
                                      height: index < collection.length
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
        ),
      ),
    );
  }

  Widget _getFourStep() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 34.0),
        child: Transform(
          transform: new Matrix4.translationValues(
              0.0, 50.0 * (1.0 - fourTranformAnimation.value), 0.0),
          child: Opacity(
            opacity: fourTranformAnimation.value,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text('Question 4',style: TextStyle(color:Colors.white),),
                Container(
                    margin: EdgeInsets.only(top: 16.0),
                    child: Text(
                        'When you need help or has concerns related with our product, how satisfied are you with our customer support\'s performance?',style: TextStyle(color:Colors.white))),
                Expanded(
                  child: Center(
                    child: Container(
                      height: 213.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            height: 150.0,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    GestureDetector(
//                              onTapU
//                        onLongPress: () {
//                          _startLongPressAnimation();
//                          },
//                                onTapUp: (detail) {
//                          print(detail);
//                         _longPressController.reset();
//                      },
                                      onTapUp: (detail) {
                                         answers4.add('Unhappy');
                                            answerfinal.add('Unhappy');
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        LastPage(
                                                          statusType: 'Unhappy',
                                                           finalstring: answerfinal,
                                                        )));
                                      },
                                      child: Transform.scale(
                                          scale: longPressAnimation.value,
                                          child: Hero(
                                            tag: 'Unhappy',
                                            child: Image.asset(
                                              'images_and_icons/angry.gif',
                                              width: 50.0,
                                              height: 50.0,
                                            ),
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text('Unhappy',style: TextStyle(color:Colors.white)),
                                    )
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    GestureDetector(
//                              onTapU
//                        onLongPress: () {
//                          _startLongPressAnimation();
//                          },
//                                onTapUp: (detail) {
//                          print(detail);
//                         _longPressController.reset();
//                      },
                                      onTapUp: (detail) {
                                         answers4.add('Neutral');
                                         answerfinal.add('Neutral');
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        LastPage(
                                                          statusType: 'Neutral', finalstring: answerfinal,
                                                        )));
                                      },
                                      child: Hero(
                                        tag: 'Neutral',
                                        child: Transform.scale(
                                            scale: longPressAnimation.value,
                                            child: Image.asset(
                                              'images_and_icons/mmm.gif',
                                              width: 50.0,
                                              height: 50.0,
                                            )),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text('Neutral',style: TextStyle(color:Colors.white)),
                                    )
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    GestureDetector(
//                              onTapU
//                        onLongPress: () {
//                          _startLongPressAnimation();
//                          },
//                                onTapUp: (detail) {
//                          print(detail);
//                         _longPressController.reset();
//                      },
                                      onTapUp: (detail) {
                                           answers4.add('Satisfied');
                                           answerfinal.add('Satisfied');
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        LastPage(
                                                          statusType:
                                                              'Satisfied',
                                                              finalstring: answerfinal,
                                                        )));
                                      },
                                      child: Transform.scale(
                                          scale: longPressAnimation.value,
                                          child: Hero(
                                            tag: 'Satisfied',
                                            child: Image.asset(
                                              'images_and_icons/hearteyes.gif',
                                              width: 50.0,
                                              height: 50.0,
                                            ),
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text('Satisfied',style: TextStyle(color:Colors.white)),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _getOverallStatus(double overall) {
    switch (overall.toInt()) {
      case 1:
        overallStatus = 'Bad';
        //print(Text("Bad"));
        answers1.add("Bad");
         answerfinal.add("Bad");
        break;
      case 2:
        overallStatus = 'Normal';
        answers1.add("Normal");
         answerfinal.add("Normal");
        break;
      case 3:
        overallStatus = 'Good';
         answers1.add("Good");
          answerfinal.add("Good");
        break;
      case 4:
        overallStatus = 'Very Good';
        //print(Text("Very Good"));
          answers1.add("Very Good");
           answerfinal.add("Very Good");
        break;
      default:
        overallStatus = 'Excellent';
       
       answers1.add("Excellent");
       answerfinal.add("Excellent");
      // print(answers[5]);
        break;
    }
  }
}

class AnimationBox extends StatelessWidget {
  AnimationBox(
      {Key key, this.controller, this.screenWidth, this.onStartAnimation})
      : width = Tween<double>(
          begin: screenWidth,
          end: 40.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.1,
              0.3,
              curve: Curves.fastOutSlowIn,
            ),
          ),
        ),
        alignment = Tween<AlignmentDirectional>(
          begin: AlignmentDirectional.bottomCenter,
          end: AlignmentDirectional.topStart,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.3,
              0.6,
              curve: Curves.fastOutSlowIn,
            ),
          ),
        ),
        radius = BorderRadiusTween(
          begin: BorderRadius.circular(20.0),
          end: BorderRadius.circular(2.0),
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.6,
              0.8,
              curve: Curves.ease,
            ),
          ),
        ),
        height = Tween<double>(
          begin: 40.0,
          end: 0.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.3,
              0.8,
              curve: Curves.ease,
            ),
          ),
        ),
        movement = EdgeInsetsTween(
          begin: EdgeInsets.only(top: 0.0),
          end: EdgeInsets.only(top: 30.0),
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.3,
              0.6,
              curve: Curves.fastOutSlowIn,
            ),
          ),
        ),
        scale = Tween<double>(
          begin: 1.0,
          end: 0.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.8,
              1.0,
              curve: Curves.fastOutSlowIn,
            ),
          ),
        ),
        opacity = Tween<double>(
          begin: 1.0,
          end: 0.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.8,
              1.0,
              curve: Curves.fastOutSlowIn,
            ),
          ),
        ),
        numberOfStep = IntTween(
          begin: 1,
          end: 4,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.8,
              1.0,
              curve: Curves.fastOutSlowIn,
            ),
          ),
        ),
        super(key: key);

  final VoidCallback onStartAnimation;
  final Animation<double> controller;
  final Animation<double> width;
  final Animation<double> height;
  final Animation<AlignmentDirectional> alignment;
  final Animation<BorderRadius> radius;
  final Animation<EdgeInsets> movement;
  final Animation<double> opacity;
  final Animation<double> scale;
  final Animation<int> numberOfStep;
  final double screenWidth;
  final double overral = 3.0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child) {
        return Stack(
          alignment: alignment.value,
          children: <Widget>[
            // Container(child:Image.asset("images_and_icons/gawlah.png",height: double.infinity,width: double.infinity,),
            // height: MediaQuery.of(context).size.height , width: MediaQuery.of(context).size.width,
            

            // ),
              
            Opacity(
              opacity: 1.0 - opacity.value,
              child: Column(
                children: <Widget>[
                  Container(
      //    color: Colors.blue,
                    margin: EdgeInsets.only(top: 30.0),
                    height: 10.0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(numberOfStep.value, (int index) {
                        return Container(
                          decoration: BoxDecoration(
//                    color: Colors.orangeAccent,
                            color:
                                index == 0 ? Colors.blue[600] : Colors.grey,
                            borderRadius:
                                BorderRadius.all(Radius.circular(2.0)),
                          ),
                          height: 10.0,
                          width: (screenWidth - 15.0) / 5.0,
                          margin: EdgeInsets.only(left: index == 0 ? 0.0 : 5.0),
                        );
                      }),
                    ),
                  ),
                  Expanded(
                    child: Container(
//                color: Colors.blue,
                      margin: EdgeInsets.only(top: 34.0),
//                height: 10.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text('Question 1'),
                          Container(
                              margin: EdgeInsets.only(top: 16.0),
                              child: Text(
                                  'Overall, how would you rate our service?')),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 50.0),
                            child: Text(
                              'Good',
                              style: TextStyle(
                                  color: Colors.blue[600],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30.0),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Opacity(
              opacity:
                  controller.status == AnimationStatus.dismissed ? 1.0 : 0.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
               Center(
                 child: Shimmer.fromColors(
                  period: Duration(milliseconds: 1500),
                  baseColor: Colors.blue[600],
              //Color.fromRGBO(38, 47, 62, 1),
              highlightColor:Colors.blue[900],
                                      
                          child: Center(
                              child: ClipRRect( borderRadius: BorderRadius.circular(0),
                                child:
                              Image.asset("images_and_icons/g_transparent.png",

                              
                      )))
                   ),
               ),
               VSpacer(0.2),
                  Text(
                    'Your opinion in 3 minutes.',
                    style: TextStyle(
                        color: Colors.blue[600],
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 120.0),
                    child: Text(
                      'By answering this 3 minutes survey, you help us improve our service event better for you',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Opacity(
              opacity: opacity.value,
              child: GestureDetector(
                onTap: onStartAnimation,
                child: Transform.scale(
                  scale: scale.value,
                  child: Container(
                    margin: movement.value,
                    width: width.value,
                    child: GestureDetector(
                      child: Container(
                        height: height.value,
                        decoration: BoxDecoration(
                            color: Colors.blue[600],
                            borderRadius: radius.value),
                        child: Center(
                          child: controller.status == AnimationStatus.dismissed
                              ? Text(
                                  'Take the survey',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.0),
                                )
                              : null,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
//            Opacity(
//              opacity: 1.0 - opacity.value,
//              child:
//            ),
              ],
        );
      },
    );
    
  }
  
}

class SecondQuestion {
  final String identifier;
  final String displayContent;

  SecondQuestion(this.identifier, this.displayContent);
}

class ThirdQuestion {
final String displayContent;
 final String identifier;

  ThirdQuestion(this.identifier, this.displayContent);
}