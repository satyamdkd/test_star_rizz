
import 'package:equatable/equatable.dart';

import 'loginModel.dart';



abstract class UserLoginState extends Equatable {
  const UserLoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends UserLoginState {}

class LoginLoading extends UserLoginState {}


class LoginSuccess extends UserLoginState {
  final LoginModel loginModel;
  const LoginSuccess(
      this.loginModel

      );

}
class VerifySuccess extends UserLoginState {
  final LoginModel loginModel;
  const VerifySuccess(
      this.loginModel

      );

}
class LoginPhoneSuccess extends UserLoginState {
  final LoginModel loginModel;
  const LoginPhoneSuccess(
      this.loginModel

      );

}

class LoginFailure extends UserLoginState {
  final String error;

  const LoginFailure(this.error);

  @override
  List<Object> get props => [error];
}
