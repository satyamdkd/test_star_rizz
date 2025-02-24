import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starrizz/app/customWidgets/component/customButton.dart';


import '../../modules/starDashBoard/starDashboard.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/image/success_logo.png",
                scale: 4,
              ),
              SizedBox(height: 20.h),
              Text(
                "Success",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w800, fontSize: 24.sp),
              ),
              SizedBox(height: 20.h),
              Text(
                "Your identity is now verified",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: Colors.black.withOpacity(0.6)),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
                  name: 'Go to Home',
                  tap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => StarDashboard()),
                    );
                  },
                  height: 55,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
