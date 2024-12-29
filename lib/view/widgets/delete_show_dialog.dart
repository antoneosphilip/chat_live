import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../util/colors.dart';
import '../../util/styles.dart';

class DeleteShowDialog extends StatelessWidget {
  final String message;
  final Function()? onTap;
  const DeleteShowDialog({super.key,  this.message="Are you sure?",  this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
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
              padding: const EdgeInsets.all(8.0),
              child: Text(message,style: robotoBlack2.copyWith(color: Colors.black,decoration: TextDecoration.none),),
            ),
            const Spacer(),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 30.w),
              child: Row(
                children: [
                  Text("Cancel",style: robotoGreySmall.copyWith(color: Colors.grey.shade600,decoration: TextDecoration.none),),
                  Spacer(),
                  Text("Confirm",style: robotoBlack2.copyWith(color: ColorManger.colorPurple,decoration: TextDecoration.none),),
                ],
              ),
            ),
            SizedBox(height: 30.h,)
          ],
        ),
      ),
    );
  }
}
