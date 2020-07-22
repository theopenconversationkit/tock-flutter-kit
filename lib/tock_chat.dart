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
  // TODO singleton
  static AuthenticatorTOCK authenticatorTOCK = AuthenticatorTOCK(
      url: 'https://demo-bot.tock.ai/io/kchiron/web_katoche/web');
  MessageService messageService =
      MessageService(authenticatorTOCK: authenticatorTOCK);

  List<Message> _messages = List();
  bool loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  callTock(String text) async {
    setState(() {
      _messages
          .add(Message(UserTypes.USER, MessagesTypes.TEXT, {'text': text}));
    });
    TOCKResponse responses = await messageService.sendHTTPMessage(text);
    responses.getMessage().forEach((element) {
      setState(() {
        _messages.add(Message(
            UserTypes.BOT, MessagesTypesUtil.fromString(element), element));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChatView(messages: _messages, loading: loading, inputText: callTock);
  }
}

enum UserTypes { USER, BOT }

class Message {
  UserTypes name;
  MessagesTypes type;
  Map<String, dynamic> data;

  Message(this.name, this.type, this.data);
}
