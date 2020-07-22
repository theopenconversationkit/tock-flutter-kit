import 'package:flutter/material.dart';
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
      home: TockChat(),
    );
  }
}
