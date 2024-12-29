import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_app/data/model/response/room_model.dart';
import 'package:live_app/view/screens/room/agora/custom_name_user_room.dart';
import 'package:live_app/view/screens/room/agora/cutom_image_person_room.dart';
import 'package:live_app/view/screens/room/agora/show_profile_container.dart';
import 'package:live_app/view/screens/room/agora/take_seat_Dailog.dart';

import '../../../../controller/room_controller.dart';
import '../../../../data/model/response/user_model.dart';
import 'blocked_user_container.dart';
import 'custom_chair.dart';
import 'leave_from_room_dialog.dart';

class SeatItem extends StatelessWidget {
  final int numberOfItem;
  final RoomModel roomModel;
  final dynamic userModel;
  final Chairs? chair;
  final String? imageChair;

  const SeatItem({
    super.key,
    required this.numberOfItem,
    required this.roomModel,
    required this.userModel,
    this.chair,  this.imageChair,
  });

  @override
  Widget build(BuildContext context) {
    final seatNumber = Get.find<RoomController>().seatNumber[numberOfItem];
    return InkWell(
      onTap: () {
        if (!roomModel.isOwner!) {
          if((chair!.user!=null)){
            showDialog(
              context: context,
              builder: (context) {
                return showProfileUserContainer(
                  user: chair!.user!,
                );
              },
            );
          }
          if (chair!.user == null && chair!.isLocked != 1) {
            if (Get.find<RoomController>().seatNumber.isEmpty) {
              showCustomBottomSheet(context, numberOfItem, roomModel.id!);
            } else {
              if (seatNumber == true) {
                print("sssssssssssss");
                showCustomDialog(context, "seat", () async {
                  await Get.find<RoomController>()
                      .leaveChair(seatNum: numberOfItem);
                });
              } else if (numberOfItem != 2 && seatNumber == null) {
                Get.find<RoomController>().sitChair(
                    seatNum: numberOfItem,
                    roomId: roomModel.id!,
                    isMute: chair!.isMuted == 0 ? false : true);
              }
            }
          }
        } else {
          if (chair?.user != null) {
            showDialog(
              context: context,
              builder: (context) {
                return BlockUserContainer(
                  user: chair!.user!,
                );
              },
            );
          }
        }
      },
      child: Column(
        children: [
          Container(
            width: 50.w, // Reduced width
            decoration: BoxDecoration(
              color: Colors.white70.withOpacity(.7),
              shape: BoxShape.circle,
            ),
            child: chair!.user == null &&
                    (seatNumber == null || seatNumber == false)
                ? CustomChair(
                    chair: chair,
                    numberOfItem: numberOfItem,
                   imageChair:imageChair
                  )
                : chair!.user == null &&
                        (seatNumber != null && seatNumber != false)
                    ? CustomImagePersonRoom(
                        image: userModel.image!,
                        chair: chair,
                      )
                    : chair!.user != null &&
                            (seatNumber == null || seatNumber == false)
                        ? CustomImagePersonRoom(
                            image: chair!.user!.image,
                            chair: chair,
                          )
                        : const SizedBox(),
          ),
          chair!.user == null && (seatNumber == null || seatNumber == false)
              ? const SizedBox()
              : chair!.user == null &&
                      (seatNumber != null && seatNumber != false)
                  ? CustomNameUserRoom(
                      text: userModel.name.toString(),
                    )
                  : chair!.user != null &&
                          (seatNumber == null || seatNumber == false)
                      ? CustomNameUserRoom(
                          text: chair!.user!.name.toString(),
                        )
                      : const SizedBox()
        ],
      ),
    );
  }
}
