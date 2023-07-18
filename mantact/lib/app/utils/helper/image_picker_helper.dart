import 'dart:developer';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class ImagePickerHelper {
  Future<String?> pickImage() async {
    try {
      late File image;
      final ImagePicker picker = ImagePicker();
      final XFile? pickedImage =
          await picker.pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        image = File(pickedImage.path);
        final appDir = await getApplicationDocumentsDirectory();
        final savedImage = await image
            .copy('${appDir.path}/${pickedImage.path.split('/').last}');
        String imagePath = savedImage.path;
        print(imagePath);
        return imagePath;
      } else {
        return null;
      }
    } catch (e) {
      log('ImagePicker Exception: $e');
      return null;
    }
  }
}
