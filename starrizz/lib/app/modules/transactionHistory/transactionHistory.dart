import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../customWidgets/component/customText.dart';
class TransactionHistory extends StatefulWidget {
  const TransactionHistory({super.key});

  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}
bool _isLoading =true;
class _TransactionHistoryState extends State<TransactionHistory> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
        //_data = List.generate(10, (index) => "Item ${index + 1}");
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
        centerTitle: true,
        title: CustomText(text: "Transactions History", size: 18, weight: FontWeight.w700),
      ) ,
      body: _isLoading?Container(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          // Display shimmer for 6 items
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 90.h,
                  width: 115.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            );
          },
        ),
      ):Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: 9,
            itemBuilder: (BuildContext context,int index ){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              boxShadow: [

                BoxShadow(
                  color: Colors.grey.withOpacity(0.3), // Shadow color
              offset: Offset(-2, 5), // Only in Y direction (bottom)
                  blurRadius: 3, // Softness of shadow
                  spreadRadius: 0, // Spread of shadow
                ),
              ],
              border: Border.all(color: Colors.grey.withOpacity(0.3)),
              borderRadius: BorderRadius.circular(10.sp),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Image.asset("assets/image/announce.png"),
                title: CustomText(text: 'Junedi',weight: FontWeight.w800,size: 18,),
                subtitle:Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text: 'Apple Pay',weight: FontWeight.w500,size: 16,color: Colors.grey,),
                    CustomText(text: '5 jul 2025',weight: FontWeight.w500,size: 14,color: Colors.grey,),
                  ],
                ),
                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                  CustomText(text: '\$115.000',weight: FontWeight.w600,size: 18,color: Colors.redAccent,),
                  CustomText(text: 'Success',weight: FontWeight.w800,size: 16,color: Colors.green,),
                ],),
              ),
            ) ,
            ),
          );
        }),
      ),
    );
  }
}
