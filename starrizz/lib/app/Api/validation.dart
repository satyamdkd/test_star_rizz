import 'package:flutter/material.dart';
import 'package:starrizz/app/appColor/color.dart';
String imageBaseUrl = "";
String cartProductNo = "0";
String passwordMessage =
    "Password must have at least 8 Characters and at least 1 Uppercase Character, Lowercase Character, 1 Numeric and 1 Special Character";
String emailMessage = "Please enter valid Email ID";
String firstNameEmpty = "Please enter Name";
String unauthenticatedError = "Unauthenticated 401 ";
String emailEmpty = "Please enter Email ID.";
String phoneEmpty = "Please enter phone number";
String holderNameEmpty = "Please enter card holder name";
String cardNumberEmpty = "Please enter card number";
String expireEmpty = "Please enter expiry date";
String otpBlank = "Please Enter OTP ";
String otpLength = "OTP should be 6 digits";

String cvvEmpty = "Please enter cvv number";
String phoneMessage = "Please enter valid phone number";
String passwordEmpty = "Please enter password";
String passwordLength = "Password length should be between 8 to 16 Character ";
String newPasswordEmpty = "Please enter new password";
String confirmPasswordEmpty = "Please repeat your password.";
String oldPasswordEmpty = "Please enter old password";
String confirmPasswordValidation =
    "New Password and Confirm Password does not match";
String mainConfirmPasswordValidation =
    "New Password and Confirm Password does not match";

String onlyCharValidation =
    "Name should not contain any special characters and numbers!";
RegExp validateEmail = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
RegExp firstName = RegExp("[ a-zA-Z]");
// RegExp validationName = RegExp(r'^[a-zA-Z]');
RegExp validationName = RegExp(r'^[A-Z a-z]+$');
RegExp validatePassword =
RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,16}$');
// RegExp validateNumber = RegExp(r'[0-9]{10,12}$)');
RegExp fullName = RegExp(r'^(?=.*[A-Za-z]).{2,}');
RegExp phoneNumberValidate =
RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
String connecting = "Connecting...";
String loading = "Please wait...";
String serverError = "Server not responding, Please retry";
String somethingWentWrong = "Something went wrong.";
String unableToParse = "Issue in Response Parsing";
String endPointError = "Method end point is in-correct";
String successfullyParse = "done";
String internetConnectionError =
    "You have no internet connection. Please enable Wi-fi or Mobile Data and try again";

toastgeterrormessage(BuildContext context, String message) {
  if (message == "Null check operator used on a null value" ||
      message == "Throw of null.") {
    showToast(context, serverError);
  } else {
    showToast(context, message);
  }
}

showToast(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
      backgroundColor: AppColors.primaryColor));
}



