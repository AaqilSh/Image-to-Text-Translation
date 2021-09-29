import 'package:image_picker/image_picker.dart';
import 'package:translate/services/exceptions.dart';

class MediaService {
  Future<String?> pickImage() async {
    try {
      final ImagePicker _imagePicker = ImagePicker();
      final XFile? image =
          await _imagePicker.pickImage(source: ImageSource.gallery);
      return image!.path;
    } catch (e) {
      throw ImageNotFoundException('No image found');
    }
  }
}
