import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../util/styles.dart';

class ChooseTypeRoom extends StatelessWidget {
  final String text;
  final bool isSelected;

  const ChooseTypeRoom(
      {super.key, required this.text, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        color: isSelected ? Colors.grey.shade300 : Colors.white,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0.h, horizontal: 8.w),
              child: Text(
                text,
                style: robotoBlack3,
              ),
            ),
            const Spacer(),
            isSelected
                ? Icon(
                    Icons.check,
                    size: 20.sp,
                    color: Colors.red,
                  )
                : const SizedBox(),
            SizedBox(
              width: 20.w,
            )
          ],
        ));
  }
}
