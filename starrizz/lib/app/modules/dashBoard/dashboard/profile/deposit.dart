

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:starrizz/app/modules/dashBoard/dashboard/profile/paypal.dart';
import 'package:starrizz/app/modules/dashBoard/dashboard/profile/personalCheakInfo.dart';

import '../../../../appColor/color.dart';
import '../../../../customWidgets/component/customText.dart';
class Deposit extends StatelessWidget {
  const Deposit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold
      (backgroundColor: Colors.white,
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

      ),
      body: Padding(
        padding:  EdgeInsets.all(16.0.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(text: "Transfer the money from your sales to you via:", size: 24, weight: FontWeight.w500),
            SizedBox(height: 20.h,),
            GestureDetector(onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>PaypalInfo()));
            },
              child: ListTile(
                leading: Icon(Icons.paypal_outlined,color: Colors.grey,),

                title:CustomText(text: "Pay Pal", size: 16, weight: FontWeight.w500),
                trailing: Icon(CupertinoIcons.forward,color: Colors.grey,),
              ),
            ),
            Divider(color: Colors.grey.withOpacity(0.4),),
            GestureDetector(onTap: (){
              // Navigator.push(context, MaterialPageRoute(builder: (context)=>Deposit()));
            },
              child: ListTile(
                leading: Icon(Icons.credit_card,color: Colors.grey,),

                title:CustomText(text: "Bank Deposit", size: 16, weight: FontWeight.w500),
                trailing: Icon(CupertinoIcons.forward,color: Colors.grey,),
              ),
            ),
            Divider(color: Colors.grey.withOpacity(0.4),),
            GestureDetector(
              onTap: (){
               // Navigator.push(context, MaterialPageRoute(builder: (context)=>AddAddress()));
              },

              child: ListTile(
                style: ListTileStyle.drawer,
                hoverColor: Colors.green,
             selectedColor: Colors.green,
                leading: Icon(CupertinoIcons.bitcoin,color: Colors.grey,),

                title:CustomText(text: "Crypto", size: 16, weight: FontWeight.w500),
                trailing: Icon(CupertinoIcons.forward,color: Colors.grey,),
              ),
            ),
            Divider(color: Colors.grey.withOpacity(0.4),),
            GestureDetector(
              onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>PersonalCheckInfo()));
              },

              child: ListTile(
                style: ListTileStyle.drawer,
                hoverColor: Colors.green,
                selectedColor: Colors.green,
                leading: Image.asset("assets/image/Cheque.png",scale: 4,),

                title:CustomText(text: "Personal Check", size: 16, weight: FontWeight.w500),
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
