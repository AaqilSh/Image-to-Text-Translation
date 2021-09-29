import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:translate/providers/image_provider.dart';
import 'package:translate/services/status.dart';

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
        body: Column(
          children: [
            Consumer<ImageViewProvider>(
              builder: (_, imageProvider, __) =>
                  (imageProvider.currentStatus == Status.loaded)
                      ? Image.file(File(imageProvider.imagePath))
                      : Container(),
            ),
            Consumer<ImageViewProvider>(
                builder: (_, imageProvider, __) => Center(
                      child: ElevatedButton(
                          onPressed: imageProvider.getImage,
                          child: const Text('Select image')),
                    )),
          ],
        ));
  }
}
