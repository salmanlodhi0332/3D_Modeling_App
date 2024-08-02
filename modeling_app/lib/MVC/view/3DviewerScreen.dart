import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
// import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import 'package:modeling_app/components/charactorbottomsheet.dart';
import 'package:modeling_app/components/imageBottomSheet.dart';
import 'package:modeling_app/components/image_widget.dart';
import 'package:modeling_app/components/spring_widget.dart';
import 'package:modeling_app/constant/theme.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:modeling_app/MVC/controller/maincontroller.dart';

class modelViewerScreen extends StatelessWidget {
  modelViewerScreen({
    super.key,
  });

  @override
  final controllersProvider = Get.put(mainController());

  Widget build(BuildContext context) {
    return GetBuilder<ThemeHelper>(initState: (state) async {
      await controllersProvider.GetAllbackground();
    }, builder: (themecontroller) {
      return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            Obx(() => controllersProvider.backgoundImage.value != ''
                ? Positioned.fill(
                    child: ImageWidget(
                      imageUrl: controllersProvider.backgoundImage.value,
                      boxfit: BoxFit.cover,
                    ),
                  )
                : Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.grey),
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 0,
                          right: 10.sp,
                          child: Image.asset(
                            'assets/images/blankfloor.png',
                            fit: BoxFit.fitWidth,
                          ),
                        )
                      ],
                    ),
                  )),
            // Obx(
            //   () => controllersProvider.Model.value == ''
            //       ? Container()
            // ModelViewer(
            //     src: 'assets/images/model3.glb',
            //     alt: "A 3D model of an astronaut",
            //     ar: true,
            //     autoRotate: true,
            //     cameraControls: true,
            //   )
            // :
            ModelViewer(
              src:
                  "https://firebasestorage.googleapis.com/v0/b/d-model-app.appspot.com/o/3DModel%2Fmodel1.glb?alt=media&token=9ea69cbb-6da4-4767-b481-d1b977f39fb8"
              // 'assets/images/${controllersProvider.Model.value}'
              ,
              alt: "A 3D model of an astronaut",
              // loading:Loading.lazy ,

              ar: false,
              autoRotate: true,
              cameraControls: true,
            ),

            Positioned(
                top: 30.sp,
                right: 20.sp,
                child: SpringWidget(
                  onTap: () {
                    ImageBottomSheet.show(context);
                  },
                  child: CircleAvatar(
                    radius: 25.sp,
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    child: Icon(
                      Icons.image,
                      color: Colors.black,
                      size: 20.sp,
                    ),
                  ),
                )),
            Positioned(
                top: 30.sp,
                right: 80.sp,
                child: SpringWidget(
                  onTap: () {
                    charactorBottomSheet.show(context);
                  },
                  child: CircleAvatar(
                    radius: 25.sp,
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    child: Icon(
                      Icons.person,
                      color: Colors.black,
                      size: 20.sp,
                    ),
                  ),
                )),
          ],
        ),
      );
    });
  }
}
