

  import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_app/util/colors.dart';
import 'package:live_app/util/styles.dart';

import '../../../../controller/room_controller.dart';
import '../../wallet/widget/custom_line.dart';
import 'custom_line.dart';

void showCustomDialog(BuildContext context,String text,Function() onPressed) {
    showDialog(

      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          contentPadding: EdgeInsets.zero,
          backgroundColor: ColorManger.deepGrey2,
          content: SizedBox(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  children: [

                    SizedBox(height: 20.h), // Reduce space for a compact look
                    Text(
                      'Leave the $text',
                      style: robotoBlack.copyWith(color: Colors.white),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      'Are you sure to leave $text?',
                      style: robotoWhite.copyWith(fontWeight: FontWeight.w200),
                    ),
                  ],
                ),
                const SizedBox(height: 20), // Space between the text and the line
                const CustomRoomLine(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Align buttons horizontally
                  children: [
                    TextButton(
                      onPressed: () async {
                        Get.back();
                      },
                      child: Text(
                        'Cancel',
                        style: robotoBlack.copyWith(color: Colors.white),
                      ),
                    ),
                    Container(
                      width: 1.w,
                      height: 45.h, // Reduce height of the line
                      color: Colors.white.withOpacity(0.1),
                    ),
                    TextButton(
                      onPressed:onPressed,
                      child: Text(
                        'Ok',
                        style: robotoBlack.copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );

      },
    );
  }

