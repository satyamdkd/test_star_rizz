import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../customWidgets/component/customButton.dart';
import '../../../../customWidgets/component/customInput.dart';
import '../../../../customWidgets/component/customText.dart';
class PersonalCheckInfo extends StatefulWidget {
  const PersonalCheckInfo({super.key});

  @override
  State<PersonalCheckInfo> createState() => _PersonalCheckInfoState();
}

class _PersonalCheckInfoState extends State<PersonalCheckInfo> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold
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
              CustomText(text: "Personal Check Info", size: 24, weight: FontWeight.w500),
              SizedBox(height:20.h),

              SizedBox(height:10.h),
              CustomInput(hint: "Name", pass: false, controller: TextEditingController(), validator: (j){}),

              SizedBox(height:10.h),
              CustomInput(hint: "Address", pass: false, controller: TextEditingController(), validator: (j){}),
              SizedBox(height: 20.h,),
              CustomText(text: "Apt/Suite/PO Box:", size: 16, weight: FontWeight.w700),
              SizedBox(height:10.h),
              CustomInput(hint: "Apt/Suite/PO Box:", pass: false, controller: TextEditingController(), validator: (j){}),

              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column( crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(text: "State", size: 16, weight: FontWeight.w700),
                      SizedBox(height:10.h),
                      SizedBox(
                          width: 150,
                          child: CustomInput(hint: "state", pass: false, controller: TextEditingController(), validator: (j){})),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(text: "Zip Code", size: 16, weight: FontWeight.w700),
                      SizedBox(height:10.h),
                      SizedBox(
                          width: 150,
                          child: CustomInput(hint: "Zip Code", pass: false, controller: TextEditingController(), validator: (j){})),
                    ],
                  ),

                ],
              ),



              CustomText(text:'''Disclaimer: Personal checks take 5-10 days to arrive by mail.''',
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
