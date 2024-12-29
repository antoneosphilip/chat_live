import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controller/room_controller.dart';
import 'custom_line.dart';

void showCustomBottomSheet(BuildContext context, int numberOfItem, int roomId) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.black, // Set background color to black
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    builder: (BuildContext context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              if (numberOfItem != 0 &&
                  Get.find<RoomController>().seatNumber.isEmpty) {
                Get.find<RoomController>().sitChair(
                    seatNum: numberOfItem, roomId: roomId, isMute: false);
                Get.back();
              }
            },
            child: Padding(
              padding:  EdgeInsets.only(top: 20.h),
              child: Column(
                children: [
                  Text(
                    'Take a seat',
                    style: TextStyle(color: Colors.white60, fontSize: 12.sp),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 30.w),
                    child: const CustomRoomLine(),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 5),

          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Cancel',
              style: TextStyle(color: Colors.white60, fontSize: 12.sp),
            ),
          ),
          const SizedBox(height: 5), // Space between the two options
          const CustomRoomLine(),
        ],
      );
    },
  );
}
