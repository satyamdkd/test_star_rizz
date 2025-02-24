import 'dart:developer';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:starrizz/app/customWidgets/component/customText.dart';
import 'package:starrizz/app/modules/dashBoard/dashboard/addAddress/billingAddress.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({super.key});

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  @override
  String flag="";
  String phoneCode="";
  bool save=false;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Icon(CupertinoIcons.back),
        title:
            CustomText(text: "Add Address", size: 18, weight: FontWeight.w700),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("1"),
                ),),
                SizedBox(width: 10,),
                CustomText(
                    text: "Shipping Address",
                    size: 14,
                    weight: FontWeight.w700),
              ],
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
            Row(
              children: [
                GestureDetector(
                  onTap: (){

                    showCountryPicker(
                      context: context,
                      exclude: <String>['KN', 'MF'], //It takes a list of country code(iso2).
                      onSelect: (Country country)
                      {
                        setState(() {
                          flag=country.flagEmoji;
                          phoneCode=country.phoneCode;
                        });

                        log(country.displayName);
                        log(country.name);
                        log(country.flagEmoji);
                        log(country.phoneCode);
                        log(country.toString());

                        print('Select country: ${country.displayName}');},
                    );
                  },
                  child: Container(
                    width: 120.w,
                    height: 60.h,

                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          CustomText(
                              text: flag+"  +"+phoneCode,
                              size: 18.sp,
                              weight: FontWeight.w600),
                          Spacer(),
                          Icon(Icons.arrow_drop_down_sharp)
                        ],
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  width: MediaQuery.of(context).size.width-160.w,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "",
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
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>BillingAddress()));

              },
              child: Row(
                children: [
                  Container(decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey)
                  ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("2"),
                    ),),
                  SizedBox(width: 10,),
                  CustomText(
                      text: "Billing Address",
                      size: 14,
                      weight: FontWeight.w700),
                ],
              ),
            ),
            SizedBox(height: 10.h,),
            Row(
              children: [
              GestureDetector(
                  onTap: (){
                    setState(() {
                      save=!save;
                    });
                  },
                  child: Icon(  save?Icons.check_box:Icons.check_box_outline_blank_outlined,color: Colors.grey,)),
                SizedBox(width: 10.h,),
                CustomText(
                    text: "Save the address for future use?",
                    size: 16.sp,
                    weight: FontWeight.w500),
              ],
            ),

          ],
        ),
      ),
    );
  }

}
