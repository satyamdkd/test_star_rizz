import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:starrizz/app/appColor/color.dart';
import 'package:starrizz/app/customWidgets/component/customButton.dart';
import 'package:starrizz/app/customWidgets/component/customInput.dart';
import 'package:starrizz/app/customWidgets/component/customText.dart';
import 'package:starrizz/app/modules/authentication/component/verify.dart';

class StarManualLogin extends StatefulWidget {
  const StarManualLogin({super.key});

  @override
  State<StarManualLogin> createState() => _StarManualLoginState();
}

class _StarManualLoginState extends State<StarManualLogin> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SwipeButton(
                thumbPadding: const EdgeInsets.all(4.0),
                thumb: Icon(
                  Icons.double_arrow_rounded,
                  color: AppColors.primaryColor,
                ),
                activeThumbColor: Colors.white,
                activeTrackColor: AppColors.primaryColor,
                onSwipe: () {

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Verify()),
                  );

                },
                child: CustomText(
                  text: "Swipe to send code",
                  size: 14.sp,
                  weight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(20.w),
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 40.h),
                Container(
                  height: 50.h,
                  width: 50.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.w),
                      border: Border.all(width: 0.6, color: Colors.grey),
                      color: Colors.white),
                  child: const Icon(CupertinoIcons.back),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height / 20),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/image/logo.png",
                    scale: 4,
                  ),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height / 20),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Manual Verfication",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400, fontSize: 24.sp),
                  ),
                ),
                SizedBox(height: 4.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    "Enter your social account info where you would like to receive a verification code.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 50.h,
                      width: 80.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          border: Border.all(color: Colors.grey)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("assets/image/google.png"),
                      ),
                    ),
                    Container(
                      height: 50.h,
                      width: 80.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
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
                          borderRadius: BorderRadius.circular(10.sp),
                          border: Border.all(color: Colors.grey)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("assets/image/insta.png"),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                CustomText(
                    text: "Account Name", size: 14.sp, weight: FontWeight.w400),
                SizedBox(height: 8.h),
                CustomInput(
                    hint: "johndoe123",
                    pass: true,
                    controller: TextEditingController(),
                    validator: (l) {}),
                SizedBox(height: 30.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
