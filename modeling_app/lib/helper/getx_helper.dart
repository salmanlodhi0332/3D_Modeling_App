import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
// import 'package:filepicker_windows/filepicker_windows.dart';

class GetxControllersProvider extends GetxController {
  RxString imagePath = ''.obs;
  RxString backgoundImage = ''.obs;
  RxString Model = ''.obs;
  RxInt ModelIndex = 0.obs;

  var defaultImagePath = 'assets/images/default.jpg';
  Future getImage() async {
    final _picker = ImagePicker();
    final image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      imagePath.value = image.path.toString();
    } else {
      imagePath.value = '';
    }
  }

  Future getFromCameraImage() async {
    final _picker = ImagePicker();
    final image = await _picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      imagePath.value = image.path.toString();
    } else {
      imagePath.value = '';
    }
  }

  Future<void> uploadGLBFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['glb'],
      );

      if (result != null) {
        String file = File(result.files.single.path!).path;

        print('File Path: $file');
      }
    } catch (e) {
      print('error while uploading 3D model: $e');
    }
  }

  
  Future<String?> bankStatementUploader() async {
    const int maxSizeInBytes = 5 * 1024 * 1024; // 5 MB in bytes

    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null) {
        PlatformFile file = result.files.first;

        // Check the file size
        if (file.size > maxSizeInBytes) {
          Fluttertoast.showToast(
              msg: 'The selected file exceeds the maximum size limit of 5 MB.');
          print("The selected file exceeds the maximum size limit of 5 MB.");
          return null;
        }

        return file.path;
      } else {
        // User canceled the picker
        return null;
      }
    } catch (e) {
      print("bankStatementUploader Error: $e");
      return '';
    }
  }
}
