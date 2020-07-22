import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tock_flutter_kit/tock_chat.dart';

class Bubble extends StatelessWidget {
  final String text;
  final UserTypes name;
  final Color backgroundBubbleColor;
  final Color borderBubbleColor;
  final Color textBubbleColor;

  const Bubble(
      {Key key,
      @required this.text,
      @required this.name,
      this.backgroundBubbleColor,
      this.borderBubbleColor,
      this.textBubbleColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color textColor = textBubbleColor == null ? Colors.white : textBubbleColor;
    return Container(
        width: 20,
        child: Text(
          text,
          style:
              Theme.of(context).textTheme.headline4.copyWith(color: textColor),
          textAlign: isUserMessage(name) ? TextAlign.right : TextAlign.left,
        ),
        height: 60,
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        decoration: isUserMessage(name)
            ? getUserMessageDecoration()
            : getBotMessageDecoration());
  }

  BoxDecoration getUserMessageDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      border: Border.all(
          color: borderBubbleColor == null ? Colors.black : borderBubbleColor),
      color:
          backgroundBubbleColor == null ? Colors.grey : backgroundBubbleColor,
    );
  }

  BoxDecoration getBotMessageDecoration() {
    return BoxDecoration(
        border: Border.all(color: Colors.transparent),
        color: Colors.transparent);
  }

  bool isUserMessage(UserTypes type) {
    return type == UserTypes.BOT;
  }
}
