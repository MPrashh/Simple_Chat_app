import 'package:flutter/material.dart';
import 'ChatMessage.dart';

class ChatScreen extends StatefulWidget {
  @override
  State createState() => new ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final TextEditingController textController = new TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage>[];

  void _handleSubmitted(String text) {
    textController.clear();
    ChatMessage message = ChatMessage(
      text: text,
    );
    setState(() {
      _messages.insert(0, message);
    });
  }

  Widget _textComposerWidget() {
    return IconTheme(
      data: IconThemeData(color: Colors.white),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 18.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                decoration: InputDecoration.collapsed(
                  hintText: "Send a message",
                  hintStyle: TextStyle(color: Colors.white),
                ),
                controller: textController,
                onSubmitted: _handleSubmitted,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: Icon(Icons.send),
                color: Colors.white,
                onPressed: () => _handleSubmitted(textController.text),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          child: ListView.builder(
            padding: EdgeInsets.all(8.0),
            reverse: true,
            itemBuilder: (_, int index) => _messages[index],
            itemCount: _messages.length,
          ),
        ),
        Divider(
          height: 1.0,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          child: _textComposerWidget(),
        ),
      ],
    );
  }
}
