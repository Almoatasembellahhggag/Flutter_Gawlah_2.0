import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

import 'Tours/Tours_Pager.dart';

var finalScore = 0;
var questionNumber = 0;
var quiz = new AnimalQuiz();

class AnimalQuiz {
  var images = [
    "muezstreet",
    "white",
    "white",
  ];

  var questions = [
    "What is the name of this street _________.",

    "_________ is the year where Mosque of mou'yad was built",
    "Best Isalmic patterns are found at _________.",
    // "A nocturnal animal with some really big eyes",
  ];

  var choices = [
    ["Tharir Street", "Manial Street", "Muez Street"],
    ["1421", "1349", "1531"],
    ["ElAqmar mosque", "Eza", "Mosque mou'yad"],
    //  ["Spider", "Snake", "Hawk", "Owl"]
  ];

  var correctAnswers = ["Muez Street", "1421", "ElAqmar mosque"];
}

class Quiz1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new Quiz1State();
  }
}

class Quiz1State extends State<Quiz1> {
  var _color = Colors.blueGrey;
  bool changeButtonColor;
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          backgroundColor: Color.fromRGBO(38, 47, 62, 1),
          body: new Container(
            margin: const EdgeInsets.all(10.0),
            alignment: Alignment.topCenter,
            child: new Column(
              children: <Widget>[
                new Padding(padding: EdgeInsets.all(20.0)),

                new Container(
                  alignment: Alignment.centerRight,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Text(
                        "Question ${questionNumber + 1} of ${quiz.questions.length}",
                        style:
                            new TextStyle(fontSize: 22.0, color: Colors.white),
                      ),
                      new Text(
                        "Score: $finalScore",
                        style:
                            new TextStyle(fontSize: 22.0, color: Colors.white),
                      )
                    ],
                  ),
                ),

                //image
                new Padding(padding: EdgeInsets.all(5.0)),

                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.5,
                  child: new Image.asset(
                      "images_and_icons/${quiz.images[questionNumber]}.jpg",
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 3),
                ),

                new Padding(padding: EdgeInsets.all(5.0)),

                new Text(
                  quiz.questions[questionNumber],
                  style: new TextStyle(fontSize: 20.0, color: Colors.white),
                ),

                new Padding(padding: EdgeInsets.all(10.0)),

                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    //button 1
                    new MaterialButton(
                      minWidth: 120.0,
                      color: _color,
                      onPressed: () {
                        if (quiz.choices[questionNumber][0] ==
                            quiz.correctAnswers[questionNumber]) {
                          debugPrint("Correct");
                          finalScore++;

                          setState(() {
                            changeButtonColor = !changeButtonColor;
                          });
                         // updatecolor();
                        } else {
                          debugPrint("Wrong");
                        }
                        updateQuestion();
                      },
                      child: new Text(
                        quiz.choices[questionNumber][0],
                        style:
                            new TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                    ),

                    //button 2
                    new MaterialButton(
                      minWidth: 120.0,
                      color: Colors.blueGrey,
                      onPressed: () {
                        if (quiz.choices[questionNumber][1] ==
                            quiz.correctAnswers[questionNumber]) {
                          debugPrint("Correct");
                          finalScore++;
                        } else {
                          debugPrint("Wrong");
                        }
                        updateQuestion();
                      },
                      child: new Text(
                        quiz.choices[questionNumber][1],
                        style:
                            new TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                    ),
                  ],
                ),

                new Padding(padding: EdgeInsets.all(10.0)),

                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    //button 3
                    new MaterialButton(
                      minWidth: 120.0,
                      color: Colors.blueGrey,
                      onPressed: () {
                        if (quiz.choices[questionNumber][2] ==
                            quiz.correctAnswers[questionNumber]) {
                          debugPrint("Correct");
                          finalScore++;
                        } else {
                          debugPrint("Wrong");
                        }
                        updateQuestion();
                      },
                      child: new Text(
                        quiz.choices[questionNumber][2],
                        style:
                            new TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                    ),

                    //button 4
                    // new MaterialButton(
                    //   minWidth: 120.0,
                    //   color: Colors.blueGrey,
                    //   onPressed: (){

                    //     if(quiz.choices[questionNumber][3] == quiz.correctAnswers[questionNumber]){
                    //       debugPrint("Correct");
                    //       finalScore++;
                    //     }else{
                    //       debugPrint("Wrong");
                    //     }
                    //     updateQuestion();
                    //   },
                    //   child: new Text(quiz.choices[questionNumber][3],
                    //     style: new TextStyle(
                    //         fontSize: 20.0,
                    //         color: Colors.white
                    //     ),),
                    // ),
                  ],
                ),

                new Padding(padding: EdgeInsets.all(15.0)),

                new Container(
                    alignment: Alignment.bottomCenter,
                    child: new MaterialButton(
                        minWidth: 240.0,
                        height: 30.0,
                        color: Colors.red,
                        onPressed: resetQuiz,
                        child: new Text(
                          "Quit",
                          style: new TextStyle(
                              fontSize: 18.0, color: Colors.white),
                        ))),
              ],
            ),
          ),
        ));
  }

  void resetQuiz() {
    setState(() {
      Navigator.pop(context);
      finalScore = 0;
      questionNumber = 0;
    });
  }

  void updateQuestion() {
    setState(() {
      if (questionNumber == quiz.questions.length - 1) {
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => new Summary(
                      score: finalScore,
                    )));
      } else {
        questionNumber++;
      }
    });
  }

  
}

class Summary extends StatelessWidget {
  final int score;
  Summary({Key key, @required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(38, 47, 62, 1),
        body: new Container(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                "Final Score: $score",
                style: new TextStyle(fontSize: 35.0, color: Colors.white),
              ),
              x(),
              new Padding(padding: EdgeInsets.all(30.0)),
              new MaterialButton(
                color: Colors.red,
                onPressed: () {
                  questionNumber = 0;
                  finalScore = 0;
                  Navigator.pop(context);
                },
                child: new Text(
                  "Reset Quiz",
                  style: new TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
              new Container(
                  alignment: Alignment.bottomCenter,
                  child: new MaterialButton(
                      minWidth: 240.0,
                      height: 30.0,
                      color: Colors.red,
                      onPressed: () {
                        questionNumber = 0;
                        finalScore = 0;
                         Navigator.push(
                             context,
                             MaterialPageRoute(
                                builder: (context) => TourList2()));
                        
                      },
                      child: new Text(
                        "Quit",
                        style:
                            new TextStyle(fontSize: 18.0, color: Colors.white),
                      ))),
            ],
          ),
        ),
      ),
    );
  }

  x() {
    if (score == 0) {
      return Text(
        "Please Try Again",
        style: TextStyle(color: Colors.white),
      );
    }
    if (score == 1) {
      return Text(
        "You Can Do Better Next Time:D",
        style: TextStyle(color: Colors.white),
      );
    }
    if (score == 2) {
      return Text(
        "You are know a Sliver User",
        style: TextStyle(color: Colors.white),
      );
    }
    if (score == 3)
      return Text(
        "WOOOW!!!!!!!You are know a GOLD User",
        style: TextStyle(color: Colors.white),
      );
  }
}

class AnimalQuizz extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new AnimalQuizState();
  }
}

class AnimalQuizState extends State<AnimalQuizz> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        //   backgroundColor: Color.fromRGBO(38, 47, 62, 1),
        body: Center(
            child: Stack(children: <Widget>[
      _buildbackground(),
      Container(
        margin: const EdgeInsets.all(15.0),
        child: Stack(children: <Widget>[
          Center(
            child: Container(
              height: 400,
              width: MediaQuery.of(context).size.width,
              child: Text(
                  "To make sure you benefit the most from your GAWLAH we will ask you some quetsions related to your tour",
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
          ),
          new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              new MaterialButton(
                  height: 50.0,
                  color: Colors.green,
                  onPressed: startQuiz,
                  child: new Text(
                    "Lets Play",
                    style: new TextStyle(fontSize: 18.0, color: Colors.white),
                  ))
            ],
          ),
        ]),
      )
    ])));
  }

  void startQuiz() {
    setState(() {
      Navigator.push(
          context, new MaterialPageRoute(builder: (context) => new Quiz1()));
    });
  }

  _buildbackground() {
    return Stack(children: <Widget>[
      Container(
        color: Color.fromRGBO(38, 47, 62, 1),
      ),
      Container(
          child: Stack(children: <Widget>[
        ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(
              color: Colors.black38.withOpacity(0.4),
            ),
          ),
        ),
      ])),
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Shimmer.fromColors(
            period: Duration(milliseconds: 1500),
            baseColor: Colors.blue[400],
            highlightColor: Colors.blue[100],
            child: Image.asset(
              'images_and_icons/g_transparent.png',
              height: 80,
            ),
          ),
          Container(
            height: 575,
          ),
        ],
      ),
    ]);
  }
}
