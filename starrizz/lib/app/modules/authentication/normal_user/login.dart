import 'dart:developer';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:starrizz/app/customWidgets/component/customButton.dart';
import 'package:starrizz/app/customWidgets/component/customInput.dart';
import 'package:starrizz/app/customWidgets/component/customText.dart';
import 'package:starrizz/app/modules/authentication/component/verify.dart';
import 'package:starrizz/app/modules/dashBoard/dashboard/dashboard.dart';

import '../../../Api/validation.dart';
import '../../../customWidgets/component/loader.dart';
import 'bloc/loginBloc.dart';
import 'bloc/loginEvent.dart';
import 'bloc/loginState.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final loginBloc = LogInBloc();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
        body: SingleChildScrollView(
          child: BlocListener<LogInBloc, UserLoginState>(
            listener: (context, state) async {
              if(state is LoginPhoneSuccess){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Verify()),
                );

              }else
              if (state is LoginFailure) {
                showToast(context, state.error.toString());
              } else if (state is LoginSuccess) {
                final SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                prefs.setInt('userId', state.loginModel.user!.id!);
                prefs.setString("email", state.loginModel.user!.email!);
                prefs.setString("token", state.loginModel.token!);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Dashboard()),
                );
              }
            },
            child: BlocBuilder<LogInBloc, UserLoginState>(
              builder: (context, state) {
                return Column(
                  children: [
                    const TabBar(
                      indicatorColor: Colors.black,
                      unselectedLabelColor: Colors.black,
                      labelColor: Colors.black,
                      indicatorSize: TabBarIndicatorSize.tab,
                      tabs: [
                        Tab(text: "Email"),
                        Tab(text: "Phone"),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height -
                          MediaQuery.of(context).size.height / 5,
                      child: TabBarView(children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 20.0.sp, right: 20.0.sp, top: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20.h,
                              ),
                              CustomText(
                                  text: "Email address",
                                  size: 14.sp,
                                  weight: FontWeight.w500),
                              SizedBox(height: 8.h),
                              CustomInput(
                                  hint: "example@dkd.co.in",
                                  pass: false,
                                  controller: loginBloc.email,
                                  validator: (l) {}),
                              SizedBox(
                                height: 16.h,
                              ),
                              CustomText(
                                  text: "Password",
                                  size: 14.sp,
                                  weight: FontWeight.w500),
                              SizedBox(height: 8.h),
                              CustomInput(
                                  hint: "*******",
                                  pass: true,
                                  controller: loginBloc.password,
                                  validator: (l) {}),
                              SizedBox(
                                height: 16.h,
                              ),
                              GestureDetector(
                                onTap: () {
                                  showDialog(context: context, builder: (BuildContext context){
                                    return AlertDialog(
                                      content:    SizedBox(
                                        height: 350,
                                        width: MediaQuery.of(context).size.width,
                                        child: Column(
                                          children: [
                                            CustomText(text: "Please enter your mail id ", size: 15, weight: FontWeight.w500),
                                            SizedBox(height: 50,),
                                            CustomInput(hint: "email", pass: false, controller: TextEditingController(), validator: (k){}),

                                       SizedBox(height: 50,),
                                         CustomButton(name: "Send", tap: (){}),
                                          ],
                                        ),
                                      ),
                                    );
                                    //   SizedBox(height: 400,
                                    //   child: CustomInput(hint: "email", pass: false, controller: TextEditingController(), validator: (k){}),
                                    // );
                                  });
                                },
                                child: CustomText(
                                    text: "Forgot Password ?",
                                    size: 14.sp,
                                    weight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              state is LoginLoading
                                  ? LoadingCircularComponent()
                                  : CustomButton(
                                      name: "Log in",
                                      tap: () {

                                        context.read<LogInBloc>()
                                            .add(LogInEvent(
                                              loginBloc.email.text,
                                              loginBloc.password.text,
                                            ));
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //       builder: (context) => Dashboard()),
                                        // );
                                      }),
                              SizedBox(
                                height: 16.h,
                              ),
                              Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const SizedBox(
                                        width: 120, child: Divider()),
                                    CustomText(
                                        text: "Or login with",
                                        size: 16.sp,
                                        weight: FontWeight.w500),
                                    const SizedBox(
                                        width: 120, child: Divider()),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: 50.h,
                                    width: 80.h,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.sp),
                                        border: Border.all(color: Colors.grey)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                          "assets/image/google.png"),
                                    ),
                                  ),
                                  Container(
                                    height: 50.h,
                                    width: 80.h,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.sp),
                                        border: Border.all(color: Colors.grey)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset("assets/image/x.png"),
                                    ),
                                  ),
                                  Container(
                                    height: 50.h,
                                    width: 80.h,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.sp),
                                        border: Border.all(color: Colors.grey)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child:
                                          Image.asset("assets/image/insta.png"),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 20.0.sp, right: 20.0.sp, top: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20.h,
                              ),
                              CustomText(
                                  text: "Phone No",
                                  size: 14.sp,
                                  weight: FontWeight.w500),
                              SizedBox(height: 8.h),

                              CustomInput(

                                  prefixIcon: GestureDetector(
                                    onTap: (){
                                      showCountryPicker(
                                        context: context,
                                        exclude: <String>['KN', 'MF'], //It takes a list of country code(iso2).
                                        onSelect: (Country country)
                                        {
                                          setState(() {

                                            loginBloc. phoneCode=country.phoneCode;
                                          });

                                          log(country.displayName);
                                          log(country.name);
                                          log(country.flagEmoji);
                                          log(country.phoneCode);
                                          log(country.toString());

                                          print('Select country: ${country.displayName}');},
                                      );
                                    },

                                    child: Text("+"+ " " +loginBloc.phoneCode)),
                                  hint: "",
                                  pass: false,
                                  keyboardType: TextInputType.phone,
                                  controller: loginBloc.phone,
                                  validator: (l) {}),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 5.4,
                              ),
                              state is LoginLoading
                                  ? LoadingCircularComponent()
                                  :CustomButton(
                                name: "Continue",
                                tap: () {

                                  context.read<LogInBloc>()
                                      .add(LogInPhoneEvent(
                                    loginBloc.phone.text,

                                  ));

                                },
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                            ],
                          ),
                        ),
                      ]),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

}
