// import 'dart:developer';
// import 'package:modeling_app/MVC/model/userModel.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../services/app_service.dart';

// class DataStroge extends GetxController {
//   static DataStroge? _instance;
//   static DataStroge get getInstance => _instance ??= DataStroge();
//   late SharedPreferences _pref;

//   late Map<String, dynamic> headersMap;

//   Future<SharedPreferences> _initPrefs() async {
//     _pref = await SharedPreferences.getInstance();
//     return _pref;
//   }

//   final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
//   static RxString userName = ''.obs;
//   static RxString userEmail = ''.obs;
//   static RxString userImage = ''.obs;
//   static RxString userPhone = ''.obs;
//   static RxString userToken = ''.obs;
//   static RxString fcmToken = ''.obs;
//   static RxString DeviceID = ''.obs;
//   static RxString currentUserId = ''.obs;
//   static RxString userDetailsStatus = ''.obs;
//   static RxString totalLoanLimit = ''.obs;
//   static RxString MiniLoanLimit = ''.obs;
//   static RxString processingfee = ''.obs;
//   static RxString remainingAmount = ''.obs;
//   static RxString userDetailsDeclinedAt = ''.obs;
//   Future initiateSession() async {
//     log("initiateSession called");
//     await _initPrefs();
//     headersMap = {
//       'Authorization': 'Bearer ${_pref.getString('token')}',
//     };

//     AppService.getInstance.updateDioHeaders();
//   }

//   // insertUserKycData(
//   //     var isKycAdded,
//   //     var Kycname,
//   //     var Kycdob,
//   //     var cardNumber,
//   //     var KYCFrontimage,
//   //     var KYCBackimage,
//   //     var documentOption,
//   //     var Myimage) async {
//   //   final SharedPreferences? prefs = await _prefs;

//   //   await prefs?.setString('isKycAdded', isKycAdded);
//   //   await prefs?.setString('Kycname', Kycname);
//   //   await prefs?.setString('Kycdob', Kycdob);
//   //   await prefs?.setString('cardNumber', cardNumber);
//   //   await prefs?.setString('KYCFrontimage', KYCFrontimage);
//   //   await prefs?.setString('KYCBackimage', KYCBackimage);
//   //   await prefs?.setString('documentOption', documentOption);
//   //   await prefs?.setString('Myimage', Myimage);

//   //   isKycAdded.value = isKycAdded;
//   //   Kycname.value = Kycname;
//   //   Kycdob.value = Kycdob;
//   //   cardNumber.value = cardNumber;
//   //   KYCFrontimage.value = KYCFrontimage;
//   //   KYCBackimage.value = KYCBackimage;
//   //   documentOption.value = documentOption;
//   //   Myimage.value = Myimage;
//   // }

//   insertUserData(UserModel userData) async {
//     final SharedPreferences? prefs = await _prefs;

//     await prefs?.setString('token', userData.token!);
//     await prefs?.setString('id', userData.id.toString());
//     await prefs?.setString('name', userData.username);
//     await prefs?.setString('email', userData.email);
//     await prefs?.setString('phone_number', userData.phone);
//     await prefs?.setString(
//         'totalLoanLimit', userData.wallet!.totalLoanLimit.toString());

//     await prefs?.setString(
//         'userDetailsStatus', userData.userDetailsStatus.toString());
//     var image = "https://server.paisaaloan.com/${userData.image}";
//     await prefs?.setString('userImage', image);
//     await initiateSession();
//     userName.value = userData.username;
//     userEmail.value = userData.email;
//     userDetailsStatus.value = userData.userDetailsStatus.toString();
//     totalLoanLimit.value = userData.wallet!.totalLoanLimit.toString();
//     userPhone.value = userData.phone;
//     userToken.value = userData.token!;
//     userImage.value = image.toString();
//     currentUserId.value = userData.id.toString();
//   }

//   updateUserImage(String image) async {
//     final SharedPreferences? prefs = await _prefs;
//     image = "https://server.paisaaloan.com/${image}";
//     await prefs?.setString('userImage', image);

//     await initiateSession();

//     userImage.value = image.toString();
//     print("user Profile: ${userImage.value}");
//   }

//   checkuserData(UserModel userData) async {
//     final SharedPreferences? prefs = await _prefs;
//     DateTime newDate = userData.userDetailsDeclinedAt!.add(Duration(days: 90));
//     await prefs?.setString('name', userData.username);
//     await prefs?.setString('email', userData.email);
//     await prefs?.setString('phone_number', userData.phone);
//     await prefs?.setString(
//         'totalLoanLimit', userData.wallet!.totalLoanLimit.toString());
//     await prefs?.setString(
//         'userDetailsStatus', userData.userDetailsStatus.toString());
//     await prefs?.setString('userDetailsDeclinedAt',
//         "${newDate.day}/${newDate.month}/${newDate.year}");
//     // await prefs?.setString('image', image);
//     await initiateSession();
//     userName.value = userData.username;
//     totalLoanLimit.value = userData.wallet!.totalLoanLimit.toString();
//     userDetailsDeclinedAt.value =
//         "${newDate.day}/${newDate.month}/${newDate.year}";
//     userEmail.value = userData.email;
//     userDetailsStatus.value = userData.userDetailsStatus.toString();
//     // userRole.value = userData.userRole;
//     userPhone.value = userData.phone;
//     currentUserId.value = userData.id.toString();
//   }

//   insertDeviceAndFCMInformation({FcmToken, deviceID}) async {
//     final SharedPreferences? prefs = await _prefs;
//     await prefs?.setString('fcmToken', FcmToken);
//     await prefs?.setString('DeviceID', deviceID);

//     fcmToken.value = FcmToken;
//     DeviceID.value = deviceID;
//   }

//   Future setTokenAuth(String authToken) async {
//     await _initPrefs();
//     _pref.setString('token', authToken);
//     await initiateSession();
//     return true;
//   }

//   updateUserData({name, Phone, email, photo}) async {
//     final SharedPreferences? prefs = await _prefs;

//     if (photo != "") {
//       await prefs?.setString('fullName', name);
//       await prefs?.setString('email', email);
//       await prefs?.setString('photo', photo);
//       await prefs?.setString('phone_number', Phone);
//       userName.value = name;
//       userImage.value = photo;
//       userEmail.value = email;
//       userPhone.value = Phone;
//     } else {
//       await prefs?.setString('email', email);
//       await prefs?.setString('fullName', name);
//       await prefs?.setString('phone_number', Phone);
//       userName.value = name;
//       userEmail.value = email;
//     }
//   }

//   getUserData() async {
//     final SharedPreferences? prefs = await _prefs;
//     userToken.value = prefs?.getString('token') ?? "";

//     userName.value = prefs?.getString('name') ?? "";

//     userEmail.value = prefs?.getString('email') ?? "";

//     userImage.value = prefs?.getString('userImage') ?? "";

//     userPhone.value = prefs?.getString('phone_number') ?? "";
//     totalLoanLimit.value = prefs?.getString('totalLoanLimit') ?? "";

//     currentUserId.value = prefs?.getString('id') ?? "";
//     userDetailsStatus.value = prefs?.getString('userDetailsStatus') ?? "";
//   }

//   logout() async {
//     final SharedPreferences prefs = await _prefs;
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     await preferences.clear();
//     await initiateSession();

//     userName.value = '';
//     userEmail.value = '';
//     userImage.value = '';
//     userPhone.value = '';
//     userToken.value = '';
//     currentUserId.value = '';
//     // var tokenuser = prefs.getString('token') ?? "";
//     log('Shared Preference Clear $userToken');
//   }
// }
