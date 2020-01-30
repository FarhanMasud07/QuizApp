import 'package:flutter/material.dart';
import '../widget/Homepage.dart';

class Resultpage extends StatefulWidget {
  int marks;
  Resultpage({Key key, @required this.marks}) : super(key: key);
  @override
  _ResultpageState createState() => _ResultpageState(marks);
}

class _ResultpageState extends State<Resultpage> {
  List<String> images = [
    "assets/images/Crown.jpg",
    "assets/images/work-hard-png-7.png",
    "assets/images/Bad.png",
  ];

  String message;
  String image;

  @override
  void initState() {
    if (marks < 20) {
      image = images[2];
      message = "You Should Try Hard..\n" + "Total Scored: $marks";
    } else if (marks < 35) {
      image = images[1];
      message = "You Can Do Better..\n" + "Total Scored: $marks";
    } else {
      image = images[0];
      message =
          "I think you will get Golden A+ :)..\n" + "Total Scored: $marks";
    }
    super.initState();
  }

  int marks;
  _ResultpageState(this.marks);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     "Result",
      //   ),
      //   centerTitle: true,
      //   backgroundColor: Colors.white,
      //   elevation: 0.0,
      // ),
      body: Container(
        margin: EdgeInsetsDirectional.only(top: 50),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 6,
              child: Material(
                elevation: 5.0,
                child: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Material(
                          child: Container(
                            width: 300.0,
                            height: 300.0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: ClipOval(
                                child: Image(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    image,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 5.0,
                              horizontal: 15.0,
                            ),
                            child: Center(
                              child: Text(
                                message,
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontFamily: "Quando",
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: FlatButton(
                      color: Colors.brown,
                      onPressed: () {
                        Navigator.of(context).pop();
                        /*pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        )*/
                      },
                      child: Text(
                        "Continue",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white70,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 25.0,
                      ),
                      //borderSide: BorderSide(width: 3.0, color: Colors.indigo),
                      splashColor: Colors.indigoAccent,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
