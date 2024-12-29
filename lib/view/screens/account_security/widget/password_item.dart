import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../util/colors.dart';
import '../../../../util/styles.dart';

class ChangePasswordItem extends StatelessWidget {
  const ChangePasswordItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Image(image: const AssetImage('assets/images/password.webp'),height: 40.h,width: 40.w,),
          SizedBox(width: 5.w,),
          Text("Password".tr,style: robotoBlack2.copyWith(fontWeight: FontWeight.w500),),
          const Spacer(),
          Row(
            children: [
              Text("Add or replace".tr,style: robotoGreySmall.copyWith(color: Colors.grey.shade600),),
              SizedBox(width: 5.w,),
              Icon(Icons.arrow_forward_ios,color: ColorManger.grey,size: 15.sp,),
            ],
          ),
        ],
      ),
    );
  }
}
