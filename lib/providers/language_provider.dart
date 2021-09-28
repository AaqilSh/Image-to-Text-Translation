import 'package:translate/providers/base_provider.dart';
import 'package:translate/services/language_identify_service.dart';
import 'package:translate/services/status.dart';

class LanguageProvider extends BaseProvider {
  String? _language;
  String get language => _language!;

  void getLanguage(String text) async {
    setStatus(Status.loading);
    String _lang = await LanguageService().identifyLanguage(text);
    print(_lang);
    setStatus(Status.loaded);
  }
}
