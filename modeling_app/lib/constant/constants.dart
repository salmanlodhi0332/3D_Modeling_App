class Constants {
  static const double screenPadding = 20;
  static const String currency = '৳';
  static var API_HOST = "";

  static final PostRegister = "$API_HOST/user/register";
  static final PostLogin = "$API_HOST/user/phone-login";
  static final verifyotp = "$API_HOST/user/verify-otp";
  static final resendotp = "$API_HOST/user/resend-otp";
  static final saveFcmToken = "$API_HOST/user/save-fcm-token";
  static final addUserDetails = "$API_HOST/user-details";
  static final BankApi = "$API_HOST/bank";
  static final GetBankApi = "$API_HOST/bank/my";
  static final loanApi = "$API_HOST/loan";
  static final GetloanApi = "$API_HOST/loan/my";
  static final NIC_Sendotp = "$API_HOST/user-details/kyc/generate-otp";
  static final NIC_Verifyotp = "$API_HOST/user-details/kyc/verify-otp";
  static final NotificationApi = "$API_HOST/notification";
  static final communicationApi = "$API_HOST/communication";
  static final GetProfileApi = "$API_HOST/user/profile";
  static final GetSettingApi = "$API_HOST/setting";
  static final EditprofileApi = "$API_HOST/user/update-profile";
  static final payinstallmentsApi = "$API_HOST/loan/pay/";
  
}
