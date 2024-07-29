import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
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
  final FirebaseStorage _storage = FirebaseStorage.instance;

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
        type: FileType.any,
        // allowedExtensions: ['glb'],
      );

      if (result != null) {
        PlatformFile file = result.files.first;
        print('File Path: $file');
        // Create a reference to the file location
        Reference ref = _storage.ref().child('3DModel/${file.name}');

        // Upload the file
        await ref.putFile(File(file.path!));
        print('Upload complete');
      }
    } on FirebaseException catch (e) {
      print('error while uploading 3D model: $e');
    }
  }



  Future<void> backgroundimage() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        // allowedExtensions: ['glb'],
      );

      if (result != null) {
        PlatformFile file = result.files.first;
        print('File Path: $file');
        // Create a reference to the file location
        Reference ref = _storage.ref().child('backgroundImage/${file.name}');

        // Upload the file
        await ref.putFile(File(file.path!));
        print('Upload complete');
      }
    } on FirebaseException catch (e) {
      print('error while uploading 3D model: $e');
    }
  }
}
