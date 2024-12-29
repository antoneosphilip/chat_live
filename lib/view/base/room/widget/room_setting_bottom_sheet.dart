import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_app/util/colors.dart';
import 'package:live_app/view/base/room/widget/room_direcrors.dart';
import 'package:live_app/view/base/room/widget/room_setting_item.dart';
import 'package:live_app/view/base/room/widget/setting_room_items.dart';

import '../../../../helper/route_helper.dart';
import '../../../../util/styles.dart';
import '../../../screens/all_families/all_faimiles_Appbar_widget/image_person.dart';

class RoomSettingBottomSheet extends StatelessWidget {
  final int roomId;
  const RoomSettingBottomSheet({super.key, required this.roomId});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 250.h,
      child: Column(
        children: [
          SizedBox(
            height: 15.h,
          ),
          Center(
              child: Text(
            "اعدادات الغرفة",
            style: robotoWhiteBold,
          )),
          SizedBox(
            height: 15.h,
          ),
           SettingRoomItems(roomId:roomId),
        ],
      ),
    );
  }
}
