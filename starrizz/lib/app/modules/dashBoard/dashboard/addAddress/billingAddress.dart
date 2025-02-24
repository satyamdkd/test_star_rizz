import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starrizz/app/customWidgets/component/customButton.dart';

import '../../../../customWidgets/component/customText.dart';
import '../../../../customWidgets/component/sttateList.dart';
class BillingAddress extends StatefulWidget {
  const BillingAddress({super.key});

  @override
  State<BillingAddress> createState() => _BillingAddressState();
}

class _BillingAddressState extends State<BillingAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(children: [
          GestureDetector(
            onTap: (){},
            child: Container(
              padding:
              EdgeInsets.symmetric(vertical: 6.h, horizontal: 16.w),
              height:  50,
              width:  150,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                color:Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                  "Cancel",
                  style: GoogleFonts.poppins(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize:  16.sp),
                ),
              ),
            ),
          ),Spacer(),
          SizedBox( width:  150,
            child: CustomButton(

                name: "Save", tap: (){
                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>Sttatelist()));
            }),
          )
        ],),
      ),
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
            onTap: (){},
            child: Icon(CupertinoIcons.back)),
        title:
        CustomText(text: "Billing Address", size: 18, weight: FontWeight.w700),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
                text: "For estimating if the place is opened or closed on the weekends.",
                size: 14,
                weight: FontWeight.w700,color: Colors.grey,),
            SizedBox(
              height: 10.h,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "Address *",
                          size: 14,
                          weight: FontWeight.w600,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        CustomText(
                            text: "Leibnizstraße 16, Wohnheim 6, No: 8X ",
                            size: 14.sp,
                            weight: FontWeight.w600),
                        SizedBox(
                          height: 5.h,
                        ),
                      ],
                    ),
                    Spacer(),
                    Image.asset("assets/image/location.png"),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "City *",
                          size: 14,
                          weight: FontWeight.w600,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        CustomText(
                            text: "Clausthal-Zellerfeld ",
                            size: 14.sp,
                            weight: FontWeight.w600),
                        SizedBox(
                          height: 5.h,
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.arrow_drop_down_sharp)
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "Country *",
                          size: 14,
                          weight: FontWeight.w700,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        CustomText(
                            text: "German",
                            size: 14.sp,
                            weight: FontWeight.w600),
                        SizedBox(
                          height: 5.h,
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.arrow_drop_down_sharp)
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "Zipcode *",
                          size: 14,
                          weight: FontWeight.w700,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        CustomText(
                            text: "224132",
                            size: 14.sp,
                            weight: FontWeight.w600),
                        SizedBox(
                          height: 5.h,
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.arrow_drop_down_sharp)
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),




          ],
        ),
      ),
    );
  }
}
