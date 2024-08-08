import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:modeling_app/MVC/view/3DviewerScreen.dart';
import 'package:modeling_app/MVC/view/uploadModelScreen.dart';
import 'package:modeling_app/components/image_widget.dart';
import 'package:modeling_app/components/spring_widget.dart';
import 'package:modeling_app/constant/constants.dart';
import 'package:modeling_app/constant/navigation.dart';
import 'package:modeling_app/constant/theme.dart';
import 'package:modeling_app/MVC/controller/maincontroller.dart';
import 'package:modeling_app/data/mockData.dart';

class homeScreen extends StatelessWidget {
  homeScreen({
    super.key,
  });

  @override
  final controllersProvider = Get.put(mainController());

  Widget build(BuildContext context) {
    return GetBuilder<ThemeHelper>(builder: (themecontroller) {
      return Scaffold(
          resizeToAvoidBottomInset: true,
          floatingActionButton: SpringWidget(
            onTap: () {
              Navigation.getInstance
                  .RightToLeft_PageNavigation(context, uploadModelScreen());
            },
            child: Container(
              height: 50.sp,
              width: 150.sp,
              decoration: BoxDecoration(
                  gradient: themecontroller.backgroundGradient,
                  borderRadius: BorderRadius.circular(20.sp)),
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/3Dmodel.png',
                    height: 25.sp,
                  ),
                  SizedBox(
                    width: 10.sp,
                  ),
                  Text(
                    'Upload model',
                  ),
                ],
              )),
            ),
          ),
          body: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/homebg.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Constants.screenPadding, vertical: 30.sp),
                child: GridView.builder(
                  shrinkWrap: true,
                  primary: false,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                      mainAxisSpacing: 20.sp,
                      crossAxisSpacing: 20.sp),
                  itemCount: MockData.characterImages.length,
                  itemBuilder: (BuildContext context, int index) {
                    // var product = SearchPorductslist;
                    return GestureDetector(
                        onTap: () {
                          Navigation.getInstance.screenNavigation(
                              context,
                              modelViewerScreen(
                                Model: MockData.characterImages[index]['model']
                                    .toString(),
                              ));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 100, 100, 100),
                              borderRadius: BorderRadius.circular(20.sp)),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.sp),
                              child: ImageWidget(
                                  imageUrl: MockData.characterImages[index]
                                          ['image']
                                      .toString())),
                        ));
                  },
                ),
              )));
    });
  }
}
