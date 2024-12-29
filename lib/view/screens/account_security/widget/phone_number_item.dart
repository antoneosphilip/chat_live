import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../helper/route_helper.dart';
import '../../../../util/colors.dart';
import '../../../../util/styles.dart';

class ChangePhoneNumberItem extends StatelessWidget {
  const ChangePhoneNumberItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()
      {
        Get.toNamed(RouteHelper.changePhoneNumberScreen);
      },
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          children: [
            Image(image: const AssetImage('assets/images/phone.webp'),height: 40.h,width: 40.w,),
            SizedBox(width: 5.w,),
            Text("Phone number".tr,style: robotoBlack2.copyWith(fontWeight: FontWeight.w500),),
            const Spacer(),
            Icon(Icons.arrow_forward_ios,color: ColorManger.grey,size: 15.sp,),
          ],
        ),
      ),
    );
  }
}
