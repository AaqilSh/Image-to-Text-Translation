import 'package:translate/providers/base_provider.dart';
import 'package:translate/services/status.dart';
import 'package:translate/services/translate_service.dart';

class LanguageProvider extends BaseProvider {
  String? _language = 'English';
  String get language => _language!;
  String? _translatedText;
  String get translatedText => _translatedText!;

  final _translateService = TranslateService.instance;

  void setEndLanguage(String language) {
    _language = language;
    setStatus(Status.idle);
  }

  void translateWord(String text) async {
    setStatus(Status.loading);
    if (text.isNotEmpty) {
      _translatedText = await _translateService.translate(text, _language!);
      setStatus(Status.loaded);
    }
  }
}
