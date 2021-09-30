import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:translate/services/exceptions.dart';

class LanguageRecongnitionService {
  static final LanguageRecongnitionService _instance =
      LanguageRecongnitionService();
  static LanguageRecongnitionService get instance => _instance;

  final LanguageIdentifier _languageIdentifier =
      GoogleMlKit.nlp.languageIdentifier();

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
}
