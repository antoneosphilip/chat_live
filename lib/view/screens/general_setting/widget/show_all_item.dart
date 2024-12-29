import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_app/view/screens/general_setting/widget/switch_widget.dart';

import '../../../../util/styles.dart';

class ShowAllItem extends StatefulWidget {
  final String text1;
  final String text2;
  final bool isSwitch;

  const ShowAllItem(
      {super.key,
      required this.text1,
      required this.text2,
      required this.isSwitch});

  @override
  State<ShowAllItem> createState() => _ShowAllItemState();
}

class _ShowAllItemState extends State<ShowAllItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,

      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.text1.tr,
                  style: robotoLargeBold,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  widget.text2.tr,
                  style: robotoGreySmall,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 5.w,
        ),
        Padding(
          padding:  EdgeInsets.only(top: 15.h),
          child: SwitchWidget(
            isSwitched: widget.isSwitch,
          ),
        ),
      ],
    );
  }
}
