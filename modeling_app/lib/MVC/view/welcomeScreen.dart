import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:modeling_app/MVC/view/3DviewerScreen.dart';
import 'package:modeling_app/MVC/view/homeScreen.dart';
import 'package:modeling_app/constant/navigation.dart';
import 'package:modeling_app/constant/theme.dart';
import 'package:modeling_app/MVC/controller/maincontroller.dart';

class welcomeScreen extends StatelessWidget {
  welcomeScreen({
    super.key,
  });

  @override
  final controllersProvider = Get.put(mainController());

  Widget build(BuildContext context) {
    return GetBuilder<ThemeHelper>(initState: (state) {
      FlutterNativeSplash.remove();

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
