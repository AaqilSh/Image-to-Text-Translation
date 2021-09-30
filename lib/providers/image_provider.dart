import 'package:translate/providers/base_provider.dart';
import 'package:translate/services/exceptions.dart';
import 'package:translate/services/recognition_service.dart';
import 'package:translate/services/media_service.dart';
import 'package:translate/services/status.dart';
import 'package:translate/services/translate_service.dart';
import 'package:translate/services/text_recognition_service.dart';

class ImageViewProvider extends BaseProvider {
  String? _imagePath;
  String get imagePath => _imagePath!;

  String _language = 'English';
  String get language => _language;

  String? _translatedText;
  String? get translatedText => _translatedText;

  String? _imageText;
  String? get imageText => _imageText;

  final _languageservice = LanguageService.instance;
  final _translateservice = TranslateService.instance;

  void getImage() async {
    if (_imagePath != null) {
      //Clears previous image if any
      _imagePath = null;
    }
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
  }

  void translateImage() async {
    setStatus(Status.loading);
    _imageText = await _languageservice.getTextFromImage(_imagePath);
    _translatedText = await _translateservice.translate(_imageText!, language);
    setStatus(Status.translated);
  }
}
