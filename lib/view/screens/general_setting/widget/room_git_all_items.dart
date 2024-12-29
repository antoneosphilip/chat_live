import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_app/view/screens/general_setting/widget/room_gift_item.dart';

class RoomGitAllItems extends StatelessWidget {
  const RoomGitAllItems({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
         RoomGiftItem(
          text: 'All Gifts'.tr,
        ),
        SizedBox(
          width: 15.w,
        ),
         Expanded(
            child: RoomGiftItem(
              text: '500diamonds or more'.tr,
              colorText: Colors.grey.shade500,
            )),
        SizedBox(
          width: 15.w,
        ),
         RoomGiftItem(
          text: 'Dont show'.tr,
           colorText: Colors.grey.shade500,

         ),
      ],
    );
  }
}
