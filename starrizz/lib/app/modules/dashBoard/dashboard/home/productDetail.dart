import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:starrizz/app/appColor/color.dart';
import 'package:starrizz/app/customWidgets/component/customButton.dart';
import 'package:starrizz/app/customWidgets/component/customText.dart';
import 'package:starrizz/app/modules/dashBoard/dashboard/home/addBid.dart';

class ProductDetails extends StatelessWidget {
  String url = "";
  ProductDetails({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomButton(
            name: "Place a Bid",
            tap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>AddBid()));
             // _showBlurredBottomSheet(context);
            }),
      ),
      body: Column(
        children: [
          // Image.asset("assets/image/girl.png"),
          Image.asset(url),
          SizedBox(
            height: 10.h,
          ),
          Table(
              border:
                  TableBorder.all(color: Colors.grey, width: 1),
              columnWidths: {
                0: FlexColumnWidth(1),
                1: FlexColumnWidth(1),
                2: FixedColumnWidth(100),
              },
              children: [
                TableRow(
                  decoration: BoxDecoration(color: Colors.white),
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('\$24,00',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22.sp)),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        _showBlurredBottomSheet(context);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 16.0.sp, right: 16.0.sp, top: 10.sp),
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/image/bid.png",
                              scale: 5,
                            ),
                            Text('15 bid',
                                style: TextStyle(fontWeight: FontWeight.w400)),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/image/eye.png",
                            scale: 5,
                          ),
                          Text('1500 View',
                              style: TextStyle(fontWeight: FontWeight.w400)),
                        ],
                      ),
                    ),
                  ],
                ),
              ]),

          Padding(
            padding: EdgeInsets.only(left: 16.0.sp, right: 16.0.sp, top: 10.sp),
            child: CustomText(
                text:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam arcu mauris, scelerisque eu mauris id, pretium pulvinar sapien. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam arcu mauris, scelerisque eu mauris id, pretium pulvinar sapie.",
                size: 16.sp,
                weight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

void _showBlurredBottomSheet(BuildContext context) {
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
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        controller: scrollController,
                        itemCount: 20,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ListTile(
                                leading: CircleAvatar(
                                  foregroundImage:
                                      AssetImage("assets/image/product2.png"),
                                ),
                                subtitle: CustomText(
                                  text: "Hi bro! What’s up?",
                                  weight: FontWeight.w400,
                                  size: 14.sp,
                                  color: Colors.grey.withOpacity(0.6),
                                ),
                                title: CustomText(
                                  text: "Maria Morgan",
                                  weight: FontWeight.w600,
                                  size: 14.sp,
                                ),
                                trailing: CustomText(
                                  text: "\$50",
                                  weight: FontWeight.w600,
                                  size: 14.sp,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Divider(),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
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
