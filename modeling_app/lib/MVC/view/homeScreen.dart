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
import 'package:modeling_app/helper/getx_helper.dart';

class homeScreen extends StatelessWidget {
  homeScreen({
    super.key,
  });

  @override
  final controllersProvider = Get.put(GetxControllersProvider());

  Widget build(BuildContext context) {
    return GetBuilder<ThemeHelper>(builder: (themecontroller) {
      return Scaffold(
          resizeToAvoidBottomInset: true,
          floatingActionButton: SpringWidget(
            onTap: () {
              Navigation.getInstance.RightToLeft_PageNavigation(context, uploadModelScreen());
            },
            child: Container(
              height: 50.sp,
              width: 150.sp,
              decoration: BoxDecoration(
                  gradient: themecontroller.backgroundGradient,
                  borderRadius: BorderRadius.circular(20.sp)),
              child: Center(child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/3Dmodel.png',height: 25.sp,),
                  SizedBox(width: 10.sp,),
                  Text('Upload model',),
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
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    // var product = SearchPorductslist;
                    return GestureDetector(
                        onTap: () {
                          // Navigation.getInstance.screenNavigation(context,
                          //     ProductDetailScreen(productData: product[index]));
                        },
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.sp),
                            child: ImageWidget(
                                imageUrl:
                                    'https://img.freepik.com/free-photo/3d-rendering-cartoon-like-worried-woman_23-2150797686.jpg?t=st=1721925169~exp=1721928769~hmac=cf0dc94b1aa0a4970dd0d38318278412b6dec812ee3af38b207db921d33754e3&w=740')));
                  },
                ),
              )));
    });
  }
}
