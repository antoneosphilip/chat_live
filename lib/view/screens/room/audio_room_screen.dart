import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:live_app/controller/room_controller.dart';
import 'package:live_app/view/screens/room/agora/audio_room_Screen.dart';
import 'package:live_app/view/screens/room/zego_platform/audio/zego_room_screen.dart';

import '../../../controller/splash_controller.dart';
import '../../../controller/user_controller.dart';
import '../../base/room/layers/bottom_bar_layer.dart';
import '../../base/room/layers/gift_show_layer.dart';

class AudioRoomScreen extends StatelessWidget {
  const AudioRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RoomController roomController = Get.find();
    UserController userController = Get.find();
    String? engine =
        Get.find<SplashController>().configModel!.liveStreamingEngine;

    return Stack(
      children: [
        (engine == 'zego')
            ? ZegoRoomScreen(
                room: roomController.inRoom!,
                user: userController.userModel!,
              )
            : (engine == 'agora')
                ? AudioRoomAgoraScreen(room: roomController.inRoom!, userModel: userController.userModel!)
                : const SizedBox(),
        const BottomBarLayer(),
        const Positioned(bottom: 50, child: InRoomGiftShowLayer())
      ],
    );
  }
}
