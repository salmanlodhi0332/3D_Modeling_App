import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:modeling_app/components/image_widget.dart';
import 'package:modeling_app/components/spring_widget.dart';
import 'package:modeling_app/constant/theme.dart';
import 'package:modeling_app/MVC/controller/maincontroller.dart';
import 'package:screenshot/screenshot.dart';

class ModelViewerScreen extends StatelessWidget {
  ModelViewerScreen({
    super.key,
    required this.model,
  });

  final String model;
  final ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    final controllersProvider = Get.put(MainController());

    return GetBuilder<ThemeHelper>(
      initState: (state) async {
        await controllersProvider.getAllBackground();
      },
      builder: (themeController) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: Screenshot(
            controller: screenshotController,
            child: Stack(
              children: [
                Obx(
                  () => controllersProvider.backgroundImage.value != ''
                      ? Positioned.fill(
                          child: ImageWidget(
                            imageUrl: controllersProvider.backgroundImage.value,
                            boxFit: BoxFit.cover,
                          ),
                        )
                      : Container(
                          height: double.infinity,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 100, 100, 100),
                          ),
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
                        ),
                ),
                ModelViewer(
                  src: 'assets/images/$model',
                  alt: "A 3D model",
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
                  ),
                ),
                Positioned(
                  top: 30.sp,
                  right: 80.sp,
                  child: SpringWidget(
                    onTap: () {
                      screenshotController.capture().then((capturedImage) {
                        if (capturedImage != null) {
                          ShowCapturedWidget(context, capturedImage);
                        }
                      });
                    },
                    child: CircleAvatar(
                      radius: 25.sp,
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.black,
                        size: 20.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Future<void> ShowCapturedWidget(BuildContext context, Uint8List capturedImage) {
  return showDialog(
    context: context,
    builder: (context) => Scaffold(
      appBar: AppBar(
        title: Text("Captured Screenshot"),
      ),
      body: Center(child: Image.memory(capturedImage)),
    ),
  );
}
