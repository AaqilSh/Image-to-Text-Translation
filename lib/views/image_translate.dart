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
                      ? Column(
                          children: [
                            Image.file(File(imageProvider.imagePath)),
                            const SizedBox(
                              height: 25.0,
                            ),
                            ElevatedButton(
                                onPressed: imageProvider.getImage,
                                child: const Text('Translate')),
                            const SizedBox(
                              height: 25.0,
                            ),
                            ElevatedButton(
                                onPressed: imageProvider.getImage,
                                child: const Text('Select another image')),
                          ],
                        )
                      : (imageProvider.currentStatus == Status.loading)
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : ElevatedButton(
                              onPressed: imageProvider.getImage,
                              child: const Text('Select image')),
            )
          ],
        ));
  }
}
