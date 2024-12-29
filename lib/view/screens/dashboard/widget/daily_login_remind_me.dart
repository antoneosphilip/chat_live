import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../util/dimensions.dart';
import '../../../../util/styles.dart';

class DailyLoginRemindMe extends StatelessWidget {
  const DailyLoginRemindMe({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Padding(
          padding:
          EdgeInsets.only(top: 10.h),
          child: Row(
            children: [
              SizedBox(
                width: 10.w,
              ),
              InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  height: 30.h,
                  width: 30.w,
                  decoration:
                  const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.clear,
                    color: Colors.red,
                  ),
                ),
              ),
              const Spacer(),
              Text(
                "Remind Me",
                style: robotoWhite,
              ),
              SizedBox(
                width: 2.w,
              ),
              Switch(
                value: false,
                onChanged: (val) {},
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Center(
          child: Column(
            children: [
              Text(
                "Daily Login",
                style: robotoWhiteBold.copyWith(
                    fontSize: Dimensions
                        .fontSizeExtraLarge),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                "Checked in for 0 consecutive days",
                style: robotoWhiteBold
                    .copyWith(
                    fontWeight:
                    FontWeight
                        .w300),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
