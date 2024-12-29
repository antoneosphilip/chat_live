import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../util/dimensions.dart';
import '../../../../util/styles.dart';

class SendMessage extends StatelessWidget {
  const SendMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 8.w,vertical: 6.h),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Say something...',
                    border: InputBorder.none,
                    hintStyle: robotoWhite.copyWith(
                        color: Colors.grey,
                        fontSize: Dimensions.fontSizeLarge),
                  ),
                  style: TextStyle(fontSize: 14.sp),
                  minLines: 1,
                  maxLines: 1,
                ),
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.send,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
