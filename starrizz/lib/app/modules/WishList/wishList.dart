import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:starrizz/app/appColor/color.dart';
import 'package:starrizz/app/customWidgets/component/customText.dart';
class WishListItem extends StatefulWidget {
  const WishListItem({super.key});

  @override
  State<WishListItem> createState() => _WishListItemState();
}

class _WishListItemState extends State<WishListItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        backgroundColor: Colors.white,
        // leading: GestureDetector(
        //   onTap: (){
        //     Navigator.pop(context);
        //   },
        //   child: Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: Container(decoration: BoxDecoration(shape: BoxShape.circle,border:Border.all(color: Colors.grey) ),
        //       child: Icon(Icons.arrow_back),
        //     ),
        //   ),
        // ),
        title: CustomText(text: "Wishlist", size: 18, weight: FontWeight.w700),
      ) ,
      body: Padding(
        padding:  EdgeInsets.only(left:16.0,right: 16.0,top: 8.0),
        child: ListView.builder(

            itemCount: 10,
            itemBuilder: (BuildContext context, int index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 120.h,
                          width: 120.h,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),image: DecorationImage(image: AssetImage("assets/image/wish.png",),fit: BoxFit.fill)),),
                        Positioned(bottom: 10,left: 10.sp,
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.white),
                          child: Image.asset("assets/image/Delete.png",scale: 5,),),
                        )
                      ],
                    ),
                    SizedBox(width: 20.w,),
                    Expanded(
                      child: Column(


                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          CustomText(text: "Lorem ipsum dolor sit amet consectetur.", size: 14, weight: FontWeight.w500),
                          Row(
                            children: [
                              CustomText(text: "\$17,00", size: 14, weight: FontWeight.w500,color: Colors.redAccent,),
                              SizedBox(width: 10.w,),
                              CustomText(text: "\$17,00", size: 14, weight: FontWeight.w700),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Row(

                            children:

                            [
                              Container(width:80,
                                decoration:BoxDecoration(color: AppColors.lighttblue,
                                  borderRadius: BorderRadius.circular(4.sp),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(child: CustomText(text: "Pink", size: 15, weight: FontWeight.w400)),
                                ),),
                              SizedBox(width: 10.w,),
                              Container(
                                decoration:BoxDecoration(color: AppColors.lighttblue,
                                  borderRadius: BorderRadius.circular(4.sp),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(child: CustomText(text: "M", size: 15, weight: FontWeight.w400)),
                                ),),
                              Spacer(),
                              Image.asset("assets/image/add.png",scale: 4,)
                            ],)
                        ],),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
