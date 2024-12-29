import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../util/dimensions.dart';
import '../../../../util/styles.dart';

class UserDetailsContainerDetails extends StatelessWidget {
  const UserDetailsContainerDetails ({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.only(bottom: 40.h),
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: 100.w,
          height: 40.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.r),
              color: Colors.red,
              image: const DecorationImage(image: AssetImage('assets/images/details_back_ground.webp'),fit: BoxFit.cover)
          ),
          child: Center(
            child: Text("Details",style: robotoWhiteMedium.copyWith(fontSize: Dimensions.fontSizeLarge,fontWeight: FontWeight.bold),),
          ),
        ),
      ),
    );
  }
}
