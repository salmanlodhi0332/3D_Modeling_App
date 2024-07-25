import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modeling_app/components/spring_widget.dart';
import 'package:modeling_app/constant/constants.dart';
import 'package:modeling_app/constant/theme.dart';
import 'package:modeling_app/data/mockData.dart';
import 'package:modeling_app/helper/getx_helper.dart';
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

  final controllersProvider = Get.put(GetxControllersProvider());
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
              const SizedBox(height: 10),
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                    mainAxisSpacing: 20.sp,
                    crossAxisSpacing: 20.sp),
                itemCount: MockData.bgImages.length,
                itemBuilder: (BuildContext context, int index) {
                  return SpringWidget(
                    onTap: () {
                      controllersProvider.backgoundImage.value =
                          MockData.bgImages[index]['image']!;
                      Navigator.pop(context);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.sp),
                      child: Image.asset(
                        'assets/images/${MockData.bgImages[index]['image']}', // Replace with your background image path
                        fit: BoxFit.cover,
                      ),
                    ),
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
