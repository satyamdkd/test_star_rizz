import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../appColor/color.dart';

class CustomText extends StatelessWidget {
  String text;
  double size;
  int? maxLines;
  FontWeight weight;
  TextAlign? align;
  Color? color;
  TextScaler? textScaler;
  TextDecoration? decoration;
  CustomText(
      {super.key,
      required this.text,
      required this.size,
      required this.weight,
      this.align,
      this.color,
      this.textScaler,
      this.decoration,
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textScaler: textScaler,
      maxLines: maxLines,
     // overflow: TextOverflow.ellipsis,
      style: GoogleFonts.plusJakartaSans(
        color: color ?? Colors.black,
        fontSize: size,
        decoration: decoration,
        decorationColor: decoration != null ? AppColors.blue : null,
        fontWeight: weight,
      ),
      textAlign: align ?? TextAlign.start,
    );
  }
}
