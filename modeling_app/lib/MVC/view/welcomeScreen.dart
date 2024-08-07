import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:modeling_app/MVC/view/3DviewerScreen.dart';
import 'package:modeling_app/MVC/view/homeScreen.dart';
import 'package:modeling_app/constant/navigation.dart';
import 'package:modeling_app/constant/theme.dart';
import 'package:modeling_app/MVC/controller/maincontroller.dart';
// import 'package:permission_handler/permission_handler.dart';

class welcomeScreen extends StatelessWidget {
  welcomeScreen({
    super.key,
  });

  @override
  final controllersProvider = Get.put(mainController());

  // Future<void> requestPermissions() async {
  //   while (true) {
  //     final status = await Permission.storage.request();
  //     if (status.isGranted) {
  //       print('Permission granted');
  //       break;
  //     } else if (status.isDenied) {
  //       print('Permission denied, retrying...');
  //       await Future.delayed(
  //           Duration(seconds: 2)); // Optional delay before retrying
  //     } else if (status.isPermanentlyDenied) {
  //       print(
  //           'Permission permanently denied. Please open settings to grant permission.');
  //       // Optionally, show an alert dialog here to inform the user.
  //       break;
  //     }
  //   }
  // }

  Widget build(BuildContext context) {
    return GetBuilder<ThemeHelper>(initState: (state) async {
      FlutterNativeSplash.remove();
      // await requestPermissions();
      Timer(Duration(seconds: 5), () {
        Navigation.getInstance
            .RightToLeft_PageNavigation(context, homeScreen());
      });
    }, builder: (themecontroller) {
      return Scaffold(
          resizeToAvoidBottomInset: true,
          body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/splash.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ));
    });
  }
}
