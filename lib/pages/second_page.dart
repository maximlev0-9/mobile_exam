import 'dart:math';

import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  final Function setSize;
  final int size;
  final Function setShowFirstPage;

  const SecondPage(
      {Key? key,
      required this.setSize,
      required this.size,
      required this.setShowFirstPage})
      : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Second Page"),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                widget.setSize(widget.size - (random.nextInt(20) + 10));
              }),
          FloatingActionButton(
              child: const Icon(Icons.remove),
              onPressed: () {
                widget.setSize(widget.size + (random.nextInt(20) + 10));
              }),
        ],
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            widget.setShowFirstPage();
          },
          child: Container(
              height: 600 - widget.size.toDouble(),
              width: 600 - widget.size.toDouble(),
              decoration: BoxDecoration(
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("img.jpg"),
                ),
                borderRadius: const BorderRadius.all(Radius.circular(1000.0)),
                border: widget.size >= 290 && widget.size <= 310
                    ? Border.all(
                        color: Colors.red,
                        width: 4,
                      )
                    : null,
              )),
        ),
      ),
    );
  }
}
