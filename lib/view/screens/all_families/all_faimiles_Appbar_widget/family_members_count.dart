import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../util/styles.dart';

class FamilyMembersCount extends StatelessWidget {
  const FamilyMembersCount({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(top: 410.h, left: 85.w),
      child: Row(
        children: [
          Center(
              child: Image.asset(
                'assets/images/fire.webp',
                height: 20.h,
                width: 20.w,
              )),
          SizedBox(
            width: 5.w,
          ),
          Text(
            "6,417,977",
            style:
            robotoWhiteVeryBold.copyWith(color: Colors.white),
          ),
          SizedBox(
            width: 20.w,
          ),
          Center(
              child: Image.asset(
                'assets/images/group_memer.webp',
                height: 20.h,
                width: 20.w,
              )),
          SizedBox(
            width: 5.w,
          ),
          Text(
            "326",
            style:
            robotoWhiteVeryBold.copyWith(color: Colors.white),
          ),

        ],
      ),
    );
  }
}
