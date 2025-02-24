import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:starrizz/app/customWidgets/component/customButton.dart';
import 'package:starrizz/app/customWidgets/component/customInput.dart';

import '../../../../customWidgets/component/customText.dart';
class PaypalInfo extends StatefulWidget {
  const PaypalInfo({super.key});

  @override
  State<PaypalInfo> createState() => _PaypalInfoState();
}

class _PaypalInfoState extends State<PaypalInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold
      (backgroundColor: Colors.white,
      floatingActionButton:   Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomButton(name: "Confirm", tap: (){}),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar:  AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(decoration: BoxDecoration(shape: BoxShape.circle,border:Border.all(color: Colors.grey) ),
              child: Icon(Icons.arrow_back),
            ),
          ),
        ),

      ),
      body: Padding(
        padding:  EdgeInsets.all(20.0.h),
        child: SingleChildScrollView(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: "PayPal Info", size: 24, weight: FontWeight.w500),
              SizedBox(height:20.h),
              CustomText(text: "PayPal Account", size: 16, weight: FontWeight.w500),
              SizedBox(height:10.h),
              CustomInput(hint: "PayPal Account", pass: false, controller: TextEditingController(), validator: (j){}),
              SizedBox(height:20.h),
              CustomText(text: "Confirm PayPal Account", size: 16, weight: FontWeight.w500),
              SizedBox(height:10.h),
              CustomInput(hint: "Confirm PayPal Account", pass: false, controller: TextEditingController(), validator: (j){}),
              SizedBox(height: 20.h,),
              CustomText(text: "Disclaimer:", size: 16, weight: FontWeight.w700),
              CustomText(text:'''PayPal imposes a fee of 6% of total transaction value. To avoid this fee, check our alternate money transfer methods such as bank transfer or personal checks.''',
                  color: Colors.black.withOpacity(0.5),
                  size: 16, weight: FontWeight.w500),


          //Spacer(),


            ],

          ),
        ),
      ),

    );
  }
}
