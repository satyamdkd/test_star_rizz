
import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class LogInEvent extends UserEvent {

  final String email;
  final String password;




  const LogInEvent( this.email, this.password,);

  @override
  List<Object> get props => [email,password,];
}
class LogInPhoneEvent extends UserEvent {

  final String phone;





  const LogInPhoneEvent( this.phone, );

  @override
  List<Object> get props => [phone,];
}
class PhoneVerifyEvent extends UserEvent {

  final String phone;
  final String otp;





  const PhoneVerifyEvent( this.phone,this.otp );

  @override
  List<Object> get props => [phone,otp];
}