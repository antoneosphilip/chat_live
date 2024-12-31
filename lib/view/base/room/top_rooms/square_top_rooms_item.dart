import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_app/data/model/response/room_model.dart';
import 'package:live_app/view/screens/room/agora/audio_room_Screen.dart';

import '../../../../controller/home_controller.dart';
import '../../../../controller/room_controller.dart';
import '../../../../controller/splash_controller.dart';
import '../../../../controller/user_controller.dart';
import '../../../../util/app_constants.dart';
import '../../../widgets/masked_image.dart';

class SquareTopRoomsItem extends StatelessWidget {
  // final RoomModel room;
  final String room;
  final String? no;

  const SquareTopRoomsItem({super.key, required this.room, this.no});

  @override
  Widget build(BuildContext context) {
    // String? engine =
    //     Get.find<SplashController>().configModel!.liveStreamingEngine;
    return InkWell(
      onTap: () {
        // (engine == 'zego')
        //     ? Get.find<RoomController>().joinRoom(room)
        //     : Get.find<RoomController>()
        //         .joinRoomAgora(room, Get.find<UserController>().userModel!);
        Get.to(AudioRoomAgoraScreen(room: Get.find<HomeController>().homeRoomsStatic[0], userModel: Get.find<UserController>().userModelStatic! ));
      },
      child: MaskedImage(
        // frame: room.frame != null
        //     ? "${AppConstants.mediaUrl}/${room.frame}"
        //     : null,
        name:"test",
        no: no,
        hotIcon: 'assets/images/hot.webp',
        // hot: "20",
        // room.totalIncome != null ? "${room.totalIncome}" : "0",
        numOfVisitors: '1',
        // "${room.visitorsCount}",
        // country: room.owner?.country?.flag != null
        //     ? AppConstants.getMedia('country', "${room.owner?.country?.flag}")
        //     : null,
        isLocked: false,
        // room.hasPassword!,
        image: room,
        // AppConstants.getMedia('', "${room.cover}"),
      ),
    );
  }
}
