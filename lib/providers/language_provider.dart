import 'package:translate/providers/base_provider.dart';
import 'package:translate/services/language_identify_service.dart';
import 'package:translate/services/status.dart';
import 'package:translate/services/translate_service.dart';

class LanguageProvider extends BaseProvider {
  String? _language;
  String get language => _language!;

  void getLanguage(String text, String to) async {
    // setStatus(Status.loading);
    // String _lang = await LanguageService().identifyLanguage(text);
    final _translated = await TranslateService().translate(text, to);
    print(_translated);

    // setStatus(Status.loaded);
  }
}
