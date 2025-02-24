import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starrizz/app/customWidgets/component/appBar.dart';
import 'package:starrizz/app/modules/authentication/star_user/star_login_in.dart';

import '../customWidgets/component/customButton.dart';
import 'authentication/normal_user/login.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(height: MediaQuery.sizeOf(context).height / 5),
              Image.asset(
                "assets/image/logo.png",
                scale: 5,
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height / 10),
              Text(
                "Explore the app",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600, fontSize: 28.sp),
              ),
              SizedBox(height: 4.h),
              Text(
                "Receive physical gifts from your \nfavorites star ",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: Colors.black.withOpacity(0.7)),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
                  name: 'Sign Up or Login',
                  tap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LogIn()),
                    );
                  },
                  height: 55,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const StarRizzLogin()),
                    );
                  },
                  child: Container(
                    height: 55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: const Color(0xff747474), width: 0.6)),
                    child: Center(
                      child: Text(
                        "Star Sign Up",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height / 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Term of service  ",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400, fontSize: 12.sp),
                  ),
                  Text(
                    "Privacy policy ",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400, fontSize: 12.sp),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height / 100),
            ],
          ),
        ),
      ),
    );
  }
}
