import 'package:flutter/material.dart';

class TextTranslatepage extends StatefulWidget {
  const TextTranslatepage({Key? key}) : super(key: key);

  @override
  _TextTranslatepageState createState() => _TextTranslatepageState();
}

class _TextTranslatepageState extends State<TextTranslatepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text translation'),
      ),
      body: Container(
        margin: const EdgeInsets.all(15.0),
        child: const Text('Text Translation'),
      ),
    );
  }
}
