import 'package:flutter/material.dart';
import '../widget/prductGrid.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(211, 204, 227, 1.0),
      
      // appBar: AppBar(
      //   title: Text(''),
      //   backgroundColor:  Color.fromRGBO(162, 228, 250, 1.0),
      //   elevation: 0,
      // ),
      body: ProductGrid(),
    );
  }
}
