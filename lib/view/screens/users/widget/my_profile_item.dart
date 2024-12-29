import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../util/styles.dart';

class MyProfileItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final String text2;
  final bool isIcon;
  final Function() onPressed;
  final Color iconColor;
  const MyProfileItem({super.key, required this.icon, required this.text, required this.text2, required this.isIcon, required this.onPressed, required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8.r),),
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical: 18.h),
              child: InkWell(
                onTap: onPressed,
                child: Row(
                  children: [
                    SizedBox(width: 5.w,),
                    Icon(icon,color: iconColor,size: 20.sp,),
                    SizedBox(width: 5.w,),
                    Text(text,style: robotoBlack.copyWith(fontWeight: FontWeight.w200),),
                    const Spacer(),
                    Text(text2,style: robotoWhite.copyWith(color: Colors.black),),
                    SizedBox(width: 5.w,),
                    isIcon?
                    const Icon(Icons.arrow_forward_ios,size: 10,color: Colors.grey,):
                    Icon(Icons.arrow_forward_ios,color: Colors.grey[200],size: 10,),
                    SizedBox(width: 20.w,),
                  ],
                ),
              ),
            ),
          )


        ],
      ),
    );
  }
}
