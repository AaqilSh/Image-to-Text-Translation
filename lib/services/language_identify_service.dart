import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:translate/services/exceptions.dart';

class LanguageService {
  static final LanguageService _instance = LanguageService();
  static LanguageService get instance => _instance;

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
      throw LanguageNotFoundException('Language is unable to found');
    }
  }

  Future identifyPossibleLanguages(String text) async {
    final _idlangs = await _languageIdentifier.identifyPossibleLanguages(text);
    return _idlangs;
  }
}
