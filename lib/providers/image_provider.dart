import 'package:translate/providers/base_provider.dart';
import 'package:translate/services/exceptions.dart';
import 'package:translate/services/media_service.dart';
import 'package:translate/services/status.dart';

class ImageViewProvider extends BaseProvider {
  String? _imagePath;
  String get imagePath => _imagePath!;

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
}
