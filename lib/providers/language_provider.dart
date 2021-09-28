import 'package:translate/providers/base_provider.dart';
import 'package:translate/services/status.dart';
import 'package:translate/services/translate_service.dart';

class LanguageProvider extends BaseProvider {
  String? _language;
  String get language => _language!;
  String? _translatedText;
  String get translatedText => _translatedText!;

  final _translateService = TranslateService.instance;

  void getLanguage(String text, String to) async {
    if (!text.isEmpty) {
      setStatus(Status.loading);
      _translatedText = await _translateService.translate(text, to);
      setStatus(Status.loaded);
    } else {
      setStatus(Status.idle);
    }
  }
}
