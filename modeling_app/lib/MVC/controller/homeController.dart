// import 'package:modeling_app/MVC/model/placesModel.dart';
import 'package:modeling_app/services/app_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class homeController extends GetxController {
  var Placesloading = false.obs;

  // RxList<PlaceModel> placesList = <PlaceModel>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  // searchPlaceApi(BuildContext context, String placesName) async {
  //   try {
  //     Placesloading.value = true;
  //     final listData =
  //         await AppService.getInstance.searchPlaceApi(context, placesName);

  //     placesList.value = listData;

  //     print('placesList: ${placesList.length}');
  //     Placesloading.value = false;
  //   } catch (e) {
  //     Placesloading.value = false;
  //     print('error searchPlaceApi view model:$e');
  //   }
  // }
}
