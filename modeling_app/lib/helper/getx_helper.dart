import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';

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

  Future<void> pickAndUploadFile() async {
    try {
      final result = await FilePicker.platform.pickFiles();
      if (result != null && result.files.isNotEmpty) {
        final file = result.files.first;

        String? filePath = file.path;
        String? fileName = file.name;

        if (filePath != null) {
          print('File Name: $fileName');
          print('File Path: $filePath');
        } else {
          print('No file selected');
        }
      } else {
        print('User canceled the picker');
      }
    } catch (e) {
      print('Error picking file: $e');
    }
  }
}
