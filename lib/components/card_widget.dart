import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<Widget> buttons;

  const CardWidget({Key key, @required this.title, this.subtitle, this.buttons})
      : super(key: key);

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
                title: Text(title),
                subtitle: Text(subtitle ?? ""),
              ),
              buttons != null
                  ? ButtonBar(
                      children: buttons,
                    )
                  : Container()
            ],
          )),
    );
  }
}
