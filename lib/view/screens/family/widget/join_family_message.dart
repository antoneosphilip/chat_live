import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../util/colors.dart';
import '../../../../util/styles.dart';

class JoinFamilyMessage extends StatelessWidget {
  final String message;
  const JoinFamilyMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: ColorManger.whiteColor
        ),
        width: 250.w,
        height: 150.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30.h,),
            Padding(
              padding:  EdgeInsets.only(top: 30.h),
              child: Text(message,style: robotoBlack2,),
            ),

          ],
        ),
      ),
    );
  }
}
