import 'package:flutter/material.dart';
import 'package:tock_flutter_kit/components/text_field.dart';
import 'package:tock_flutter_kit/services/messages_widget_mapper.dart';

class ChatView extends StatelessWidget {
  final List<Message> messages;
  final List<Button> buttons;
  final bool loading;
  final Function inputText;
  final ScrollController _scrollController = ScrollController();

  ChatView(
      {Key key,
      @required this.messages,
      @required this.loading,
      @required this.inputText,
      @required this.buttons})
      : super(key: key);

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
                      controller: _scrollController,
                      shrinkWrap: true,
                      itemBuilder: (_, index) {
                        _scrollController.animateTo(
                            _scrollController.position.maxScrollExtent,
                            duration: Duration(milliseconds: 200),
                            curve: Curves.easeOut);
                        return MessagesWidgetMapper.mapMessage(
                            messages.elementAt(index));
                      },
                      itemCount: messages.length,
                      scrollDirection: Axis.vertical,
                      cacheExtent: 10,
                    ),
                  ),
                  buttons.length > 0
                      ? Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: ListView.builder(
                            padding: EdgeInsets.all(5),
                            itemBuilder: (_, index) => Padding(
                              padding: const EdgeInsets.only(right: 5.0),
                              child: ButtonsWidgetMapper.mapButton(
                                  buttons.elementAt(index), inputText),
                            ),
                            itemCount: buttons.length,
                            scrollDirection: Axis.horizontal,
                          ),
                        )
                      : Container(),
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
                onPressed: inputText,
              ),
            )
          ],
        ),
      ),
    );
  }
}
