import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modeling_app/MVC/view/3DviewerScreen.dart';
import 'package:modeling_app/constant/navigation.dart';
import 'package:modeling_app/constant/theme.dart';
import 'package:modeling_app/helper/getx_helper.dart';

class welcomeScreen extends StatelessWidget {
  welcomeScreen({
    super.key,
  });

  @override
  final controllersProvider = Get.put(GetxControllersProvider());

  Widget build(BuildContext context) {
    return GetBuilder<ThemeHelper>(initState: (state) {
      Timer(Duration(seconds:5), () {
        Navigation.getInstance
            .RightToLeft_PageNavigation(context, modelViewerScreen());
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
