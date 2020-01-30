import 'package:flutter/material.dart';
import 'package:nikeapp/screens/detailsChapterScreen.dart';
import './providers/imagelist.dart';
import 'package:provider/provider.dart';

import './widget/Homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: AllImageWithInformation(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme:  ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
        routes: {
          DetailsChapterScreen.routeName: (ctx) => DetailsChapterScreen(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
