import 'package:flutter/material.dart';

enum MessagesTypes { CARD, CAROUSEL, WIDGET, MESSAGE }
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

class MessagesTypesUtil {
  static MessagesTypes fromString(String type) {
    switch (type) {
      case 'card':
        return MessagesTypes.CARD;
      case 'carousel':
        return MessagesTypes.CAROUSEL;
      case 'widget':
        return MessagesTypes.WIDGET;
      case 'message':
        return MessagesTypes.MESSAGE;
      default:
        return null;
    }
  }
}

// TODO handle buttons in body with global config
class MessagesWidgetMapper {
  static Widget mapMessage(MessagesTypes type, Map<String, dynamic> messageData,
      [Function(Map<String, dynamic> messageData) customWidget]) {
    switch (type) {
      case MessagesTypes.CARD:
        return Container();
      case MessagesTypes.CAROUSEL:
        return Container();
      case MessagesTypes.MESSAGE:
        return Container();
      case MessagesTypes.WIDGET:
        return customWidget(messageData);
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
        return Container();
      case ButtonsTypes.POSTBACK_BUTTON:
        return Container();
      case ButtonsTypes.URL_BUTTON:
        return Container();
      case ButtonsTypes.WIDGET:
        return customButton(messageData);
      default:
        return null;
    }
  }
}
