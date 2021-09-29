class BaseException implements Exception {
  String? message;

  BaseException([this.message]);
}

class LanguageNotFoundException extends BaseException {
  LanguageNotFoundException(String message) : super(message);
}

class TranslaterException extends BaseException {
  TranslaterException(String message) : super(message);
}

class ImageNotFoundException extends BaseException {
  ImageNotFoundException(String message) : super(message);
}

class LanguageModelNotFoundException extends BaseException {
  LanguageModelNotFoundException(String message) : super(message);
}
