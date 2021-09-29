import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:translate/services/exceptions.dart';

class LanguageService {
  static final LanguageService _instance = LanguageService();
  static LanguageService get instance => _instance;

  final LanguageIdentifier _languageIdentifier =
      GoogleMlKit.nlp.languageIdentifier();
  final _textRecongnizer = GoogleMlKit.vision.textDetector();

  Future<String> identifyLanguage(String text) async {
    if (text.isEmpty) {
      return '';
    }
    try {
      final _identifiedLanguage =
          await _languageIdentifier.identifyLanguage(text);
      return _identifiedLanguage;
    } catch (e) {
      throw LanguageNotFoundException('Unable to find language');
    }
  }

  Future<String> getText(String? path) async {
    final _image = InputImage.fromFilePath(path!);
    final recognizedTexts = await _textRecongnizer.processImage(_image);
    List<String> texts = [];
    for (var block in recognizedTexts.blocks) {
      texts.add(block.text);
    }
    return texts.join('');
  }
}
