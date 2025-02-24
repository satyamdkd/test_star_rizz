import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../appColor/color.dart';

class CustomButton extends StatelessWidget {
  String name;
  void Function() tap;
  Color? color;
  double? fontSize;
  double? height;
  EdgeInsetsGeometry? padding;
  CustomButton(
      {super.key,
      required this.name,
      required this.tap,
      this.color,
      this.fontSize,
      this.padding,
      this.height});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Container(
        padding:
            padding ?? EdgeInsets.symmetric(vertical: 6.h, horizontal: 16.w),
        height: height ?? 50,
        decoration: BoxDecoration(
          color: color ?? AppColors.primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            name,
            style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: fontSize ?? 16.sp),
          ),
        ),
      ),
    );
  }
}
