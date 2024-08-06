import 'dart:typed_data';

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
import 'package:screenshot/screenshot.dart';

class modelViewerScreen extends StatelessWidget {
  modelViewerScreen({
    super.key,
    required this.Model,
  });
  final String Model;
  @override
  final controllersProvider = Get.put(mainController());
  ScreenshotController screenshotController = ScreenshotController();
  exportimage() {}
  Widget build(BuildContext context) {
    return GetBuilder<ThemeHelper>(initState: (state) async {
      await controllersProvider.GetAllbackground();
    }, builder: (themecontroller) {
      return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Screenshot(
          controller: screenshotController,
          child: Stack(
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
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 100, 100, 100)),
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
                src: 'assets/images/${Model}',
                // 'assets/images/${controllersProvider.Model.value}',
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
                      var container = Container(
                          padding: const EdgeInsets.all(30.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.blueAccent, width: 5.0),
                            color: Colors.redAccent,
                          ),
                          child: Stack(
                            children: [
                              Image.asset(
                                'assets/images/flutter.png',
                              ),
                              Text(
                                "This is an invisible widget",
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ],
                          ));
                      screenshotController
                          .captureFromWidget(
                              InheritedTheme.captureAll(
                                  context, Material(child: container)),
                              delay: Duration(seconds: 1))
                          .then((capturedImage) {
                        ShowCapturedWidget(context, capturedImage);
                      });
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
        ),
      );
    });
  }
}

Future<dynamic> ShowCapturedWidget(
    BuildContext context, Uint8List capturedImage) {
  return showDialog(
    useSafeArea: false,
    context: context,
    builder: (context) => Scaffold(
      appBar: AppBar(
        title: Text("Captured widget screenshot"),
      ),
      body: Center(child: Image.memory(capturedImage)),
    ),
  );
}
