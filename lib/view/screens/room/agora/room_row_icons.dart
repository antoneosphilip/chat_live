import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_app/controller/room_controller.dart';
import 'package:live_app/data/model/response/user_model.dart';
import 'package:live_app/util/styles.dart';
import 'package:live_app/view/screens/room/agora/gift_box_agora.dart';
import 'package:live_app/view/screens/room/agora/room_members_container.dart';
import 'package:live_app/view/screens/room/agora/send_message.dart';

import '../../../../data/model/response/room_model.dart';
import '../../../../util/colors.dart';
import '../../../../util/dimensions.dart';
import '../../../base/room/gift_box.dart';
import 'icon.dart';

class RoomRowIcons extends StatefulWidget {
  final dynamic userModel;
  final RoomModel room;
  final RoomController roomController;

  const RoomRowIcons(
      {super.key,
      required this.userModel,
      required this.room,
      required this.roomController});

  @override
  State<RoomRowIcons> createState() => _RoomRowIconsState();
}

class _RoomRowIconsState extends State<RoomRowIcons> {
  bool isMic = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InkWell(
            onTap: () {
              {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return const SendMessage();
                  },
                );
              }
            },
            child: const RoomIcon(
              iconData: Icons.chat_bubble_outline,
            )),
        const Spacer(),
        InkWell(
            onTap: () {
              isMic = !isMic;
              print(isMic);
              setState(() {});
              Get.find<RoomController>()
                  .manageMicrophone(widget.userModel.uuid!, !isMic);
            },
            child: Get.find<RoomController>().seatNumber.isNotEmpty ||
                    widget.room.isOwner!&&widget.roomController.isOwnerTakeSeat
                ? RoomIcon(iconData: isMic ? Icons.mic : Icons.mic_off)
                : const SizedBox()),
        SizedBox(
          width: 10.w,
        ),
        InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              backgroundColor: ColorManger.deepGrey2,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              isScrollControlled: true,
              builder: (context) {
                return RoomMembersContainer(
                  myId: widget.userModel.id!,
                  roomModel: widget.room,
                  roomController: widget.roomController,
                );
              },
            );
          },
          child: const RoomIcon(
            iconData: Icons.person,
            backGroundColor: ColorManger.colorPurple,
            iconColor: Colors.white,
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
         GiftBoxAgora(roomId: widget.room.id!),
      ],
    );
  }
}
