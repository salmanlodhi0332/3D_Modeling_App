import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:modeling_app/components/image_widget.dart';
import 'package:modeling_app/components/round_button.dart';
import 'package:modeling_app/components/small_loader.dart';
import 'package:modeling_app/components/spring_widget.dart';
import 'package:modeling_app/constant/constants.dart';
import 'package:modeling_app/constant/theme.dart';
import 'package:modeling_app/data/mockData.dart';
import 'package:modeling_app/MVC/controller/maincontroller.dart';
import 'package:get/get.dart';

class ImageBottomSheet extends StatelessWidget {
  ImageBottomSheet({
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
        return ImageBottomSheet();
      },
    );
  }

  final controllersProvider = Get.put(mainController());
  RxBool uploadLoading = false.obs;

  Widget build(BuildContext context) {
    return GetBuilder<ThemeHelper>(builder: (themecontroller) {
      return Container(
        height: 585.sp,
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
                    "select backgound image",
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
              SizedBox(height: 20.sp),
              Obx(
                () => RoundButton(
                  height: 40.sp,
                  title: 'upload new background',
                  disabled: uploadLoading.value,
                  loading: uploadLoading.value,
                  onTap: () async {
                    uploadLoading.value = true;
                    await controllersProvider.backgroundimage();
                    uploadLoading.value = false;
                    await controllersProvider.GetAllbackground();
                  },
                  gradient: true,
                ),
              ),
              SizedBox(height: 20.sp),
              Expanded(
                child: Obx(
                  () => controllersProvider.loadingbackground.value
                      ? SmallLoader()
                      : controllersProvider.backgroundList.isEmpty
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                    child: Text('No Background Image is added'))
                              ],
                            )
                          : GridView.builder(
                              shrinkWrap: true,
                              primary: true,
                              scrollDirection: Axis.vertical,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 0.8,
                                      mainAxisSpacing: 10.sp,
                                      crossAxisSpacing: 10.sp),
                              itemCount:
                                  controllersProvider.backgroundList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    controllersProvider.backgoundImage.value =
                                        controllersProvider
                                            .backgroundList[index];
                                    Navigator.pop(context);
                                  },
                                  child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(20.sp),
                                      child: ImageWidget(
                                          imageUrl: controllersProvider
                                              .backgroundList[index])),
                                );
                              },
                            ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
