import 'package:google_ml_kit/google_ml_kit.dart';

class TextRecongnitionService {
  final _textRecongnizer = GoogleMlKit.vision.textDetector();

  Future<String> getTextFromImage(String? path) async {
    ///Returns all words from the image as one space seperated string
    final _image = InputImage.fromFilePath(path!);
    final recognizedTexts = await _textRecongnizer.processImage(_image);
    List<String> texts = [];
    for (var block in recognizedTexts.blocks) {
      texts.add(block.text);
    }
    return texts.join(' ');
  }
}
