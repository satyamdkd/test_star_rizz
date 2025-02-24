import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:shimmer/shimmer.dart';
import 'package:starrizz/app/appColor/color.dart';
import 'package:starrizz/app/customWidgets/component/appBar.dart';
import 'package:starrizz/app/customWidgets/component/customText.dart';
import 'package:starrizz/app/modules/dashBoard/dashboard/home/productDetail.dart';

import '../../../../customWidgets/component/networkimage.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
class ProductListPage extends StatelessWidget {
  ProductListPage({super.key});

  @override
  List image=["assets/image/product.png","assets/image/product1.png","assets/image/product2.png","assets/image/product.png","assets/image/product3.png","assets/image/product4.png","assets/image/product.png"];

 bool _isLoading= true;

  Widget build(BuildContext context) {

    return
    //   _isLoading?
    //
    // Container(
    //   height: MediaQuery.of(context).size.height,
    //   child: GridView.builder(
    //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    //     itemCount: 10,
    //     shrinkWrap: true,
    //     physics: NeverScrollableScrollPhysics(),
    //     // Display shimmer for 6 items
    //     itemBuilder: (context, index) {
    //       return Padding(
    //         padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
    //         child: Shimmer.fromColors(
    //           baseColor: Colors.grey[300]!,
    //           highlightColor: Colors.grey[100]!,
    //           child: Container(
    //             height: 90.h,
    //             width: 115.h,
    //             decoration: BoxDecoration(
    //               color: Colors.white,
    //               borderRadius: BorderRadius.circular(8.0),
    //             ),
    //           ),
    //         ),
    //       );
    //     },
    //   ),
    // ):
    Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.h),
          child: Padding(
            padding: EdgeInsets.all(8.0.sp),
            child: CustomAppBar(),
          )),
       body: Padding(
         padding: const EdgeInsets.all(8.0),
         child: Column(
           children: [
             Container(

               height: 50.h,
               padding: EdgeInsets.symmetric(horizontal: 16.w),
               decoration:
               BoxDecoration(
                   boxShadow: [
                     BoxShadow(
                       color: Colors.grey.withOpacity(0.3), // Shadow color with opacity
                       spreadRadius: 2, // How much the shadow spreads
                       blurRadius: 10, // How much the shadow blurs
                       offset: Offset(5, 5), // Offset in x and y direction
                     ),
                   ],
                   borderRadius: BorderRadius.circular(10.sp),
                   color: Colors.white),
               child: Padding(
                 padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                 child: Row(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     SizedBox(height: 50.h),
                     Icon(
                       Icons.search,
                       color: Colors.black.withOpacity(0.6),
                       size: 24.h,
                     ),
                     SizedBox(width: 4.w),
                     CustomText(
                       text: "Search Word",
                       size: 14.sp,
                       weight: FontWeight.w400,
                       color: Colors.grey,
                       textScaler: TextScaler.noScaling,
                     ),
                     Spacer(),
                     Icon(CupertinoIcons.mic,color: Colors.grey,),
                   ],
                 ),
               ),
             ),
             SizedBox(height: 20.h,),
             Expanded(
               child: MasonryGridView.builder(
                 gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                   crossAxisCount: 2, // Number of columns
                 ),
                 mainAxisSpacing: 8,
                 crossAxisSpacing: 8,
                 itemCount: image.length,
                 itemBuilder: (context, index) {
                   return GestureDetector(
                     onTap: (){

                       pushWithoutNavBar(
                           context,
                           MaterialPageRoute(builder: (context) => ProductDetails(url:image[index]))
                       );
                       //Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetails(url:image[index])));
                     },

                     child: Card(
                       color: Colors.white,
                      // padding: EdgeInsets.all(8),
                      //  decoration: BoxDecoration(
                      //   // color: Colors.blueAccent,
                      //    borderRadius: BorderRadius.circular(8),
                      //  ),
                       child: Column(

                         children: [
                           Stack(
                             children: [
                               Image.asset(image[index]),
                               Positioned(right: 00,top: 10,
                                 child: Container(
                                   padding: EdgeInsets.only(left: 10.sp,top: 5.sp,bottom: 5.sp,right: 5.sp),
                                   decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(5),color: AppColors.primaryColor
                                 ),

                                 child: CustomText(text: "Fixed Price",weight: FontWeight.w500,size: 14.sp,color: Colors.white,),),
                               )
                             ],
                           ),
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 CustomText(text: "Flare Dress", size: 16.sp, weight: FontWeight.w600),
                                 CustomText(
                                     maxLines: 2,
                                     text: "Antheaa Black & Rust Orange Floral Print Tiered Midi F...", size: 14.sp, weight: FontWeight.w400),

                                 CustomText(text: "₹1,990", size: 16.sp, weight: FontWeight.w600),
                                 Row(children: [
                                   Icon(Icons.star,color: CupertinoColors.systemYellow,),
                                   Icon(Icons.star,color: CupertinoColors.systemYellow,),
                                   Icon(Icons.star,color: CupertinoColors.systemYellow,),
                                   Icon(Icons.star,color: CupertinoColors.systemYellow,),
                                   Icon(Icons.star,color: CupertinoColors.systemYellow,),
                                   CustomText(text: "1,990", size: 14.sp, weight: FontWeight.w400,color: Colors.grey,),
                                 ],),
                               ],
                             ),
                           ),

                         ],
                       ),
                     ),
                   );
                 },
               ),
             ),
           ],
         ),
       ),

    );
  }


}
