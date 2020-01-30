import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../providers/imagelist.dart';
import '../screens/productItem.dart';
import 'package:provider/provider.dart';

class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<AllImageWithInformation>(context)
        .imageListDetailsInformation;
    return SingleChildScrollView(
      child: Container(
        height: 580,
        //width: double.infinity,
        child: CarouselSlider.builder(
          height: 390,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.easeInOut,
          pauseAutoPlayOnTouch: Duration(seconds: 10),
          enlargeCenterPage: true,
          itemCount: productsData.length,
          itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
            //builder: (ctx)=>products[i],
            value: productsData[i],
            child: ProductItem(productsData[i].name),
          ),
        ),
      ),
    );
  }
}
