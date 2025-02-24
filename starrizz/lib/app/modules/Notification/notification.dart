import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:starrizz/app/customWidgets/component/customText.dart';

import '../OrderHistory/orderHistory.dart';
class NotificationList extends StatefulWidget {
  const NotificationList({super.key});

  @override
  State<NotificationList> createState() => _NotificationListState();
}

class _NotificationListState extends State<NotificationList> {
  @override
  Widget build(BuildContext context) {
    List<String> image=["assets/image/announce.png","assets/image/cup.png","assets/image/test.png","assets/image/meal.png","assets/image/percent.png"];
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
        title: CustomText(text: "Notification", size: 18, weight: FontWeight.w700),
      ),
      body:Padding(
        padding:  EdgeInsets.only(left:16.0.sp,right: 16.0.sp,top: 8.0.sp),
        child: ListView.builder(
            itemCount: image.length,
            itemBuilder: (BuildContext context,int index){return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> OrderHistory()));
              },
              child: Column(
                children: [
                  if(index!=0)
                  Divider(),
                  ListTile(
                    leading: Image.asset(image[index],scale: 3,),
                    title: CustomText(text: "Meal Kit in rout", size: 16.sp, weight: FontWeight.w700),
                    subtitle: CustomText(text: "Meal Kit in rout", size: 14.sp, weight: FontWeight.w400,color: Colors.grey,),
                    trailing:CustomText(text: "6 day ago", size: 12.sp, weight: FontWeight.w400,color: Colors.grey,),
                  ),
                ],
              ),
            );}),
      ) ,
    );
  }
}
