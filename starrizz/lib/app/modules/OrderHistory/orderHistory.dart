import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:starrizz/app/customWidgets/component/customText.dart';
import 'package:starrizz/app/modules/WishList/wishList.dart';
class OrderHistory extends StatefulWidget {
  const OrderHistory({super.key});

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
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
        title: CustomText(text: "Order History", size: 18, weight: FontWeight.w700),
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
        Container(
          height: 100.h,
          width: 100.h,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),image: DecorationImage(image: AssetImage("assets/image/wish.png",),fit: BoxFit.fill)),),
            SizedBox(width: 20.w,),
        Expanded(
          child: Column(


            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

            CustomText(text: "Lorem ipsum dolor sit amet consectetur.", size: 14, weight: FontWeight.w500),
            CustomText(text: "Order #92287157", size: 14, weight: FontWeight.w700),
           SizedBox(height: 20,),
           Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children:

           [
             Container(width:100,
              decoration:BoxDecoration(color: Colors.grey.shade200,
                 borderRadius: BorderRadius.circular(7.sp),
              ),
               child: Padding(
                 padding: const EdgeInsets.all(4.0),
                 child: Center(child: CustomText(text: "April 06", size: 15, weight: FontWeight.w400)),
               ),),
             Spacer(),
             GestureDetector(

               onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>WishListItem()));
               },
               child: Container(width: 100,
                 decoration:BoxDecoration(
                   borderRadius: BorderRadius.circular(7.sp),
                   border: Border.all(color: Colors.blueAccent,width: 2.0)
                 ),
                 child: Padding(
                   padding: const EdgeInsets.all(4.0),
                   child: Center(child: CustomText(text: "Review", size: 15, weight: FontWeight.w400,color: Colors.blueAccent,)),
                 ),),
             )
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
