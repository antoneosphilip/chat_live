import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_app/controller/room_controller.dart';
import 'package:live_app/util/colors.dart';
import 'package:live_app/util/styles.dart';
import 'package:live_app/view/base/room/widget/room_direcrors.dart';
import 'package:live_app/view/base/room/widget/room_setting_item.dart';
import 'package:live_app/view/base/room/widget/room_shape_list_view.dart';
import 'package:live_app/view/base/room/widget/room_shape_text.dart';
import 'package:live_app/view/base/room/widget/room_type_list_view.dart';
import 'package:live_app/view/base/room/widget/showHalfScreenDialog.dart';
import 'package:live_app/view/base/room/widget/show_room_back_ground_dialog.dart';

import '../../../../helper/route_helper.dart';
import '../../../screens/create_family/widget/elvated_button.dart';
import 'black_list_container.dart';
import 'black_list_item.dart';

class SettingRoomItems extends StatefulWidget {
  final int roomId;

  const SettingRoomItems({super.key, required this.roomId});

  @override
  State<SettingRoomItems> createState() => _SettingRoomItemsState();
}

class _SettingRoomItemsState extends State<SettingRoomItems> {
  @override
  void initState() {
    Get.find<RoomController>().getRoomTypes();
    Get.find<RoomController>().getBlackList();
    Get.find<RoomController>().getBackGround();
    Get.find<RoomController>().showRoom(id: widget.roomId);

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RoomController>(
      builder: (roomController) {
        return  Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 5.w,
            ),
            RoomSettingItem(
              icon: Icons.group, // Icon for Directors List
              text: "Directors List",
              iconColor: Colors.blue, // Blue color for icon
              onTap: () {
                showModalBottomSheet(
                    clipBehavior: Clip.hardEdge,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.vertical(top: Radius.circular(16.r)),
                    ),
                    backgroundColor: Colors.white,
                    context: context,
                    builder: (context) {
                      return const RoomDirectors();
                    });
              },
            ),
            SizedBox(
              width: 5.w,
            ),
            Expanded(
              child: RoomSettingItem(
                icon: Icons.settings, // Icon for Room Settings
                text: "Settings",
                iconColor: Colors.orange, // Orange color for icon
                onTap: () {
                  Get.toNamed(
                    RouteHelper.roomSetting,
                  );
                },
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            Column(
              children: [
                RoomSettingItem(
                  icon: Icons.wallpaper, // Icon for Room Background
                  text: "Room Background",
                  iconColor: Colors.green, // Green color for icon
                  onTap: () {
                    showBackGroundRoom(context);
                  },
                ),
                SizedBox(
                  height: 5.h,
                ),
                const RoomSettingItem(
                  icon: Icons.how_to_vote, // Icon for Voting
                  text: "Start Voting",
                  iconColor: Colors.purple, // Purple color for icon
                ),
              ],
            ),
            SizedBox(
              width: 5.w,
            ),
            Column(
              children: [
                 RoomSettingItem(
                  icon: Icons.design_services, // Icon for Room Shape
                  text: "Room Shape",
                  iconColor: Colors.pink, // Pink color for icon
                  onTap: (){
                    showHalfScreenDialog(context,roomController);
                  },
                ),
                SizedBox(
                  height: 5.h,
                ),
                const RoomSettingItem(
                  icon: Icons.text_fields, // Icon for Text
                  text: "Text",
                  iconColor: Colors.teal, // Teal color for icon
                ),
              ],
            ),
            SizedBox(
              width: 5.w,
            ),
            Column(
              children: [
                 RoomSettingItem(
                  icon: Icons.edit, // Icon for Edit Room
                  text: "Edit Room",
                  iconColor: Colors.red, // Red color for icon
                  onTap: () {
                    Get.toNamed(RouteHelper.editRoom);
                  },
                ),
                SizedBox(
                  height: 5.h,
                ),
                 RoomSettingItem(
                  icon: Icons.block, // Icon for Block List
                  text: "Block List",
                  iconColor: Colors.deepPurple, // Deep purple color for icon
                  onTap: (){
                    showModalBottomSheet(
                        clipBehavior: Clip.hardEdge,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.vertical(top: Radius.circular(16.r)),
                        ),
                        backgroundColor: Colors.white,
                        context: context,
                        builder: (context) {
                          return  const BlackListContainer();
                        });
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

