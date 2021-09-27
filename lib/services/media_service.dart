import 'package:image_picker/image_picker.dart';

class MediaService {
  Future<String?> pickImage(String? path) async {
    final ImagePicker _imagePicker = ImagePicker();
    final XFile? image =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    return image!.path;
  }
}
