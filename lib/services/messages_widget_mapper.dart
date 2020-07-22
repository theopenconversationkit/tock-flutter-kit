import 'package:flutter/material.dart';
import 'package:tock_flutter_kit/components/bubble_widget.dart';
import 'package:tock_flutter_kit/components/postback_button.dart';
import 'package:tock_flutter_kit/components/qr_button.dart';
import 'package:tock_flutter_kit/components/url_button.dart';
import 'package:tock_flutter_kit/components/card_widget.dart';
import 'package:tock_flutter_kit/components/carousel_widget.dart';
import 'package:tock_flutter_kit/tock_chat.dart';

enum MessagesTypes { CARD, CAROUSEL, WIDGET, TEXT }
enum ButtonsTypes { QUICK_REPLY, POSTBACK_BUTTON, URL_BUTTON, WIDGET }

class ButtonsUtil {
  static ButtonsTypes fromString(String type) {
    switch (type) {
      case 'web_url':
        return ButtonsTypes.URL_BUTTON;
      case 'postback':
        return ButtonsTypes.POSTBACK_BUTTON;
      case 'quick_reply':
        return ButtonsTypes.QUICK_REPLY;
      case 'widget':
        return ButtonsTypes.WIDGET;
      default:
        return null;
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
      [Function(Map<String, dynamic> messageData) customWidget]) {
    switch (message.type) {
      case MessagesTypes.CARD:
        return CardWidget();
      case MessagesTypes.CAROUSEL:
        return CarouselWidget();
      case MessagesTypes.TEXT:
        return BubbleWidget(
          text: message.data[MessagesTypes.TEXT.toText],
          name: message.name,
        );
      case MessagesTypes.WIDGET:
        return customWidget(message.data);
      default:
        return null;
    }
  }
}

class ButtonsWidgetMapper {
  static Widget mapButton(ButtonsTypes type, Map<String, dynamic> messageData,
      [Function(Map<String, dynamic> messageData) customButton]) {
    switch (type) {
      case ButtonsTypes.QUICK_REPLY:
        return QrButton(
          text: messageData['text'],
        );
      case ButtonsTypes.POSTBACK_BUTTON:
        return PostbackButton(
          text: messageData['text'],
        );
      case ButtonsTypes.URL_BUTTON:
        return UrlButton(
          text: messageData['text'],
          url: messageData['url'],
        );
      case ButtonsTypes.WIDGET:
        return customButton(messageData);
      default:
        return null;
    }
  }
}
