import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starrizz/app/customWidgets/component/customText.dart';
class AddBid extends StatefulWidget {
  const AddBid({super.key});

  @override
  State<AddBid> createState() => _AddBidState();
}

class _AddBidState extends State<AddBid> {
  @override
  Widget build(BuildContext context) {
    TextEditingController bidAmount =TextEditingController();
    return  Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CustomText(text: "Bid Amount", size: 28.sp, weight: FontWeight.w700),
            Container(height: 200.h,
            decoration: BoxDecoration( borderRadius: BorderRadius.circular(20),color: Colors.grey.withOpacity(0.1),),
            child: Row(
              children: [
                SizedBox(width: 50.w,),
                Container(padding:EdgeInsets.all(8.0),
                    decoration:BoxDecoration(

                      color: Colors.grey.withOpacity(0.3),
                      shape: BoxShape.circle
                    ),
                    child: Center(child: Icon(CupertinoIcons.minus,size: 30,))),
                SizedBox(width: 10.w,),
                Expanded(child: TextFormField(
                  controller: bidAmount,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  style: GoogleFonts.roboto(
                    fontSize: 30
                  ),
                  decoration: InputDecoration(


                    border: InputBorder.none
                  ),
                )),
                SizedBox(width: 10.w,),
                Container(padding:EdgeInsets.all(8.0),
                    decoration:BoxDecoration(
                        color: Colors.grey.withOpacity(0.3),
                        shape: BoxShape.circle
                    ),
                    child: Icon(Icons.add,size: 30,weight: 20,)),
                SizedBox(width: 50.w,),
              ],
            ),)

          ],
        ),
      ),
    );
  }
}
