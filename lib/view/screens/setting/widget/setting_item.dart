import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../util/colors.dart';
import '../../../../util/dimensions.dart';
import '../../../../util/styles.dart';

class SettingItem extends StatelessWidget {
  final String title;
  const SettingItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Text(title,style: robotoMedium.copyWith(fontSize:  Dimensions.fontSizeDefault,fontWeight: FontWeight.w100),),
          const Spacer(),
          title=="clear cache space"? Padding(
            padding:  EdgeInsets.only(right: 3.w),
            child: const Text("86.38MB"),
          ):const SizedBox(),
          Icon(Icons.arrow_forward_ios,color: ColorManger.grey,size: 12.sp,)
        ],
      ),
    );
  }
}
