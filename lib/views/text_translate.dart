import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:translate/providers/language_provider.dart';

class TextTranslatepage extends StatefulWidget {
  const TextTranslatepage({Key? key}) : super(key: key);

  @override
  _TextTranslatepageState createState() => _TextTranslatepageState();
}

class _TextTranslatepageState extends State<TextTranslatepage> {
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

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
          Flexible(
            child: TextField(
              controller: _textController,
              textAlign: TextAlign.center,
              expands: false,
              maxLines: 12,
              minLines: null,
              decoration: const InputDecoration.collapsed(
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
            child: Consumer<LanguageProvider>(
              builder: (_, languageProvider, __) => ElevatedButton(
                child: const Text(
                  'Translate',
                  style: TextStyle(fontSize: 18.0),
                ),
                onPressed: () {
                  languageProvider.getLanguage('How are you buddy', 'sq');
                },
              ),
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
