import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:starrizz/app/appColor/color.dart';
import 'package:starrizz/app/customWidgets/component/customButton.dart';
import 'package:starrizz/app/modules/transactionHistory/transactionHistory.dart';

import '../../customWidgets/component/customText.dart';
import 'coinfilp.dart';

class Transfer extends StatelessWidget {
  const Transfer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 250,

          child: Column(
            children: [
              SizedBox(height: 100.h,),
              CustomText(text: 'Your Balance',weight: FontWeight.w600,size: 22.sp,color: Colors.white,),
              SizedBox(height: 10,),
              CustomText(text: '\$ 507',weight: FontWeight.w800,size: 35.sp,color: Colors.white,),
            ],
          ),

          decoration: BoxDecoration(

              color: AppColors.primaryColor,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),bottomRight: Radius.circular(25))),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: CustomButton(name: "Transfer To Bank", tap: (){

        // Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
          }),
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: CustomButton(name: "Transaction History", tap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>TransactionHistory()));
          }),
        ),
        SizedBox(height: 100),
      ],
    ),
    );
  }
}
