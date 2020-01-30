import 'package:flutter/cupertino.dart';
import '../providers/singleimagelist.dart';

class AllImageWithInformation with ChangeNotifier {
  List<ImageList> _imageListDetailsInformation = [
    ImageList(
      id: 't1',
      name: 'ICT',
      imageList: AssetImage('assets/images/ict.png'),
      description:
          "প্রতিটি অধ্যায়ের 10 টি এমসিকিউ থাকবে 5 নম্বর বহনকারী । আইসিটি হ'ল তথ্য যোগাযোগ প্রযুক্তির সংক্ষিপ্ত রূপ!!",
      chapters: ['1st Chapter', '2nd Chapter', '3rd Chapter', '4th Chapter', '5th Chapter'],
    ),
    ImageList(
      id: 't2',
      name: 'Physics',
      imageList: AssetImage('assets/images/iphone-x.jpg'),
      description:
          "Java has always been one of the best choices for Enterprise World. If you think you have learn the Language...\nJust Test Yourself !!",
      chapters: ['1st Chapter', '2nd Chapter', '3rd Chapter', '4th Chapter', '5th Chapter'],
    ),
    ImageList(
      id: 't3',
      name: 'Chemestry',
      imageList: AssetImage('assets/images/oneplus7pro.png'),
      description:
          "Javascript is one of the most Popular programming language supporting the Web.\nIt has a wide range of Libraries making it Very Powerful !",
      chapters: ['1st Chapter', '2nd Chapter', '3rd Chapter', '4th Chapter', '5th Chapter'],
    ),
    ImageList(
      id: 't4',
      name: 'Math',
      imageList: AssetImage('assets/images/ict.png'),
      description:
          "C++, being a statically typed programming language is very powerful and Fast.\nit's DMA feature makes it more useful. !",
      chapters: ['1st Chapter', '2nd Chapter', '3rd Chapter', '4th Chapter', '5th Chapter'],
    ),
  ];

  List<ImageList> get imageListDetailsInformation {
    return [..._imageListDetailsInformation];
  }

  ImageList findById(String id) {
    return _imageListDetailsInformation.firstWhere((prod) => prod.id == id);
  }
}
