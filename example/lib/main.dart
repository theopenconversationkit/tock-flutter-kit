import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:tock_flutter_kit/tock_flutter_kit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Container(
      child: Stack(
        children: <Widget>[
          Container(
            height: ChatTextField.displayHeight(context) - ChatTextField.height,
            color: Colors.deepOrange,
            child: ListView.builder(
              itemBuilder: (_, index) => Bubble(
                text: "coucou $index",
                index: index,
                backgroundBubbleColor: Colors.orangeAccent,
                borderBubbleColor: Colors.deepOrangeAccent,
                textBubbleColor: Colors.white,
              ),
              itemCount: 10,
              scrollDirection: Axis.vertical,
              cacheExtent: 10,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ChatTextField(
              backgroundColor: Colors.orangeAccent,
              deeperColor: Colors.deepOrangeAccent,
              placeHolderText: "Ecrivez votre message",
            ),
          )
        ],
      ),
    )));
  }
}
