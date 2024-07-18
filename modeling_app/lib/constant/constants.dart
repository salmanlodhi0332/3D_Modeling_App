import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constants {
  static const double screenPadding = 10;
  static const String currency = '\$';
  static var API_HOST = "";
  static const String mapApiKey = "AIzaSyAcC8RkFxv3vKg0mEXtqSrZnL32imnLm30";

  static final String PlaceApi ='https://maps.googleapis.com/maps/api/place/autocomplete/json';

  //----DRIVER APP API'S
  static final DriverRegister = "$API_HOST/driver/register";
  static final DriverCheckOtp = "$API_HOST/driver/check-otp";
  static final resendOtp_driver = "$API_HOST/driver/resend-otp";
  static final driver_login = "$API_HOST/driver/login";
  static final driver_forgot_password = "$API_HOST/driver/forgot-password";
}
