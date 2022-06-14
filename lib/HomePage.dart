import 'package:flutter/material.dart';

import 'ChatScreen.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chats',
        ),
        backgroundColor: Colors.black,
      ),
      body: ChatScreen(),
    );
  }
}
