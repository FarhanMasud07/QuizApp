import 'package:flutter/material.dart';
import 'package:nikeapp/providers/imagelist.dart';
import 'package:nikeapp/widget/detailsProduct.dart';
import 'package:provider/provider.dart';

class DetailsChapterScreen extends StatelessWidget {
  static const routeName = '/chapter-route';
  @override
  Widget build(BuildContext context) {
    final chaptersId = ModalRoute.of(context).settings.arguments as dynamic;
    final chapters =
        Provider.of<AllImageWithInformation>(context ,listen: false).findById(chaptersId);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text(
          chapters.name,
        ),
        backgroundColor: Colors.teal,
      ),
      body: GridView.builder(
        itemCount: chapters.chapters.length,
        itemBuilder: (ctx, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: GridTile(
              // footer: GridTileBar(
              //   backgroundColor: Colors.black87,
              // title: Text(
              //   chapters.chapters[index],
              //   textAlign: TextAlign.center,
              //   style: TextStyle(
              //     color: Colors.white,
              //   ),
              //   ),
              // ),
              footer: Container(
                height: 5,
                color: Colors.amber,
              ),
              child: GestureDetector(
                child: Container(
                  child: Center(
                    child: Text(
                      chapters.chapters[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.teal,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => DetailsProductWidget(
                        chapters.chapters[index],chapters.name
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}
