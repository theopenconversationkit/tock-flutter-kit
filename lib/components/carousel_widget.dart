import 'package:flutter/material.dart';

class CarouselWidget extends StatelessWidget {
  final List<Widget> cards;
  final double height;

  const CarouselWidget({Key key, @required this.cards, @required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      child: ListView.builder(
        itemBuilder: (_, index) => cards.elementAt(index),
        itemCount: cards.length,
        scrollDirection: Axis.horizontal,
        cacheExtent: 10,
      ),
    );
  }
}
