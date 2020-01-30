import 'package:flutter/material.dart';
import 'package:nikeapp/screens/detailsChapterScreen.dart';
import '../widget/detailsProduct.dart';
import '../providers/singleimagelist.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  final String name;
  ProductItem(this.name);
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ImageList>(context, listen: false);
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 5.0,
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(
            DetailsChapterScreen.routeName,
            arguments: product.id,
            //     MaterialPageRoute(
            //   builder: (ctx) => DetailsChapterScreen(),
            // )
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25.0),
          child: Material(
            color: Color.fromRGBO(12, 106, 138, 6.0),
            elevation: 10.0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  // Where the linear gradient begins and ends
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  // Add one stop for each color. Stops should increase from 0 to 1
                  stops: [0.1, 0.5, 0.7],
                  colors: [
                    // Colors are easy thanks to Flutter's Colors class.
                    Colors.indigo,
                    Colors.transparent,
                    Colors.transparent,
                    //Colors.,
                  ],
                ),
              ),
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10.0,
                        ),
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(100.0),
                          child: Container(
                            // changing from 200 to 150 as to look better
                            height: 150.0,
                            width: 150.0,
                            child: ClipOval(
                              child: Image(
                                fit: BoxFit.cover,
                                image: product.imageList,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          product.name,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontFamily: "Quando",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          product.description,
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                              fontFamily: "Alike"),
                          maxLines: 5,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
