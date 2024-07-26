import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:modeling_app/MVC/view/3DviewerScreen.dart';
import 'package:modeling_app/components/image_widget.dart';
import 'package:modeling_app/components/spring_widget.dart';
import 'package:modeling_app/constant/constants.dart';
import 'package:modeling_app/constant/navigation.dart';
import 'package:modeling_app/constant/theme.dart';
import 'package:modeling_app/helper/getx_helper.dart';

class uploadModelScreen extends StatelessWidget {
  uploadModelScreen({
    super.key,
  });

  @override
  final controllersProvider = Get.put(GetxControllersProvider());

  Widget build(BuildContext context) {
    return GetBuilder<ThemeHelper>(builder: (themecontroller) {
      return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/homebg.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SpringWidget(
                  onTap: () async {
                    await controllersProvider.bankStatementUploader();
                  },
                child: Center(
                  child: Container(
                      height: 300.sp,
                      width: 300.sp,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(30.sp),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.upload_file_outlined,
                            size: 40.sp,
                            color: Colors.white.withOpacity(0.5),
                          ),
                          Text('Upload 3D model',style: TextStyle(color: Colors.white.withOpacity(0.5)),)
                        ],
                      )),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
