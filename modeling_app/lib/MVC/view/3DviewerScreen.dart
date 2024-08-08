import 'dart:typed_data';
// import 'package:capture_and_share/capture_and_share.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:modeling_app/MVC/view/ExportScreen.dart';
import 'package:modeling_app/components/imageBottomSheet.dart';
import 'package:modeling_app/components/image_widget.dart';
import 'package:modeling_app/components/spring_widget.dart';
import 'package:modeling_app/constant/navigation.dart';
import 'package:modeling_app/constant/theme.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:modeling_app/MVC/controller/maincontroller.dart';

class modelViewerScreen extends StatelessWidget {
  modelViewerScreen({
    super.key,
    required this.Model,
  });
  final String Model;
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
            modelviewer(controllersProvider: controllersProvider, Model: Model),
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
                    child: SvgPicture.asset(
                      'assets/icons/Gallery.svg',
                      color: Colors.black,
                      height: 20.sp,
                    ),
                  ),
                )),
            //       Positioned(
            //           top: 30.sp,
            //           right: 80.sp,
            //           child: SpringWidget(
            //             onTap: () async {
            // //                CaptureAndShare.shareIt(
            // //   sizeWidth: 300,
            // //   sizeHeight: 300,
            // //   xMode: 'center',
            // //   yMode: 'center',
            // // );
            //               // var container = Container(
            //               //     child: modelviewer(
            //               //         controllersProvider: controllersProvider,
            //               //         Model: Model));

            //               // String? path = await NativeScreenshot.takeScreenshot();
            //               // Navigation.getInstance.RightToLeft_PageNavigation(
            //               //     context, ExportScreen(capturedImage: path));
            //               // await screenshotController
            //               //     .captureFromWidget(
            //               //         InheritedTheme.captureAll(
            //               //             context, Material(child: container)),
            //               //         delay: Duration(seconds: 1))
            //               //     .then((capturedImage) {
            //               //   ShowCapturedWidget(context, capturedImage);
            //               // });
            //             },
            //             child: CircleAvatar(
            //               radius: 25.sp,
            //               backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            //               child: Icon(
            //                 Icons.person,
            //                 color: Colors.black,
            //                 size: 20.sp,
            //               ),
            //             ),
            //           )),
          ],
        ),
      );
    });
  }
}

class modelviewer extends StatelessWidget {
  const modelviewer({
    super.key,
    required this.controllersProvider,
    required this.Model,
  });

  final mainController controllersProvider;
  final String Model;

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 100, 100, 100)),
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
        ModelViewer(
          src: 'assets/images/${Model}',
          alt: "A 3D model of an astronaut",
          ar: false,
          autoRotate: false,
          cameraControls: true,
        ),
      ],
    );
  }
}

Future<dynamic> ShowCapturedWidget(
    BuildContext context, Uint8List capturedImage) {
  return showDialog(
    useSafeArea: false,
    context: context,
    builder: (context) => Scaffold(
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
          children: [
            SizedBox(
              height: 20.sp,
            ),
            Center(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.sp),
                  child: Image.memory(
                    capturedImage,
                    height: 500.sp,
                    // width: 300.sp,
                  )),
            ),
          ],
        ),
      ),
    ),
  );
}
