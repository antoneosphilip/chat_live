import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:live_app/data/model/response/user_model.dart';

import '../../../../util/colors.dart';
import '../../../../util/styles.dart';



class RechargeShowDialog extends StatelessWidget {
  final Function()? onTap;
 final UserModel? user;
  final String usd;
  const RechargeShowDialog( {super.key,  this.onTap, this.user, required this.usd});

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Do you want to spend $usd",style: robotoBlack2.copyWith(color: Colors.black,decoration: TextDecoration.none),),
                  Text("to create this family?",style: robotoBlack2.copyWith(color: Colors.black,decoration: TextDecoration.none),),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 30.w),
              child: Row(
                children: [
                  Text("Cancel",style: robotoGreySmall.copyWith(color: Colors.grey.shade600,decoration: TextDecoration.none),),
                  const Spacer(),
                  GestureDetector(
                      onTap: onTap,
                      child: Text("Confirm",style: robotoBlack2.copyWith(color: ColorManger.colorPurple,decoration: TextDecoration.none),)),
                ],
              ),
            ),
            SizedBox(height: 10.h,)
          ],
        ),
      ),
    );
  }
}
