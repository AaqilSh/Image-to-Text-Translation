import 'package:google_ml_kit/google_ml_kit.dart';

class TranslateService {
  final _translateModelManager =
      GoogleMlKit.nlp.translateLanguageModelManager();

  Future<bool> isModelAvailable(String model) async {
    return await _translateModelManager.isModelDownloaded(model);
  }

  Future<bool> downloadModel(String text) async {
    try {
      await _translateModelManager.downloadModel(text, isWifiRequired: false);
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  void translate(String text, String langugae) {}
}
