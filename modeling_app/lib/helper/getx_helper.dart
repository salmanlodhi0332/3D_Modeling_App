import 'package:modeling_app/constant/navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geocoding/geocoding.dart';

class GetxControllersProvider extends GetxController {
  RxString imagePath = ''.obs;
  RxString AddimagePath = ''.obs;
  RxString AddvideoPath = ''.obs;
  RxString KYCFrontimagePath = ''.obs;

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

  Future getKYCFrontImage() async {
    final _picker = ImagePicker();
    final image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      KYCFrontimagePath.value = image.path.toString();
    } else {
      KYCFrontimagePath.value = '';
    }
  }

  Future getImageForAddons() async {
    final _picker = ImagePicker();
    final image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      AddimagePath.value = image.path.toString();
    } else {
      AddimagePath.value = '';
    }
  }

  Future getFromCameraImageForAddons() async {
    final _picker = ImagePicker();
    final image = await _picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      AddimagePath.value = image.path.toString();
    } else {
      AddimagePath.value = '';
    }
  }

  Future getvideo() async {
    final _picker = ImagePicker();
    final image = await _picker.pickVideo(source: ImageSource.gallery);

    if (image != null) {
      AddvideoPath.value = image.path.toString();
    } else {
      AddvideoPath.value = '';
    }
  }

  Future getvideoFromCamera() async {
    final _picker = ImagePicker();
    final image = await _picker.pickVideo(source: ImageSource.camera);

    if (image != null) {
      AddvideoPath.value = image.path.toString();
    } else {
      AddvideoPath.value = '';
    }
  }

  bool isValidEmail(String email) {
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegExp.hasMatch(email);
  }

  ///---------------GOOGLE MAPS

  RxString selectedAddress = 'Select your address'.obs;
  GoogleMapController? newGoogleMapController;
  
  RxDouble Mylatitude = 0.0.obs;
  RxDouble Mylongitude = 0.0.obs;
  RxString MyAddress = ''.obs;
  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;
  RxString DestinationAddress = ''.obs;
  RxBool LocationLoading = false.obs;

  Rx<Marker> myMarker = Rx<Marker>(
    Marker(
      markerId: MarkerId("_MyMarker"),
      infoWindow: InfoWindow(title: "Me"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      position: LatLng(0.0, 0.0),
    ),
  );

  Rx<Marker> desMarker = Rx<Marker>(
    Marker(
      markerId: MarkerId("_MyMarker"),
      infoWindow: InfoWindow(title: "Me"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      position: LatLng(0.0, 0.0),
    ),
  );

  location_pickerController() {
    desMarker = Rx<Marker>(
      Marker(
        markerId: MarkerId("_MyMarker"),
        infoWindow: InfoWindow(title: "Me"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        position: LatLng(latitude.value, longitude.value),
      ),
    );
  }

  Marker get getDesMarker => desMarker.value;

  void updateSelectedAddress(LatLng tappedLocation) async {
    latitude.value = tappedLocation.latitude;
    longitude.value = tappedLocation.longitude;

    List<Placemark> placemarks = await placemarkFromCoordinates(
      latitude.value,
      longitude.value,
    );

    // Update the marker position dynamically
    desMarker.value = Marker(
      markerId: MarkerId("_MyMarker"),
      infoWindow: InfoWindow(title: "Me"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      position: LatLng(latitude.value, longitude.value),
    );

    if (placemarks.isNotEmpty) {
      Placemark placemark = placemarks.first;
      selectedAddress.value =
          '${placemark.name}, ${placemark.locality}, ${placemark.country}';
      update(); // Trigger a rebuild
    }
  }

  void currentLoaction(LatLng tappedLocation) async {
    latitude.value = tappedLocation.latitude;
    longitude.value = tappedLocation.longitude;

    List<Placemark> placemarks = await placemarkFromCoordinates(
      latitude.value,
      longitude.value,
    );

    // Update the marker position dynamically
    desMarker.value = Marker(
      markerId: MarkerId("_MyMarker"),
      infoWindow: InfoWindow(title: "Me"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      position: LatLng(latitude.value, longitude.value),
    );

    if (placemarks.isNotEmpty) {
      Placemark placemark = placemarks.first;
      selectedAddress.value =
          '${placemark.name}, ${placemark.locality}, ${placemark.country}';
      update(); // Trigger a rebuild
    }
  }

  get_myLoaction_latlong(String Address) async {
    List<Location> Pickedplace = await locationFromAddress(Address);

    if (Pickedplace.isNotEmpty) {
      Location location = Pickedplace.last;

      myMarker.value = Marker(
        markerId: MarkerId("_MyMarker"),
        infoWindow: InfoWindow(title: "Me"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        position: LatLng(location.latitude, location.longitude),
      );
      Mylatitude.value = location.latitude;
      Mylongitude.value = location.longitude;
      print("latitude: ${location.latitude},longitude: ${location.longitude}");
      update(); // Trigger a rebuild
    }
  }

  get_destinationLoaction_latlong(String Address) async {
    List<Location> Pickedplace = await locationFromAddress(Address);

    if (Pickedplace.isNotEmpty) {
      Location location = Pickedplace.last;

      desMarker.value = Marker(
        markerId: MarkerId("_Mydestination"),
        infoWindow: InfoWindow(title: "Destination"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        position: LatLng(location.latitude, location.longitude),
      );
      latitude.value = location.latitude;
      longitude.value = location.longitude;
      print("latitude: ${location.latitude},longitude: ${location.longitude}");

      update(); // Trigger a rebuild
    }
  }
}
