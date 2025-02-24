// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../appColor/color.dart';


class LoadingCircularComponent extends StatelessWidget {
  final Color? indicatorColor;
  final double? getSize;
  const LoadingCircularComponent(
      {super.key, this.indicatorColor, this.getSize});

  @override
  Widget build(BuildContext context) {
    return Container(padding:
   EdgeInsets.symmetric(vertical: 6.h, horizontal: 16.w),
      height:  50,
      decoration: BoxDecoration(
        color:  AppColors.primaryColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: CupertinoActivityIndicator(
          color: AppColors.white,
          radius:14,
          animating: true,
        ),
      ),
    );
  }
}
