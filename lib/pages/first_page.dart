import 'dart:math';

import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  final Function setSize;
  final int size;
  final Function setShowFirstPage;

  FirstPage(
      {Key? key,
      required this.setSize,
      required this.size,
      required this.setShowFirstPage})
      : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final Random random = Random();

  // TODO: make image circular
  // TODO: add border color if size is +- equal to 500 - size (in between 240 and 260)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("First Page"),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                widget.setSize(widget.size + random.nextInt(20) + 10);
              }),
          FloatingActionButton(
              child: const Icon(Icons.remove),
              onPressed: () {
                widget.setSize(widget.size - (random.nextInt(20) + 10));
              }),
        ],
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            widget.setShowFirstPage();
          },
          child: Container(
              height: widget.size.toDouble(),
              width: widget.size.toDouble(),
              decoration: BoxDecoration(
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: const AssetImage("img.jpg"),
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
