import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starrizz/app/customWidgets/component/success_page.dart';
import 'package:starrizz/app/modules/authentication/star_user/manual_sign_up.dart';

class StarRizzLogin extends StatefulWidget {
  const StarRizzLogin({super.key});

  @override
  State<StarRizzLogin> createState() => _StarRizzLoginState();
}

class _StarRizzLoginState extends State<StarRizzLogin> {
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
                "Verify Your Identity",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 24.sp,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                "Verify your identity by linking your official\nsocial media account",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: Colors.black.withOpacity(0.7)),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SuccessPage(),
                    ),
                  );
                },
                child: Container(
                  height: 55,
                  padding: EdgeInsets.all(8.w),
                  margin: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                          color: const Color(0xff747474).withOpacity(0.4),
                          width: 0.6)),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("assets/image/x.png"),
                      ),
                      Text(
                        "   Continue with X",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SuccessPage()),
                  );
                },
                child: Container(
                  height: 55,
                  padding: EdgeInsets.all(8.w),
                  margin: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                          color: const Color(0xff747474).withOpacity(0.4),
                          width: 0.6)),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("assets/image/insta.png"),
                      ),
                      Text(
                        "   Continue with instagram",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 4.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Or verify ",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: Colors.black),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const StarManualLogin()),
                      );
                    },
                    child: Text(
                      "manually ",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                          color: Colors.blueAccent),
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height / 40),
            ],
          ),
        ),
      ),
    );
  }
}
