import 'dart:math';

import 'package:exam/pages/second_page.dart';
import 'package:flutter/material.dart';
import 'first_page.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int sizeOfImage = Random().nextInt(200) + 100;
  bool showFirstPage = true;

  void setSizeOfImage(int size){
    setState(() {
      if (size <= 800 && size >=100){
        sizeOfImage = size;
      }
    });
  }

  void switchToAnotherPage() {
    setState(() {
      showFirstPage = !showFirstPage;
    });
  }


  @override
  Widget build(BuildContext context) {

    return Container(
      child: showFirstPage ? FirstPage(setShowFirstPage: switchToAnotherPage, size: sizeOfImage, setSize: setSizeOfImage,): SecondPage(setShowFirstPage: switchToAnotherPage, size: sizeOfImage, setSize: setSizeOfImage,)
    );
  }
}
