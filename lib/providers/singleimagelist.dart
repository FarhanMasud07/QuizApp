import 'package:flutter/material.dart';

class ImageList with ChangeNotifier {
  final String id;
  final String name;
  final ImageProvider imageList;
  final String description;
  final List<String> chapters;

  ImageList({
    @required this.id,
    @required this.imageList,
    @required this.name,
    @required this.description,
    @required this.chapters,
  });
}
