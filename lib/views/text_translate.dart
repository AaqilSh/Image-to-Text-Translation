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
        title: const Text('Translate'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 25.0,
          ),
          const Flexible(
            child: TextField(
              textAlign: TextAlign.center,
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
          const Text(
            'Translate to:',
            style: TextStyle(fontSize: 18.0),
          ),
          const SizedBox(
            height: 20.0,
          ),
          DropdownButton(
            // isExpanded: true,
            items: const [
              DropdownMenuItem(
                child: Text('Hello'),
                value: 'Hello',
              ),
              DropdownMenuItem(child: Text('World'), value: 'World'),
              DropdownMenuItem(child: Text('World'), value: 'World'),
            ],
            value: 'Hello',
            onTap: () {
              print('hello');
            },
            onChanged: (_) {},
          ),
          Center(
            child: ElevatedButton(
              child: const Text(
                'Translate',
                style: TextStyle(fontSize: 18.0),
              ),
              onPressed: () {},
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          const SelectableText('Result'),
        ],
      ),
    );
  }
}
