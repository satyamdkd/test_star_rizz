import 'dart:developer';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starrizz/app/appColor/color.dart';
import 'package:starrizz/app/customWidgets/component/customButton.dart';
import 'package:starrizz/app/customWidgets/component/customText.dart';

import 'accountSetting.dart';
class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.sp,vertical: 8.0.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
                 Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     CustomText(text: "@GwenStacy31   ", size: 19.sp, weight: FontWeight.w700),
                     Icon(Icons.check_circle_outline,color: Colors.blue,weight: 8,)
                   ],
                 ),
                 SizedBox(height: 40.h,),
                 Stack(
                   children: [
                     Container(
                       height: 100.h,
                       width: 140.h,
                       decoration: BoxDecoration(shape: BoxShape.circle,image: DecorationImage(image: AssetImage("assets/image/virat.png"))) ,),
                     Positioned(bottom: 0,right: 10,
                       child: GestureDetector(
                         onTap: (){
                           log("okkk");
                           _showPhotoUploadeOption(context);
                         },
                         child: Container(
                           height: 40.h,
                           decoration: BoxDecoration(color:AppColors.primaryColor,shape: BoxShape.circle,),
                                             child: Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: Image.asset("assets/image/photo.png"),
                                             )),
                       ),
                     )
                   ],
                 ),
                 Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("assets/image/x.png",scale: 7,),
                ),
                CustomText(text: "@GwenStacy31", size: 16.sp, weight: FontWeight.w700),
              ],
            ),
                 Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("assets/image/insta.png",scale: 7,),
                ),
                CustomText(text: "@GwenStacy31", size: 16.sp, weight: FontWeight.w700),
              ],
            ),
                 Spacer(),
                 Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
                  height:60,name: "Account Setting", tap: (){
Navigator.push(context, MaterialPageRoute(builder: (context)=>AccountSetting()));
              }),
            ),

                 Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {

                },
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: const Color(0xff747474), width: 0.6)),
                  child: Center(
                    child: Text(
                      "Verify Identity",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            )

          ],
        ),
      ),
    );
  }
}
void _showPhotoUploadeOption(BuildContext context) {
  showModalBottomSheet(
    context: context,
    barrierColor: Colors.black.withOpacity(0.5), // Dim background
    isScrollControlled: true, // Allows the bottom sheet to take full height
    backgroundColor: Colors.transparent, // Make background transparent
    builder: (context) {
      return Stack(
        children: [
          // Blurred background
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Blur intensity
            child: Container(color: Colors.black.withOpacity(0.1)), // Optional
          ),
          // Bottom sheet content
          DraggableScrollableSheet(
            initialChildSize:
            0.4, // Initial height as a fraction of screen height
            minChildSize: 0.2, // Minimum height
            maxChildSize: 0.9, // Maximum height
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          CustomText(
                            text: "Bid List",
                            weight: FontWeight.w500,
                            size: 16.sp,
                            color: Colors.grey,
                          ),
                          Spacer(),
                          GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                CupertinoIcons.multiply,
                                color: AppColors.primaryColor,
                              ))
                        ],
                      ),
                    ),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Container(
                              height: 60.h,
                              decoration: BoxDecoration(color:AppColors.primaryColor,shape: BoxShape.circle,),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset("assets/image/photo.png",scale: 3,),
                              )),
                        ],
                      ),

                      Column(
                        children: [
                          Container(
                              height: 100.h,
                              decoration: BoxDecoration(color:AppColors.primaryColor,shape: BoxShape.circle,),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(CupertinoIcons.camera,color: Colors.white,),
                              )),
                        ],
                      ),

                    ],
                  )
                  ],
                ),
              );
            },
          ),
        ],
      );
    },
  );
}