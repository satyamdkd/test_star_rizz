import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:starrizz/app/appColor/color.dart';
import 'package:starrizz/app/customWidgets/component/customButton.dart';
import 'package:starrizz/app/customWidgets/component/customInput.dart';

import '../../../../customWidgets/component/customText.dart';
import '../addAddress/addAddress.dart';
class AddItem extends StatefulWidget {
  const AddItem({super.key});

  @override
  State<AddItem> createState() => _AddItemState();
}
int click =0;
class _AddItemState extends State<AddItem> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomButton(name: "Create", tap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddAddress()));
        },height: 50,),
      ),
      appBar:  AppBar(backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(CupertinoIcons.back,color: Colors.black,)),
        centerTitle: true,
        title: CustomText(text: "Add Item",size:16 ,weight: FontWeight.w700,),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0,right: 16.0,top: 8.0,bottom: 8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.grey.shade300)),
          child: Column(children: [
            SizedBox(height: 40.h,),
          Image.asset("assets/image/gallary.png",scale: 4,),
            CustomText(text: "Upload an image", size: 16.sp, weight: FontWeight.w400,color: Colors.grey,),
            CustomText(text: "jpg/png should be less than 5mb", size: 14.sp, weight: FontWeight.w400,color: Colors.grey,),
            SizedBox(height: 40.h,),
          ],),
          ),
              SizedBox(height: 10.h,),
              CustomInput(hint: "Product Name", pass: false, controller: TextEditingController(), validator: (v){}),
              SizedBox(height: 10.h,),
              CustomInput(hint: "Product Description", pass: false, controller: TextEditingController(), validator: (v){},maxLine: 3,),
              SizedBox(height: 10.h,),
               Row(children: [
                GestureDetector(
                  onTap: (){
                    setState(() {
                      if( click==1){
                        click=0;
                      }else
                        click=1;
                    });
                  },
                  child: Container(
                    child: Column(children: [
                      CustomText(text: "Auction", size: 16.sp, weight: FontWeight.w600,color: click==0?AppColors.primaryColor:Colors.black),
                      Container(width:70.h,child: Divider(color: click==0?AppColors.primaryColor:Colors.white,))
                    ],),
                  ),
                ),
                SizedBox(width: 10.w,),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      if( click==1){
                        click=0;
                      }else
                      click=1;
                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Column(children: [
                      CustomText(text: "Fixed Price", size: 16.sp, weight: FontWeight.w600, color:click==1?AppColors.primaryColor:Colors.black),

                      Container(width:80.h,child: Divider(color: click==1?AppColors.primaryColor:Colors.white,))
                    ],),
                  ),
                ),
              ],),
              SizedBox(height: 10.h,),
              if( click==0)
              CustomInput(hint: "Expiry Date", pass: false, controller: TextEditingController(), validator: (v){},lable: "Expiry Date",),
              SizedBox(height: 10.h,),
              if( click==0)
              CustomInput(hint: "Starting Bid", pass: false, controller: TextEditingController(), validator: (v){},maxLine: 1,lable: "Starting Bid",),
              if( click==1)
              CustomInput(hint: "Price", pass: false, controller: TextEditingController(), validator: (v){},maxLine: 1,lable: "Price",),

              // DefaultTabController(length: 2, child: Column(
              //   children: [
              //     TabBar(tabs: [
              //       Tab(text: "name",),
              //       Tab(text: "fame",),
              //     ]),
              //     TabBarView(children: [
              //       Container(height: 40,color: Colors.red,),
              //       Container(height: 40,color: Colors.blue,),
              //     ])
              //   ],
              //
              // ))

              SizedBox(height: 70.h,),
            ],
          ),
        ),
      ),
    );
  }
}

