import 'package:flutter/material.dart';
import 'package:tock_flutter_kit/components/qr_button.dart';

class CardWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: Card(
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          color: Colors.orangeAccent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text("title"),
                subtitle: Text("subtitle"),
              ),
              ButtonBar(
                children: <Widget>[
                  QrButton(text: "button 01", onPressed: () {}),
                ],
              )
            ],
          )
      ),
    );
  }
}
