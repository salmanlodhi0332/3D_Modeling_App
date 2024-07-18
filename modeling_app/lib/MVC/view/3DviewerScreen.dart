import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modeling_app/constant/theme.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class modelViewerScreen extends StatelessWidget {
  modelViewerScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeHelper>(builder: (themecontroller) {
      return AnnotatedRegion(
        value: themecontroller.systemUiOverlayStyleForBlack,
        child: Scaffold(
          backgroundColor: themecontroller.backgoundcolor,
          resizeToAvoidBottomInset: true,
          body: ModelViewer(
            backgroundColor: Color.fromARGB(0xFF, 0xEE, 0xEE, 0xEE),
            src: 'assets/images/car.glb',
            alt: 'A 3D model of an astronaut',
            ar: true,
            arModes: ['scene-viewer', 'glb', 'quick-look'],
            autoRotate: true,
            iosSrc: 'assets/images/car.glb',
            disableZoom: true,
          ),
        ),
      );
    });
  }
}
