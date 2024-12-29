import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../util/styles.dart';

class AppModeItem extends StatelessWidget {
  final String title;
  final String description;
  final bool isCheck;

  const AppModeItem({super.key, required this.title, required this.description, this.isCheck=false});

  @override
  Widget build(BuildContext context) {
    return   Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title.tr,
                  style: robotoBlack2,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                    description,
                    style: robotoGreySmall),
                SizedBox(height: 10.h,),
                Container(
                  width: double.infinity,
                  height: 1.h,
                  color: Colors.grey.shade100,
                )
              ],
            ),
          ),
        ),
        isCheck?  Padding(
          padding:  EdgeInsets.only(top: 21.h),
          child:  Icon(Icons.check_circle_rounded,size: 25.sp,color: Colors.deepPurple,),
        ):const SizedBox(),
        SizedBox(width: 20.w,)

      ],
    );
  }
}
