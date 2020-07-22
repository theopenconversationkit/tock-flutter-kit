import 'package:flutter/material.dart';
import 'package:tock_flutter_kit/components/bubble_widget.dart';
import 'package:tock_flutter_kit/components/card_widget.dart';
import 'package:tock_flutter_kit/components/carousel_widget.dart';
import 'package:tock_flutter_kit/components/postback_button.dart';
import 'package:tock_flutter_kit/components/qr_button.dart';
import 'package:tock_flutter_kit/components/url_button.dart';

enum MessagesTypes { CARD, CAROUSEL, WIDGET, TEXT }
enum ButtonsTypes { QUICK_REPLY, POSTBACK_BUTTON, URL_BUTTON, WIDGET }
enum UserTypes { USER, BOT }

class ButtonsUtil {
  static ButtonsTypes fromString(Map<String, dynamic> type) {
    if (type[ButtonsTypes.QUICK_REPLY.toText] != null) {
      return ButtonsTypes.QUICK_REPLY;
    } else if (type[ButtonsTypes.URL_BUTTON.toText] != null) {
      return ButtonsTypes.URL_BUTTON;
    } else if (type[ButtonsTypes.WIDGET.toText] != null) {
      return ButtonsTypes.WIDGET;
    } else {
      return ButtonsTypes.QUICK_REPLY;
    }
  }
}

extension MessagesTypesExtension on MessagesTypes {
  String get toText {
    switch (this) {
      case MessagesTypes.WIDGET:
        return 'widget';
      case MessagesTypes.CAROUSEL:
        return 'carousel';
      case MessagesTypes.CARD:
        return 'card';
      case MessagesTypes.TEXT:
        return 'text';
      default:
        return null;
    }
  }
}

extension ButtonsTypesExtension on ButtonsTypes {
  String get toText {
    switch (this) {
      case ButtonsTypes.WIDGET:
        return 'widget';
      case ButtonsTypes.URL_BUTTON:
        return 'web_url';
      case ButtonsTypes.POSTBACK_BUTTON:
        return 'postback_button';
      case ButtonsTypes.QUICK_REPLY:
        return 'quick_reply';
      default:
        return null;
    }
  }
}

class MessagesTypesUtil {
  static MessagesTypes fromString(Map<String, dynamic> type) {
    if (type[MessagesTypes.CARD.toText] != null) {
      return MessagesTypes.CARD;
    } else if (type[MessagesTypes.CAROUSEL.toText] != null) {
      return MessagesTypes.CAROUSEL;
    } else if (type[MessagesTypes.WIDGET.toText] != null) {
      return MessagesTypes.WIDGET;
    } else {
      return MessagesTypes.TEXT;
    }
  }
}

// TODO handle buttons in body with global config
class MessagesWidgetMapper {
  static Widget mapMessage(Message message,
      [Function(Message message) customWidget]) {
    switch (message.type) {
      case MessagesTypes.CARD:
        return CardWidget();
      case MessagesTypes.CAROUSEL:
        return CarouselWidget();
      case MessagesTypes.TEXT:
        return BubbleWidget(
          text: message.data[MessagesTypes.TEXT.toText],
          name: message.name,
          backgroundBubbleColor: Colors.orangeAccent,
          borderBubbleColor: Colors.deepOrangeAccent,
          textBubbleColor: Colors.white,
        );
      case MessagesTypes.WIDGET:
        return customWidget(message);
      default:
        return null;
    }
  }
}

class ButtonsWidgetMapper {
  static Widget mapButton(
      Button button, Function(String text, String payload) callTock,
      [Function(Button button) customButton]) {
    switch (button.type) {
      case ButtonsTypes.QUICK_REPLY:
        return QrButton(
          // TODO types in buttons enum
          text: button.data['title'],
          onPressed: () {
            callTock(button.data['title'], button.data['payload']);
          },
        );
      case ButtonsTypes.POSTBACK_BUTTON:
        return PostbackButton(
          text: button.data[MessagesTypes.TEXT.toText],
          onPressed: () {
            callTock(button.data['title'], button.data['payload']);
          },
        );
      case ButtonsTypes.URL_BUTTON:
        return UrlButton(
          text: button.data[MessagesTypes.TEXT.toText],
          url: button.data[ButtonsTypes.URL_BUTTON.toText],
        );
      case ButtonsTypes.WIDGET:
        return customButton(button);
      default:
        return null;
    }
  }
}

class Message {
  UserTypes name;
  MessagesTypes type;
  Map<String, dynamic> data;

  Message(this.name, this.type, this.data);
}

class Button {
  ButtonsTypes type;
  Map<String, dynamic> data;
  Button(this.type, this.data);
}
