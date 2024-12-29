import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../util/styles.dart';

class TypeRoomItem extends StatelessWidget {
  const TypeRoomItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60.h,
          width: 60.w,
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: Colors.teal),
          child: Center(
            child: Icon(
              Icons.mic,
              size: 30.sp,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: 10.h,),
        Text(
          'friends',
          style: robotoWhiteMedium,
        )
      ],
    );
  }
}
