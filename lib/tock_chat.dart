import 'package:flutter/material.dart';
import 'package:tock_flutter_kit/components/chat_view.dart';
import 'package:tock_flutter_kit/services/authenticator_tock.dart';
import 'package:tock_flutter_kit/services/message_service.dart';
import 'package:tock_flutter_kit/services/messages_widget_mapper.dart';

class TockChat extends StatefulWidget {
  final String url;

  const TockChat({Key key, @required this.url}) : super(key: key);

  @override
  _TockChatState createState() => _TockChatState();
}

class _TockChatState extends State<TockChat> {
  // TODO singleton + state init
  static AuthenticatorTOCK authenticatorTOCK = AuthenticatorTOCK(
      url: 'https://demo-bot.tock.ai/io/kchiron/web_katoche/web');
  MessageService messageService =
      MessageService(authenticatorTOCK: authenticatorTOCK);

  List<Message> _messages = List();
  List<Button> _buttons = List();
  bool loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  callTock(String text, [String payload]) async {
    setState(() {
      _messages
          .add(Message(UserTypes.USER, MessagesTypes.TEXT, {'text': text}));
      if (payload != null) {
        _buttons = [];
      }
    });
    TOCKResponse responses =
        await messageService.sendHTTPMessage(payload ?? text);
    responses.getMessage().forEach((element) {
      setState(() {
        _messages.add(Message(
            UserTypes.BOT, MessagesTypesUtil.fromString(element), element));
        if (element['buttons'] != null) {
          element['buttons'].forEach((button) {
            _buttons.add(Button(ButtonsUtil.fromString(button), button));
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChatView(
      messages: _messages,
      loading: loading,
      inputText: callTock,
      buttons: _buttons,
    );
  }
}
