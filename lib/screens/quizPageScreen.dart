import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nikeapp/screens/resultPage.dart';

class QuizPageScreen extends StatefulWidget {
  var mydata;
  QuizPageScreen({Key key, @required this.mydata}) : super(key: key);
  @override
  _QuizPageScreenState createState() => _QuizPageScreenState(mydata);
}

class _QuizPageScreenState extends State<QuizPageScreen> {
  var mydata;
  _QuizPageScreenState(this.mydata);

  Color colortoshow = Colors.indigoAccent;
  Color right = Colors.green;
  Color wrong = Colors.red;
  Color nothing = Colors.indigoAccent;
  int marks = 0;
  int i = 1;
  // extra varibale to iterate
  //int j = 1;
  int timer = 40;
  String showtimer = "40";

  Map<String, Color> btncolor = {
    "a": Colors.indigoAccent,
    "b": Colors.indigoAccent,
    "c": Colors.indigoAccent,
    "d": Colors.indigoAccent,
  };

  bool canceltimer = false;

  //var random_array = [1, 6, 7, 2, 4, 10, 8, 3, 9, 5];

  // overriding the initstate function to start timer as this screen is created
  @override
  void initState() {
    starttimer();
    super.initState();
  }

  // overriding the setstate function to be called only if mounted
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  void starttimer() async {
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      setState(() {
        if (timer < 1) {
          t.cancel();
          nextquestion();
        } else if (canceltimer == true) {
          t.cancel();
        } else {
          timer = timer - 1;
        }
        showtimer = timer.toString();
      });
    });
  }

  void nextquestion() {
    colortoshow = nothing;
    canceltimer = false;
    timer = 30;
    setState(() {
      if (i < 10) {
        i++;
        //j++;
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => Resultpage(marks: marks),
        ));
      }
      btncolor["a"] = Colors.indigoAccent;
      btncolor["b"] = Colors.indigoAccent;
      btncolor["c"] = Colors.indigoAccent;
      btncolor["d"] = Colors.indigoAccent;
    });
    starttimer();
  }

  void checkanswer(String k) {
    // in the previous version this was
    // mydata[2]["1"] == mydata[1]["1"][k]
    // which i forgot to change
    // so nake sure that this is now corrected
    if (k == null) {
      colortoshow = nothing;
    } else if (mydata[2][i.toString()] == mydata[1][i.toString()][k]) {
      // just a print sattement to check the correct working
      // debugPrint(mydata[2][i.toString()] + " is equal to " + mydata[1][i.toString()][k]);
      marks = marks + 5;
      // changing the color variable to be green
      colortoshow = right;
    } else {
      // just a print sattement to check the correct working
      // debugPrint(mydata[2]["1"] + " is equal to " + mydata[1]["1"][k]);
      colortoshow = wrong;
    }
    setState(() {
      // applying the changed color to the particular button that was selected
      btncolor[k] = colortoshow;
      canceltimer = true;
    });

    // changed timer duration to 1 second
    Timer(Duration(seconds: 3), nextquestion);
  }

  Widget choicebutton(String k) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: MaterialButton(
        onPressed: () => checkanswer(k),
        child: Text(
          mydata[1][i.toString()][k],
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Alike",
            fontSize: 16.0,
          ),
          maxLines: 1,
        ),
        color: btncolor[k],
        splashColor: Colors.indigo[700],
        highlightColor: Colors.indigo[700],
        minWidth: 200.0,
        height: 45.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              "Quizstar",
            ),
            content: Text("You Can't Go Back At This Stage."),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Ok',
                ),
              )
            ],
          ),
        );
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 10),
            child: Text(
              showtimer,
              style: timer < 20 && timer > 10
                  ? TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Times New Roman',
                      color: Colors.amber,
                    )
                  : timer <= 10
                      ? TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Times New Roman',
                          color: Colors.red,
                        )
                      : TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Times New Roman',
                          color: Colors.black87,
                        ),
            ),
          ),
          actions: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 10),
              alignment: Alignment.center,
              child: Text(
                'Score: $marks out of ${mydata[0].length * 5}',

                //textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Times New Roman',
                  color: Colors.black87,
                ),
              ),
            )
          ],
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.all(15.0),
                //alignment: Alignment.bottomLeft,
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: Text(
                    mydata[0][i.toString()],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: "Quando",
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      choicebutton('a'),
                      choicebutton('b'),
                      choicebutton('c'),
                      choicebutton('d'),
                      colortoshow == nothing
                          ? Text(
                              'Provide Answer',
                              style: TextStyle(
                                fontFamily: 'Times New Roman',
                              ),
                            )
                          : colortoshow == wrong
                              ? Text(
                                  "Wrong. Correct Answer is ${mydata[2][i.toString()]}",
                                  style: TextStyle(
                                    //backgroundColor: Colors.red,
                                    color: Colors.red,
                                    fontSize: 18,
                                    fontFamily: 'Times New Roman',
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              : Text(
                                  "Correct Answer",
                                  style: TextStyle(
                                    //backgroundColor: Colors.green,
                                    color: Colors.green,
                                    fontSize: 20,
                                    fontFamily: 'Times New Roman',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
