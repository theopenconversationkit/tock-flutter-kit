import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:tock_flutter_kit/components/qr_button.dart';
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

class TockChat extends StatefulWidget {
  @override
  _TockChatState createState() => _TockChatState();
}

class _TockChatState extends State<TockChat> {
  final List<Bubble> _messages = <Bubble>[];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height - ChatTextField.height,
              color: Colors.deepOrange,
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (_, index) => Bubble(
                        text: "coucou $index",
                        index: index,
                        backgroundBubbleColor: Colors.orangeAccent,
                        borderBubbleColor: Colors.deepOrangeAccent,
                        textBubbleColor: Colors.white,
                      ),
                      itemCount: 2,
                      scrollDirection: Axis.vertical,
                      cacheExtent: 10,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: ListView.builder(
                      padding: EdgeInsets.all(5),
                      itemBuilder: (_, index) => Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: QrButton(
                          text: 'Click me',
                          onPressed: () {},
                        ),
                      ),
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: ChatTextField(
                backgroundColor: Colors.orangeAccent,
                deeperColor: Colors.deepOrangeAccent,
                placeHolderText: "Ecrivez votre message",
                onPressed: () =>
                    _handleSubmitted(ChatTextField.controller.text),
              ),
            )
          ],
        ),
      ),
    );
  }

  void Response(query) async {
    AuthenticatorTOCK authenticatorTOCK = AuthenticatorTOCK(
        url:
            'https://botinoui-production1-bot.sncfvoyages-prod.aws.vsct.fr/web');
    MessageService messageService =
        MessageService(authenticatorTOCK: authenticatorTOCK);
    TOCKResponse responses = await messageService.sendHTTPMessage(query);
    Bubble message = new Bubble(
        text: responses.getMessage(),
        name: "bot",
        type: responses.getType(),
        index: null);
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleSubmitted(String text) {
    var bubble =
        new Bubble(text: text, name: "user", type: "message", index: null);
    setState(() {
      _messages.insert(0, bubble);
    });
    Response(text);
  }
}
