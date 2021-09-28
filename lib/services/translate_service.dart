import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:translate/services/language_identify_service.dart';
import 'package:translate/services/languages.dart';

class TranslateService {
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
    if (!await isModelAvailable(languagesMap[language]!)) {
      downloadModel(languagesMap[language]!);
    }
    final _sourceLang = await LanguageService().identifyLanguage(text);

    final _translateService = GoogleMlKit.nlp.onDeviceTranslator(
        sourceLanguage: _sourceLang, targetLanguage: languagesMap[language]!);
    final _translated = await _translateService.translateText(text);
    _translateService.close();
    return _translated;
  }
}
