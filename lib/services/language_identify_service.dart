import 'package:google_ml_kit/google_ml_kit.dart';

class LanguageService {
  final LanguageIdentifier _languageIdentifier =
      GoogleMlKit.nlp.languageIdentifier();

  Future<String> identifyLanguage(String text) async {
    if (text.isEmpty) {
      return '';
    }
    final _identifiedLanguage =
        await _languageIdentifier.identifyLanguage(text);
    print(_identifiedLanguage);
    return _identifiedLanguage;
  }

  Future identifyPossibleLnaguages(String text) async {
    final _idlangs = await _languageIdentifier.identifyPossibleLanguages(text);
    return _idlangs;
  }
}
