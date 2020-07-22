import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlButton extends StatelessWidget {
  final String text;
  final String url;

  UrlButton({
    Key key,
    @required this.text,
    @required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      onPressed: () async {
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          print('Could not launch $url');
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ),
    );
  }
}
