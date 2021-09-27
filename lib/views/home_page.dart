import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Translate'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 25.0,
          ),
          // Center(child: Text('Enter text')),
          const Flexible(
            child: TextField(
              textAlign: TextAlign.center,
              maxLengthEnforcement: MaxLengthEnforcement.none,
              expands: false,
              maxLines: 12,
              minLines: null,
              decoration: InputDecoration.collapsed(
                hintText: 'Enter text to translate',
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Center(
            child: TextButton(
              child: const Text('Translate'),
              onPressed: () {},
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          const SelectableText('Result')
        ],
      ),
    );
  }
}
