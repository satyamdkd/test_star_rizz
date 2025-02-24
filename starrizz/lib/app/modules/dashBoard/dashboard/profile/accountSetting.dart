import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:starrizz/app/appColor/color.dart';
import 'package:starrizz/app/modules/dashBoard/dashboard/addAddress/addAddress.dart';
import 'package:starrizz/app/modules/dashBoard/dashboard/profile/deposit.dart';

import '../../../../customWidgets/component/customText.dart';
class AccountSetting extends StatefulWidget {
  const AccountSetting({super.key});

  @override
  State<AccountSetting> createState() => _AccountSettingState();
}

class _AccountSettingState extends State<AccountSetting> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(backgroundColor: Colors.white,
      appBar:  AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(decoration: BoxDecoration(shape: BoxShape.circle,border:Border.all(color: Colors.grey) ),
              child: Icon(Icons.arrow_back),
            ),
          ),
        ),
        title: CustomText(text: "Account Settings", size: 18, weight: FontWeight.w700),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(text: "Account Settings", size: 20, weight: FontWeight.w500),
SizedBox(height: 20.h,),
            GestureDetector(onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Deposit()));
            },
              child: ListTile(
                leading: Icon(Icons.credit_card,color: AppColors.primaryColor,),

                title:CustomText(text: "Deposit", size: 16, weight: FontWeight.w500),
                trailing: Icon(CupertinoIcons.forward,color: Colors.grey,),
              ),
            ),
            Divider(color: Colors.grey.withOpacity(0.4),),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AddAddress()));
              },

              child: ListTile(
                leading: Icon(CupertinoIcons.building_2_fill,color: AppColors.grey,),

                title:CustomText(text: "Address", size: 16, weight: FontWeight.w500),
                trailing: Icon(CupertinoIcons.forward,color: Colors.grey,),
              ),
            ),
            Divider(color: Colors.grey.withOpacity(0.4),),

          ],

        ),
      ),

    );
  }
}
