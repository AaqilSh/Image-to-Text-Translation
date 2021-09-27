import 'package:flutter/material.dart';

class ImageTranslatePage extends StatefulWidget {
  const ImageTranslatePage({Key? key}) : super(key: key);

  @override
  _ImageTranslatePageState createState() => _ImageTranslatePageState();
}

class _ImageTranslatePageState extends State<ImageTranslatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Translation'),
      ),
      body: const Text('Image translation'),
    );
  }
}
