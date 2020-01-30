import 'package:flutter/material.dart';
import 'package:nikeapp/screens/quizPageScreen.dart';
import '../providers/imagelist.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

class DetailsProductWidget extends StatelessWidget {
  //static const routeName = '/Details-Product-Screen';
  final String chapter;
  final String name;
  DetailsProductWidget(this.chapter, this.name);
  String assettoload;

  List<String> chapters = [
    '1st Chapter',
    '2nd Chapter',
    '3rd Chapter',
    '4th Chapter',
    '5th Chapter',
  ];

  List<String> asset = [
    'assets/ICT/1stChapter/ICT1st.json',
    'assets/ICT/2ndChapter/ICT2nd.json',
    'assets/ICT/3rdChapter/ICT3rd.json',
    'assets/ICT/4thChapter/ICT4th.json',
    'assets/ICT/5thChapter/ICT5th.json',
  ];

  setAsset() {
    if (chapter == "1st Chapter" && name == "ICT") {
      assettoload = "assets/ICT/1stChapter/ICT1st.json";
    } else if (chapter == "2nd Chapter" && name == "ICT") {
      assettoload = "assets/ICT/2ndChapter/ICT2nd.json";
    } else if (chapter == "3rd Chapter" && name == "ICT") {
      assettoload = "assets/ICT/3rdChapter/ICT3rd.json";
    } else if (chapter == "4th Chapter" && name == "ICT") {
      assettoload = "assets/ICT/4thChapter/ICT4th.json";
    } else if (chapter == "5th Chapter" && name == "ICT") {
      assettoload = "assets/ICT/5thChapter/ICT5th.json";
    } // else if (chapter == "1st Chapter" && name == "Physics") {
    //   assettoload = "assets/ICT/2ndChapter/ICT2nd.json";
    // } else if (chapter == "2nd Chapter" && name == "Physics") {
    //   assettoload = "assets/ICT/3rdChapter/ICT3rd.json";
    // } else if (chapter == "3rd Chapter" && name == "Physics") {
    //   assettoload = "assets/ICT/4thChapter/ICT4th.json";
    // } else if (chapter == "4th Chapter" && name == "Physics") {
    //   assettoload = "assets/ICT/5thChapter/ICT5th.json";
    // } else if (chapter == "5th Chapter" && name == "Physics") {
    //   assettoload = "assets/ICT/2ndChapter/ICT2nd.json";
    // } else if (chapter == "1st Chapter" && name == "Chemistry") {
    //   assettoload = "assets/ICT/3rdChapter/ICT3rd.json";
    // } else if (chapter == "2nd Chapter" && name == "Chemistry") {
    //   assettoload = "assets/ICT/4thChapter/ICT4th.json";
    // } else if (chapter == "3rd Chapter" && name == "Chemistry") {
    //   assettoload = "assets/ICT/5thChapter/ICT5th.json";
    // } else if (chapter == "4th Chapter" && name == "Chemistry") {
    //   assettoload = "assets/ICT/2ndChapter/ICT2nd.json";
    // } else if (chapter == "5th Chapter" && name == "Chemistry") {
    //   assettoload = "assets/ICT/3rdChapter/ICT3rd.json";
    // } else if (chapter == "1st Chapter" && name == "Math") {
    //   assettoload = "assets/ICT/4thChapter/ICT4th.json";
    // } else if (chapter == "2nd Chapter" && name == "Math") {
    //   assettoload = "assets/ICT/5thChapter/ICT5th.json";
    // } else if (chapter == "3rd Chapter" && name == "Math") {
    //   assettoload = "assets/ICT/5thChapter/ICT5th.json";
    // } else if (chapter == "4th Chapter" && name == "Math") {
    //   assettoload = "assets/ICT/5thChapter/ICT5th.json";
    // } else if (chapter == "5th Chapter" && name == "Math") {
    //   assettoload = "assets/ICT/5thChapter/ICT5th.json";
    // }
    else {
      assettoload = ' ';
    }
  }

  @override
  Widget build(BuildContext context) {
    // final productId = ModalRoute.of(context).settings.arguments as dynamic;
    // final individualProductsDetails =
    //     Provider.of<AllImageWithInformation>(context).findById(productId);
    setAsset();
    return FutureBuilder(
      future:
          DefaultAssetBundle.of(context).loadString(assettoload, cache: true),
      builder: (ctx, snapshot) {
        List mydata = json.decode(snapshot.data.toString());
        print(mydata);
        if (mydata == null) {
          return Scaffold(
            body: Center(
              child: Text(
                "Loading",
              ),
            ),
          );
        } else {
          return QuizPageScreen(mydata: mydata);
        }
      },
    );
  }
}
