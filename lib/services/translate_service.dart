import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:translate/services/exceptions.dart';
import 'package:translate/services/language_identify_service.dart';

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
    final _sourceLang = await LanguageService().identifyLanguage(text);

    if (!await isModelAvailable(_sourceLang)) {
      await downloadModel(_sourceLang);
    }
    if (!await isModelAvailable(language)) {
      await downloadModel(language);
    }
    try {
      final _translateService = GoogleMlKit.nlp.onDeviceTranslator(
          sourceLanguage: _sourceLang, targetLanguage: language);
      final _translated = await _translateService.translateText(text);
      _translateService.close();
      return _translated;
    } catch (e) {
      throw LanguageNotFoundException('Given language is not valid');
    }
  }
}
