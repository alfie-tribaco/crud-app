import 'dart:developer';
import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mantact/app/utils/helper/permission_helper.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class ImagePickerHelper {
  Future<String?> pickImage() async {
    await PermissionHelper().askPermissions([Permission.mediaLibrary]);
    if (await Permission.mediaLibrary.isGranted) {
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
          return imagePath;
        } else {
          return null;
        }
      } catch (e) {
        log('ImagePicker Exception: $e');
        return null;
      }
    } else {
      Fluttertoast.showToast(
          msg: 'Mantact need your permission to access your images');
      return null;
    }
  }
}
