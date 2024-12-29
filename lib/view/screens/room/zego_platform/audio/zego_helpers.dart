import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_app/view/base/custom_image.dart';
import 'package:zego_uikit_prebuilt_live_audio_room/zego_uikit_prebuilt_live_audio_room.dart';

import '../../../../../util/app_constants.dart';
import '../../../../base/room/gift_box.dart';

class ZegoHelper {
  static ZegoUIKitPrebuiltLiveAudioRoomConfig
      zegoUIKitPrebuiltLiveAudioRoomConfig({required bool isHost}) {
    return isHost
        ? ZegoUIKitPrebuiltLiveAudioRoomConfig.host()
        : ZegoUIKitPrebuiltLiveAudioRoomConfig.audience();
  }

  static List<ZegoLiveAudioRoomLayoutRowConfig> rowConfigs() {
    return [
      ZegoLiveAudioRoomLayoutRowConfig(
        count: 1,
        alignment: ZegoLiveAudioRoomLayoutAlignment.center,
      ),
      ZegoLiveAudioRoomLayoutRowConfig(
        count: 4,
        alignment: ZegoLiveAudioRoomLayoutAlignment.spaceAround,
      ),
      ZegoLiveAudioRoomLayoutRowConfig(
        count: 4,
        alignment: ZegoLiveAudioRoomLayoutAlignment.spaceAround,
      ),
      ZegoLiveAudioRoomLayoutRowConfig(
        count: 4,
        alignment: ZegoLiveAudioRoomLayoutAlignment.spaceAround,

      ),
    ];
  }

  static ZegoLiveAudioRoomBottomMenuBarConfig zegoBottomMenuBarConfig({required int roomId}) {
    return ZegoLiveAudioRoomBottomMenuBarConfig(
      maxCount: 4,
      hostButtons: [
        ZegoLiveAudioRoomMenuBarButtonName.toggleMicrophoneButton,
        ZegoLiveAudioRoomMenuBarButtonName.showMemberListButton,
      ],
      audienceButtons: [
        ZegoLiveAudioRoomMenuBarButtonName.showMemberListButton,
      ],
      audienceExtendButtons: [ GiftBox(roomId:roomId)],
      hostExtendButtons: [ GiftBox(roomId:roomId)],
      speakerExtendButtons: [ GiftBox(roomId:roomId)],
      speakerButtons: [
        ZegoLiveAudioRoomMenuBarButtonName.toggleMicrophoneButton,
        ZegoLiveAudioRoomMenuBarButtonName.showMemberListButton,
        // ZegoLiveAudioRoomMenuBarButtonName.soundEffectButton,
        // ZegoLiveAudioRoomMenuBarButtonName.minimizingButton,
        // ZegoLiveAudioRoomMenuBarButtonName.leaveButton,
      ],
    );
  }

  static ZegoLiveAudioRoomInRoomMessageConfig zegoInRoomMessageConfig(
      {String? userImage}) {
    return ZegoLiveAudioRoomInRoomMessageConfig(
      width: Get.size.width,
      paddings: const EdgeInsets.all(5),
      maxLines: 5,
      itemBuilder: (BuildContext context, ZegoInRoomMessage message,
          Map<String, dynamic> _) {
        return Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    avatarBuilder(size: const Size(10, 10), userImage: userImage),
                    RichText(
                      text: TextSpan(text: message.user.name),
                    ),
                  ],
                ),
                RichText(
                  maxLines: 5,
                  overflow: TextOverflow.clip,
                  text: TextSpan(text: message.message),
                ),
              ],
            ));
      },
    );
  }

  static ZegoLiveAudioRoomSeatConfig zegoLiveAudioRoomSeatConfig(
      {String? userImage}) {
    return ZegoLiveAudioRoomSeatConfig()
      ..backgroundBuilder = backgroundBuilder
      ..foregroundBuilder = foregroundBuilder
      ..showSoundWaveInAudioMode = true
      ..avatarBuilder = (BuildContext context, Size size, ZegoUIKitUser? user,
              Map extraInfo) =>
          avatarBuilder(size: size, userImage: userImage);
  }

  static ZegoLiveAudioRoomDialogInfo zegoDialogInfo() {
    return ZegoLiveAudioRoomDialogInfo(
      title: "Leave the room".tr,
      message: "Are you sure to leave the room?".tr,
      cancelButtonName: "Cancel".tr,
      confirmButtonName: "Leave".tr,
    );
  }

  static Widget background(
      {String? backgroundImg, String? roomName, String? roomID}) {
    return Stack(
      children: [
        CustomImage(
          image:
              "${AppConstants.baseUrl}/${AppConstants.mediaPath}/$backgroundImg",
          width: Get.size.width,
          height: Get.size.height,
          fit: BoxFit.fill,
          placeholder: 'assets/images/audio_bg.png',
        ),
        Positioned(
          top: 10,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              children: [
                Text(
                  "$roomName",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: const Color(0xfff6f1f1),
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "ID: $roomID",
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xfff8f5f5),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  static bool isAttributeHost(
      ValueNotifier<Map<String, String>>? userInRoomAttributes) {
    return ("") == ZegoLiveAudioRoomRole.host.index.toString();
  }

  static Widget backgroundBuilder(
      BuildContext context, Size size, ZegoUIKitUser? user, Map extraInfo) {
    if (!isAttributeHost(user?.inRoomAttributes)) {
      return Container();
    }

    return Positioned(
      top: -10,
      left: -1,
      child: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/image/test_frame.webp')),
        ),
      ),
    );
  }

  static Widget avatarBuilder({required Size size, String? userImage}) {
    return CircleAvatar(
      maxRadius: size.width,
      backgroundImage: NetworkImage(
        '${AppConstants.mediaUrl}/profile/${userImage}',
      ),
    );
  }



  static Widget foregroundBuilder(
      BuildContext context, Size size, ZegoUIKitUser? user, Map extraInfo){
    var userName = user?.name.isEmpty ?? true
        ? Padding(
      padding:EdgeInsets.only(right: 4.w,bottom: 11.h),
      child: Center(
          child:Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SizedBox(
                width: 55.w,
                child: Column(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(top: 5.h),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          const Image(
                            image: AssetImage('assets/image/chair.webp'),
                            fit: BoxFit
                                .cover, // Ensure the image covers the circle
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 5), // Reduced padding
                            child: Text(
                              (0).toString(),
                              style: const TextStyle(
                                  color: Colors.yellowAccent,
                                  fontSize: 12), // Reduced font size
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
      ),
    )
        : Center(
          child: Padding(
            padding:  EdgeInsets.only(top: 65.h),
            child: Text(
              user?.name ?? "unknown".tr,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.none,
                  color: Colors.white),
            ),
          ),
        );

    if (!isAttributeHost(user?.inRoomAttributes)) {
      return userName;
    }

    var hostIconSize = Size(size.width / 2, size.height / 2);
    var hostIcon = Center();

    return Stack(children: [userName, hostIcon]);
  }

  static Widget avatar({String? userImage}) {
    return CircleAvatar(
      backgroundImage:
          NetworkImage('${AppConstants.mediaUrl}/profile/${userImage}'),
    );
  }
}
