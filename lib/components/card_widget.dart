import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<Widget> buttons;
  final String image;
  final double height;
  final double buttonsHeight;

  const CardWidget(
      {Key key,
      @required this.title,
      this.subtitle,
      this.buttons,
      this.image,
      this.height,
      this.buttonsHeight})
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
              image != null
                  ? Container(
                      child: Image.network(image),
                    )
                  : Container(),
              ListTile(
                title: Text(title),
                subtitle: Text(subtitle ?? ""),
              ),
              buttons != null
                  ? Container(
                      width: MediaQuery.of(context).size.width,
                      height: buttonsHeight,
                      child: ListView.builder(
                        padding: EdgeInsets.all(5),
                        itemBuilder: (_, index) => Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: buttons.elementAt(index),
                        ),
                        itemCount: buttons.length,
                        scrollDirection: Axis.vertical,
                      ),
                    )
                  : Container()
            ],
          )),
    );
  }
}
