// import 'dart:convert';
// import 'dart:developer';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:starrizz/app/modules/authentication/normal_user/bloc/loginModel.dart';
//
//
// import 'homeEvent.dart';
// import 'homeState.dart';
//
// class LogInBloc extends Bloc<UserEvent, UserLoginState> {
//   TextEditingController email = TextEditingController();
//   TextEditingController password = TextEditingController();
//   TextEditingController phone = TextEditingController();
//   TextEditingController otp = TextEditingController();
//
//   LogInBloc() : super(LoginInitial()) {
//     on<LogInEvent>(_onLoginRequested);
//     on<LogInPhoneEvent>(_onLoginPhone);
//     on<PhoneVerifyEvent>(_onPhoneVerify);
//   }
//
//   Future<void> _onLoginRequested(
//     LogInEvent event,
//     Emitter<UserLoginState> emit,
//   ) async {
//     log("commit");
//
//     emit(LoginLoading());
//     if (event.email.trim().isEmpty) {
//       emit(const LoginFailure('Please enter email'));
//     }
//   else
//       if (validateEmail.hasMatch(event.email.trim()) == false) {
//         emit(const LoginFailure('Please enter a valid email address'));
//       }
//
//     else if (event.password.trim().isEmpty) {
//       emit(const LoginFailure('Please enter password'));
//     } else if (validatePassword.hasMatch(event.password) == false) {
//       emit(LoginFailure(passwordMessage));
//     }
//
//     else{
//       try {
//
//         emit(LoginLoading());
//         final response =
//         await Network().postData(endPoint: '/auth/registerlogin', data: {
//           "email": event.email,
//           "password": event.password,
//         });
//
//         if (response is ApiSuccess) {
//           LoginModel loginModel;
//
//
//           loginModel=LoginModel.fromJson(response.data);
//
//           emit(LoginSuccess(loginModel));
//           log(response.data.toString());
//
//
//
//
//         } else if (response is ApiFailure) {
//           log("fail");
//
//           emit(LoginFailure(response.message));
//         }
//       } catch (e) {
//         log("error");
//
//         if (e is ApiFailure) {
//           emit(LoginFailure(e.message));
//         }else emit(LoginFailure(e.toString()));
//       }
//
//
//   }}
//
//   Future<void> _onLoginPhone(
//       LogInPhoneEvent event,
//       Emitter<UserLoginState> emit,
//       ) async {
//     log("commit");
//
//     emit(LoginLoading());
//     if (event.phone.trim().isEmpty) {
//       emit(const LoginFailure('Please enter Phone No'));
//     }
//
//
//     else{
//       try {
//
//         emit(LoginLoading());
//         final response =
//         await Network().postData(endPoint: '/auth/phone', data: {
//           "phone": event.phone,
//
//         });
//
//         if (response is ApiSuccess) {
//           LoginModel loginModel;
//
//
//           loginModel=LoginModel.fromJson(response.data);
//
//           emit(LoginPhoneSuccess(loginModel));
//           log(response.data.toString());
//
//
//
//
//         } else if (response is ApiFailure) {
//           log("fail");
//
//           emit(LoginFailure(response.message));
//         }
//       } catch (e) {
//         log("error");
//
//         if (e is ApiFailure) {
//           emit(LoginFailure(e.message));
//         }else emit(LoginFailure(e.toString()));
//       }
//
//
//     }}
//   Future<void> _onPhoneVerify(
//       PhoneVerifyEvent event,
//       Emitter<UserLoginState> emit,
//       ) async {
//     log("commit");
//
//     emit(LoginLoading());
//     if (event.phone.trim().isEmpty) {
//       emit(const LoginFailure('Please enter Phone No'));
//     }
//
// else  if (event.otp.trim().isEmpty) {
//       emit(const LoginFailure('Please enter Phone No'));
//     }
//     else{
//       try {
//
//         emit(LoginLoading());
//         final response =
//         await Network().postData(endPoint: '/auth/phone/verify', data: {
//           "phone": event.phone,
//           "otp":event.otp,
//
//         });
//
//         if (response is ApiSuccess) {
//           LoginModel loginModel;
//
//
//           loginModel=LoginModel.fromJson(response.data);
//
//           emit(LoginPhoneSuccess(loginModel));
//           log(response.data.toString());
//
//
//
//
//         } else if (response is ApiFailure) {
//           log("fail");
//
//           emit(LoginFailure(response.message));
//         }
//       } catch (e) {
//         log("error");
//
//         if (e is ApiFailure) {
//           emit(LoginFailure(e.message));
//         }else emit(LoginFailure(e.toString()));
//       }
//
//
//     }}
//
// }
