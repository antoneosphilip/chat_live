import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../util/styles.dart';

class SocialMediaItem extends StatelessWidget {
  final String icon;
  final String name;
  final bool isBind;
  const SocialMediaItem({super.key, required this.icon, required this.name, required this.isBind});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Image(
            image:  AssetImage(icon),
            height: 40.h,
            width: 40.w,
          ),
          SizedBox(
            width: 5.w,
          ),
          Text(
            name,
            style: robotoBlack2.copyWith(fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
              color: Colors.deepPurpleAccent,
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: Center(
                child: Padding(
              padding:  EdgeInsets.only(
                  right: 30.w, left: 30.w, top: 14.h, bottom: 14.h),
              child: Text(
                isBind?"Bind":"Unbind",
                style: robotoWhite,
              ),
            )),
          )
        ],
      ),
    );
  }
}
