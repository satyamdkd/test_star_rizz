import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:starrizz/app/customWidgets/component/customButton.dart';

import '../../../../appColor/color.dart';
import '../../../../customWidgets/component/customText.dart';
import '../addItem/addItem.dart';

class ListingPage extends StatefulWidget {
  const ListingPage({super.key});

  @override

  State<ListingPage> createState() => _ListingPageState();
}

class _ListingPageState extends State<ListingPage> {
  @override
  List image=["assets/image/product.png","assets/image/product1.png","assets/image/product2.png","assets/image/product.png","assets/image/product3.png","assets/image/product4.png","assets/image/product.png"];
 bool _isLoading=false;

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _isLoading = true;
        //_data = List.generate(10, (index) => "Item ${index + 1}");
      });
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(CupertinoIcons.back,color: Colors.black,)),
        centerTitle: true,
        title: CustomText(text: "My Listings",size:16 ,weight: FontWeight.w700,),
      ),
      body:
      // _isLoading==true?Container(
      //   height: MediaQuery.of(context).size.height,
      //   child: ListView.builder(
      //     itemCount: 6,
      //     shrinkWrap: true,
      //    physics: NeverScrollableScrollPhysics(),
      //    // Display shimmer for 6 items
      //     itemBuilder: (context, index) {
      //       return Padding(
      //         padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      //         child: Shimmer.fromColors(
      //           baseColor: Colors.grey[300]!,
      //           highlightColor: Colors.grey[100]!,
      //           child: Container(
      //             height: 150.h,
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

      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container( decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(color: Colors.grey)),
                 child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     Text("Active"),
                     Container(width: 1,height: 40,color: Colors.grey,),
                     Text("Ended"),
                   ],
                 )
               ),
            ),
            SizedBox(height: 10.h,),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (BuildContext context,int index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color: Colors.white,

                        child: Column(

                          children: [
                            Container(height:200.h,
                              decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(16),topRight: Radius.circular(16)),
                              image: DecorationImage(image: AssetImage(image[index],),fit: BoxFit.cover)
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomButton(name: "\$600", tap: (){
                                    //Navigator.push(context, MaterialPageRoute(builder: (context)=>AddItem()));
                                  },height: 40,),
                                  SizedBox(width: 10,),
                                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomText(text: "Flora Jacket & Vest Sewing Pattern ", size: 14.sp, weight: FontWeight.w500),
                                      Row(
                                        children: [
                                          Icon(CupertinoIcons.clock,color: Colors.black,size: 20,),
                                          SizedBox(width: 5,),
                                          CustomText(
                                              maxLines: 2,
                                              text: "2d 4h", size: 14.sp, weight: FontWeight.w700),
                                        ],
                                      ),
                                    ],
                                  ),


                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    );
                  }),
            )
            //
            // SizedBox(
            //   height: MediaQuery.of(context).size.height -
            //       MediaQuery.of(context).size.height / 5,
            //   child: TabBarView(children: [
            //     Padding(
            //       padding: EdgeInsets.only(
            //           left: 20.0.sp, right: 20.0.sp, top: 8.0),
            //       child:SizedBox(height: 10 ,child: Container(color: Colors.red,),)
            //     ),
            //     Padding(
            //       padding: EdgeInsets.only(
            //           left: 20.0.sp, right: 20.0.sp, top: 8.0),
            //       child:SizedBox()
            //     ),
            //   ]),
            // )
          ],
        ),
      ),
    );
  }
}
