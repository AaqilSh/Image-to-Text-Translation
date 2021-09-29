import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:translate/providers/image_provider.dart';
import 'package:translate/services/languages.dart';
import 'package:translate/services/status.dart';

class ImageTranslatePage extends StatefulWidget {
  const ImageTranslatePage({Key? key}) : super(key: key);

  @override
  _ImageTranslatePageState createState() => _ImageTranslatePageState();
}

class _ImageTranslatePageState extends State<ImageTranslatePage> {
  @override
  Widget build(BuildContext context) {
    final imageProvider = Provider.of<ImageViewProvider>(
      context,
    );
    return Scaffold(
        appBar: AppBar(
          title: const Text('Image Translation'),
        ),
        body: ListView(
          shrinkWrap: true,
          children: [
            (imageProvider.currentStatus == Status.loaded ||
                    imageProvider.currentStatus == Status.translated)
                ? Column(
                    children: [
                      Image.file(File(imageProvider.imagePath)),
                      const SizedBox(
                        height: 25.0,
                      ),
                      DropdownButton(
                        items: languagesMap.keys
                            .map((String value) => DropdownMenuItem<String>(
                                value: value, child: Text(value)))
                            .toList(),
                        value: imageProvider.language,
                        onChanged: (value) =>
                            imageProvider.setEndLanguage(value.toString()),
                      ),
                      ElevatedButton(
                          onPressed: imageProvider.translateImage,
                          child: const Text('Translate')),
                      const SizedBox(
                        height: 25.0,
                      ),
                      ElevatedButton(
                          onPressed: imageProvider.getImage,
                          child: const Text('Select another image')),
                      const SizedBox(
                        height: 20.0,
                      ),
                      (imageProvider.currentStatus == Status.translated)
                          ? Text(imageProvider.translated!)
                          : Container()
                    ],
                  )
                : (imageProvider.currentStatus == Status.loading)
                    ? const Align(
                        alignment: Alignment.center,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : Center(
                        child: ElevatedButton(
                            onPressed: imageProvider.getImage,
                            child: const Text('Select image')),
                      ),
          ],
        ));
  }
}
