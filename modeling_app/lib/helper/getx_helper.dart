import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';

class GetxControllersProvider extends GetxController {
  RxString imagePath = ''.obs;
  RxString backgoundImage = ''.obs;
  RxString Model = ''.obs;

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
}
