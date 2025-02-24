
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../appColor/color.dart';

class CustomInput extends StatelessWidget {
  CustomInput({
    super.key,
    required this.hint,
    required this.pass,
    this.secure,
    required this.controller,
    required this.validator,
    this.suffixIcon,
    this.prefixIcon,
    this.maxLine,
    this.fill,
    this.lable,
    this.color,
    this.keyboardType,
  });
  Widget? suffixIcon;
  Widget? prefixIcon;
  String? lable;
  String hint = "";

  bool? pass = false;
  bool? fill = false;
  int? maxLine;

  bool? secure = false;
  TextInputType? keyboardType;
  TextEditingController controller;
  String? Function(String?) validator;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextFormField(

        maxLines: maxLine ?? 1,
        autovalidateMode: AutovalidateMode.always,
        controller: controller,
        keyboardType: keyboardType ?? TextInputType.text,
        obscuringCharacter: "*",
        obscureText: secure ?? false,
        style: GoogleFonts.poppins(fontSize: 12.sp),
        cursorColor: Colors.black.withOpacity(0.5),
        decoration: InputDecoration(
          labelText: lable,
          labelStyle: GoogleFonts.poppins(
              color: Colors.grey, fontWeight: FontWeight.w400),

            filled: true,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 12),
            fillColor: fill == true ? Colors.white : Colors.transparent,
            hintText: hint,
            suffixIcon: suffixIcon,
            prefix: prefixIcon,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.grey),
              borderRadius: BorderRadius.circular(10.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.grey),
              borderRadius: BorderRadius.circular(10.0),
            ),
            hintStyle: GoogleFonts.poppins(
                color: Colors.grey, fontWeight: FontWeight.w400)),
      ),
    );
  }
}
