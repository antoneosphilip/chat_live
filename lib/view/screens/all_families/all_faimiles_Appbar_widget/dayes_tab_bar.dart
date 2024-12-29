import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../../util/colors.dart';
import '../../../../util/dimensions.dart';

class DayesTabBar extends StatelessWidget {
  const DayesTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(top: 160.h),
      child: Center(
        child: Container(
          height: 30.h,
          width: 270.0.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.r),
              border: Border.all(color: Colors.white)),
          child: Center(
            child: SizedBox(
              width: 270.0.w,
              height: 40.h,
              child: ToggleSwitch(
                minWidth: 150.0,
                cornerRadius: 20.0,
                activeBgColors: [
                  const [Colors.white],
                  [Colors.grey[200]!],
                ],
                activeFgColor: ColorManger.colorPurple,
                inactiveBgColor: Colors.white38,
                inactiveFgColor: Colors.white,
                initialLabelIndex: 1,
                totalSwitches: 4,
                labels: const ['Day', "Week", "Month", "All"],
                radiusStyle: true,
                customTextStyles: [
                  TextStyle(
                    fontSize: Dimensions.fontSizeLarge,
                  ),
                ],
                onToggle: (index) {
                  print('Switched to: $index');
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}