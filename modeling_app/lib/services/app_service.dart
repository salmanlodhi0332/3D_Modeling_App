import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:modeling_app/components/BottomNav.dart';
import 'package:modeling_app/constant/constants.dart';
import 'package:dio/src/form_data.dart' as getFormData;
import 'package:dio/src/multipart_file.dart' as getFormDataFile;
import 'package:modeling_app/constant/flutter_toast.dart';
import 'package:modeling_app/constant/navigation.dart';
import '../helper/data_storage.dart';

class AppService {
  static AppService? _instance;
  static AppService get getInstance => _instance ??= AppService();

  late Dio dio;
  final _pref = DataStroge();

  // AppService() {
  //   log("headerMap: ${DataStroge.getInstance.headersMap}");
  //   dio = Dio(
  //     BaseOptions(
  //       baseUrl: Constants.API_HOST,
  //       headers: DataStroge.getInstance.headersMap,
  //     ),
  //   );
  //   print("[AppService] ${DataStroge.getInstance.headersMap}");
  // }
  // void updateDioHeaders() {
  //   if (dio != null) {
  //     dio.options.headers = DataStroge.getInstance.headersMap;
  //   }
  // }

  // searchPlaceApi(BuildContext context, String placesName) async {
  //   try {
  //     var response = await dio.get(Constants.PlaceApi, queryParameters: {
  //       'input': placesName,
  //       'key': Constants.mapApiKey,
  //       'sessiontoken': '1234567890'
  //     });

  //     if (response.statusCode == 200) {
  //       log("searchPlaceApi API =>${response.statusCode}👌✅");
  //       final json = response.data;

  //       final responseData = response.data['predictions'];
  //       if (responseData is List) {
  //         List<PlaceModel> Datalist = (responseData as List)
  //             .map((data) => PlaceModel.fromJson(data))
  //             .toList();

  //         return Datalist;
  //       } else if (responseData is Map) {
  //         List<PlaceModel> Datalist = (responseData as List)
  //             .map((data) => PlaceModel.fromJson(data))
  //             .toList();

  //         return Datalist;
  //       }
  //     } else {
  //       print('Unknown Error Occurred ${(response.data['message'])} ');
  //       FlutterToastDisplay.getInstance
  //           .showToast("${response.data['message']}");
  //     }
  //   } on DioException catch (e) {
  //     if (e.response != null) {
  //       FlutterToastDisplay.getInstance.showToast("${e.response!.data}");
  //       print("Error msg data: ${e.response!.data}");
  //     } else {
  //       print("Error sending data: $e");
  //     }
  //     print(e);
  //   }
  // }

  // Future<void> login(
  //     BuildContext context, String email, String password) async {
  //   try {
  //     print(email);
  //     var response = await dio.post(Constants.driver_login,
  //         data: {"email": email, "password": password});

  //     if (response.statusCode == 200) {
  //       log("login API =>${response.statusCode}👌✅");
  //       final json = response.data;

  //       // AuthResponse UserData = AuthResponse.fromJson(json);

  //       // log("userEmail ${UserData.data.email}");
  //       // log("username ${UserData.data.email}");
  //       // await _pref.insertUserData(UserData.data, UserData.accessToken);
  //       FlutterToastDisplay.getInstance.showToast("Welcome To Kidfit");
  //       Navigation.getInstance
  //           .pagePushAndReplaceNavigation(context, BottomNavBar());
  //     } else {
  //       print('Unknown Error Occurred ${(response.data['message'])} ');
  //       FlutterToastDisplay.getInstance
  //           .showToast("${response.data['message']}");
  //     }
  //   } on DioException catch (e) {
  //     if (e.response != null) {
  //       FlutterToastDisplay.getInstance.showToast("${e.response!}");
  //       print("Error msg data: ${e.response!}");
  //     } else {
  //       print("Error sending data: $e");
  //     }
  //     print(e);
  //   }
  // }

  // // ///Login Function
  // // ///It requires:
  // // ///1) Context
  // // ///2) User Object
  // // ///
  // // ///Return user object and OTP

  // Future<void> DriverRegisteration(
  //     BuildContext context, DriverModel DriverData) async {
  //   try {
  //     var response = await dio.post(Constants.DriverRegister, data: {
  //       "email": DriverData.email,
  //       "deviceId": DriverData.deviceId,
  //       "fcmToken": DriverData.fcmToken,
  //       "password": DriverData.password,
  //       "latitude": "21231",
  //       "longitude": "213123",
  //       "fullName": DriverData.fullName,
  //       "userName": DriverData.userName,
  //       "city": DriverData.city,
  //       "dob": DriverData.dob,
  //       "state": DriverData.state
  //     });

  //     if (response.statusCode == 200) {
  //       log("Registeration API =>${response.statusCode}👌✅");
  //       final json = response.data;

  //       DriverModel UserData = DriverModel.fromJson(json);

  //       // Navigation.getInstance.RightToLeft_PageNavigation(
  //       //     context,
  //       //     SuccessfulScreen(
  //       //       heading: 'Registeration successfully!',
  //       //       content: 'Driver has been registered \nsuccessfully.',
  //       //       Btn_Text: 'continue',
  //       //       onTap: () {
  //       //         Navigation.getInstance.pagePushAndReplaceNavigation(
  //       //             context, VechicleInformationScreen());
  //       //       },
  //       //     ));
  //       FlutterToastDisplay.getInstance
  //           .showToast("${response.data['message']}");
  //       Navigation.getInstance.RightToLeft_PageNavigation(
  //           context,
  //           otpVerificationScreen(
  //             email: DriverData.email,
  //           ));

  //       // FlutterToastDisplay.getInstance
  //       //     .showToast("Your OTP is ${UserData.verificationcode}");
  //     } else {
  //       print('Unknown Error Occurred ${(response.data['message'])} ');
  //       FlutterToastDisplay.getInstance
  //           .showToast("${response.data['message']}");
  //     }
  //   } on DioException catch (e) {
  //     if (e.response != null) {
  //       FlutterToastDisplay.getInstance.showToast("${e.response!.data}");
  //       print("Error msg data: ${e.response!.data}");
  //     } else {
  //       print("Error sending data: $e");
  //     }
  //     print(e);
  //   }
  // }

  // Future<void> checkOtp(BuildContext context, String otpCode) async {
  //   try {
  //     var response = await dio.post(Constants.DriverRegister, data: {
  //       "otp": otpCode,
  //       "time": DateTime.now(),
  //       "driverId": DataStroge.DeviceID.value
  //     });

  //     if (response.statusCode == 200) {
  //       log("checkOtp API =>${response.statusCode}👌✅");
  //       final json = response.data;

  //       DriverModel UserData = DriverModel.fromJson(json);

  //       Navigation.getInstance.RightToLeft_PageNavigation(
  //           context,
  //           SuccessfulScreen(
  //             heading: 'Registeration successfully!',
  //             content: 'Driver has been registered \nsuccessfully.',
  //             Btn_Text: 'continue',
  //             onTap: () {
  //               Navigation.getInstance.pagePushAndReplaceNavigation(
  //                   context, VechicleInformationScreen());
  //             },
  //           ));
  //     } else {
  //       print('Unknown Error Occurred ${(response.data['message'])} ');
  //       FlutterToastDisplay.getInstance
  //           .showToast("${response.data['message']}");
  //     }
  //   } on DioException catch (e) {
  //     if (e.response != null) {
  //       FlutterToastDisplay.getInstance.showToast("${e.response!.data}");
  //       print("Error msg data: ${e.response!.data}");
  //     } else {
  //       print("Error sending data: $e");
  //     }
  //     print(e);
  //   }
  // }

  // Future<void> ResendOtp(BuildContext context, String email) async {
  //   try {
  //     var response = await dio.post(Constants.resendOtp_driver, data: {
  //       "email": email,
  //     });

  //     if (response.statusCode == 200) {
  //       log("ResendOtp API =>${response.statusCode}👌✅");
  //       final json = response.data;

  //       FlutterToastDisplay.getInstance
  //           .showToast("${response.data['message']}");
  //     } else {
  //       print('Unknown Error Occurred ${(response.data['message'])} ');
  //       FlutterToastDisplay.getInstance
  //           .showToast("${response.data['message']}");
  //     }
  //   } on DioException catch (e) {
  //     if (e.response != null) {
  //       FlutterToastDisplay.getInstance.showToast("${e.response!.data}");
  //       print("Error msg data: ${e.response!.data}");
  //     } else {
  //       print("Error sending data: $e");
  //     }
  //     print(e);
  //   }
  // }
}
