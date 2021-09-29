import 'package:translate/providers/base_provider.dart';
import 'package:translate/services/exceptions.dart';
import 'package:translate/services/language_identify_service.dart';
import 'package:translate/services/media_service.dart';
import 'package:translate/services/status.dart';
import 'package:translate/services/translate_service.dart';

class ImageViewProvider extends BaseProvider {
  String? _imagePath;
  String get imagePath => _imagePath!;
  String? _language;
  String? get language => _language;
  String? _translated;
  String? get translated => _translated;
  String? _imageText;
  String? get imageText => _imageText;

  final _languageservice = LanguageService.instance;
  final _translateservice = TranslateService.instance;

  void getImage() async {
    setStatus(Status.loading);
    try {
      _imagePath = await MediaService().pickImage();
      setStatus(Status.loaded);
    } on ImageNotFoundException {
      setStatus(Status.error);
    } catch (e) {
      setStatus(Status.error);
    }
  }

  void setEndLanguage(String language) {
    _language = language;
    notifyListeners();
    // setStatus(Status.loaded);
  }

  void translateImage() async {
    setStatus(Status.loading);
    _imageText = await _languageservice.getText(_imagePath);
    _translated = await _translateservice.translate(_imageText!, language!);
    setStatus(Status.loaded);
  }
}
