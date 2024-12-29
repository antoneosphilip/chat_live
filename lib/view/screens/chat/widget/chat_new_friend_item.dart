import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:live_app/util/colors.dart';

import '../../../../util/styles.dart';

class ChatNewFriendItem extends StatelessWidget {
  final Color color;
  final String text;
  final Color colorText;

  const ChatNewFriendItem({super.key, required this.color, required this.text, required this.colorText});

  @override
  Widget build(BuildContext context) {
    return    Column(
      children: [
        Container(
          width: 80.w,
          height: 50.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30.r),
                topLeft: Radius.circular(8.r),
              ),
              color:color,
          ),
          child:Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Image.asset('assets/images/bird.webp'),
            ),
          ) ,
        ),
        SizedBox(height: 2.h,),
        Container(
          width: 80.w,
          height: 20.h,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.r),
                bottomRight: Radius.circular(8.r)
            ),
          ),
          child: Center(child: Text(text,style: robotoWhite.copyWith(color:colorText,fontWeight: FontWeight.bold),)),
        ),

      ],
    );
  }
}
