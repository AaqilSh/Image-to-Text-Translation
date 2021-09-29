import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:translate/services/exceptions.dart';
import 'package:translate/services/language_identify_service.dart';
import 'package:translate/services/languages.dart';

class TranslateService {
  static final TranslateService _instance = TranslateService();
  static TranslateService get instance => _instance;

  final _languageService = LanguageService.instance;
  final _translateModelManager =
      GoogleMlKit.nlp.translateLanguageModelManager();

  Future<bool> isModelAvailable(String modelTag) async {
    return await _translateModelManager.isModelDownloaded(modelTag);
  }

  Future<bool> downloadModel(String modelTag) async {
    try {
      await _translateModelManager.downloadModel(modelTag,
          isWifiRequired: false);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<String> translate(String text, String language) async {
    final _destinLang = languagesMap[language];

    try {
      final _sourceLang = await _languageService.identifyLanguage(text);
      final _translateService = GoogleMlKit.nlp.onDeviceTranslator(
          sourceLanguage: _sourceLang, targetLanguage: _destinLang!);
      final _translated = await _translateService.translateText(text);
      _translateService.close();
      return _translated;
    } on LanguageNotFoundException {
      throw LanguageModelNotFoundException('Language not found');
    } catch (e) {
      throw TranslaterException('Translator not operating');
    }
  }
}
