import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:starrizz/app/customWidgets/component/customButton.dart';
import 'package:starrizz/app/customWidgets/component/customText.dart';
import 'package:starrizz/app/customWidgets/component/success_page.dart';
import 'package:starrizz/app/modules/authentication/normal_user/bloc/loginBloc.dart';
import 'package:starrizz/app/modules/authentication/normal_user/bloc/loginEvent.dart';
import 'package:starrizz/app/modules/authentication/normal_user/bloc/loginState.dart';

import '../../../customWidgets/component/loader.dart';
import '../../dashBoard/dashboard/dashboard.dart';

class Verify extends StatefulWidget {
  const Verify({super.key});

  @override
  State<Verify> createState() => _VerifyState();
}
LogInBloc loginBloc=LogInBloc();
class _VerifyState extends State<Verify> {
  final defaultPinTheme = PinTheme(
    width: 56.h,
    height: 56.h,
    textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(20),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(CupertinoIcons.back),
        title: Row(
          children: [
            const Spacer(),
            Image.asset(
              "assets/image/star.png",
              scale: 4,
            )
          ],
        ),
      ),
      body: BlocListener<LogInBloc, UserLoginState>(
        listener: (context, state) {
          if(state is LoginSuccess){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SuccessPage(),
              ),
            );
          }

          // TODO: implement listener}
        },
        child: BlocBuilder<LogInBloc, UserLoginState>(
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.only(left: 20.0.sp, right: 20.0.sp, top: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                      text: "Enter Code", size: 24.sp, weight: FontWeight.w900),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomText(
                      text:
                      "We’ve sent an SMS with an activation code to your Email / Mobile",
                      size: 14.sp,
                      weight: FontWeight.w400),
                  SizedBox(
                    height: 40.h,
                  ),
                  Center(
                    child: Pinput(
                      controller: loginBloc.otpController,
                      length: 5,
                      defaultPinTheme: defaultPinTheme,
                      focusedPinTheme: defaultPinTheme.copyDecorationWith(
                        border: Border.all(color: Colors.green),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      submittedPinTheme: defaultPinTheme.copyWith(
                        decoration: defaultPinTheme.decoration?.copyWith(
                          color: Colors.grey.shade50,
                        ),
                      ),
                      validator: (s) {
                        return s == '2222'
                            ? null
                            : 'Wrong code, please try again';
                      },
                      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                      showCursor: true,
                      onCompleted: (pin) => print(pin),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: CustomText(
                          text: "I didn’t receive a code  ",
                          size: 15.sp,
                          weight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                      Center(
                        child: CustomText(
                            text: "Resend",
                            size: 15.sp,
                            weight: FontWeight.w700),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 100.h,
                  ),
                  state is LoginLoading
                      ? LoadingCircularComponent()
                      : CustomButton(
                      name: "Verify",
                      tap: () {
                        context.read<LogInBloc>()
                            .add(PhoneVerifyEvent(
                          loginBloc.phone.text,
                          loginBloc.otpController.text,

                        ));

                      }),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
