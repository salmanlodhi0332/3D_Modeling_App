import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modeling_app/components/spring_widget.dart';
import 'package:modeling_app/constant/constants.dart';
import 'package:modeling_app/constant/theme.dart';
import 'package:modeling_app/data/mockData.dart';
import 'package:modeling_app/MVC/controller/maincontroller.dart';
import 'package:get/get.dart';

class charactorBottomSheet extends StatelessWidget {
  charactorBottomSheet({
    Key? key,
  }) : super(key: key);
  @override

  /// it required two perm context and foraddons
  /// foraddons = true if will work for addons
  /// foraddons = false for normal uploading
  static Future show(BuildContext context) {
    final themecontroller = Get.put(ThemeHelper());

    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50), topRight: Radius.circular(50))),
      builder: (context) {
        return charactorBottomSheet();
      },
    );
  }

  final controllersProvider = Get.put(mainController());
  Widget build(BuildContext context) {
    return GetBuilder<ThemeHelper>(builder: (themecontroller) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.60,
        decoration: BoxDecoration(
            // gradient: themecontroller.containerGradient,
            color: themecontroller.colorwhite,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50), topRight: Radius.circular(50))),
        padding: const EdgeInsets.symmetric(
          vertical: 6,
          horizontal: 6,
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: Constants.screenPadding,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const TextButton(
                    onPressed: null,
                    child: SizedBox(),
                  ),
                  Text(
                    "select Model",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: themecontroller.textcolor,
                    ),
                  ),
                  GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Icon(
                          Icons.close,
                          color: themecontroller.disablecolor,
                        ),
                      ))
                ],
              ),
              const SizedBox(height: 10),
              ListView.builder(
                itemCount: MockData.charactorList.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return SpringWidget(
                    onTap: () async {
                      controllersProvider.Model.value = '';

                      await Timer(Duration(microseconds: 20), () {
                        controllersProvider.Model.value =
                            MockData.charactorList[index]['image']!;
                      });
                      print(controllersProvider.Model.value);
                      // Navigator.pop(context);
                    },
                    child: Padding(
                        padding: EdgeInsets.all(8.sp),
                        child: ListTile(
                          title: Text(
                            'model ${index}',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                  );
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
