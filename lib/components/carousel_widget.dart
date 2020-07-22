import 'package:flutter/material.dart';
import 'package:tock_flutter_kit/components/card_widget.dart';

class CarouselWidget extends StatelessWidget {
  final double height;

  const CarouselWidget({Key key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height ?? 175,
      child: ListView.builder(
        itemBuilder: (_, index) => CardWidget(),
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        cacheExtent: 10,
      ),
    );
  }
}
