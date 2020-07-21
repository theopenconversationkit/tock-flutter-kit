import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatTextField extends StatelessWidget {
  final String placeHolderText;
  final Color backgroundColor;
  final Color deeperColor;
  static final double height = 75;

  const ChatTextField(
      {Key key, this.placeHolderText, this.backgroundColor, this.deeperColor});

  @override
  Widget build(BuildContext context) {
    Color deepColor = this.deeperColor ?? Colors.black;
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.grey,
      ),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5.0),
                  margin: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: TextFormField(
                    cursorColor: deepColor,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: deepColor, width: 0.5)),
                        border: OutlineInputBorder(),
                        hintText: this.placeHolderText),
                  ))),
          IconButton(
            color: deepColor,
            iconSize: 45,
            icon: Icon(Icons.send),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
