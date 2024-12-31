import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_app/controller/home_controller.dart';
import 'package:live_app/controller/room_controller.dart';
import 'package:live_app/data/model/response/room_model.dart';
import 'package:live_app/data/model/response/user_model.dart';
import 'package:live_app/util/app_constants.dart';
import 'package:live_app/util/dimensions.dart';
import 'package:live_app/view/screens/room/agora/audio_room_Screen.dart';
import 'package:live_app/view/widgets/masked_image.dart';

import '../../../controller/splash_controller.dart';
import '../../../controller/user_controller.dart';
import '../../widgets/dynamic_image.dart';
import '../custom_image.dart';

class RoomListItem extends StatelessWidget {
  final RoomModel room;
  final String? uuid;
  final UserModel? userModel;
  const RoomListItem(  {super.key, required this.room, this.uuid, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
  /*    String? engine =
          Get.find<SplashController>().configModel!.liveStreamingEngine;*/
      double height = constraints.maxHeight * 0.75;
      return InkWell(
        onTap: () {
          // (engine == 'zego')
          //     ? Get.find<RoomController>().joinRoom(room)
            Get.to(AudioRoomAgoraScreen(room: Get.find<HomeController>().homeRoomsStatic[0], userModel: Get.find<UserController>().userModelStatic! ));
        },
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 50.w, right: 5.w),
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: Dimensions.paddingSizeSmall,
                    vertical: Dimensions.paddingSizeExtraSmall),
                margin:
                    const EdgeInsets.only(bottom: Dimensions.paddingSizeSmall),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.r),
                      topRight: Radius.circular(8.r),
                      bottomRight: Radius.circular(16.r),
                      bottomLeft: Radius.circular(8.r)),
                  image: DecorationImage(
                      image: NetworkImage(
                        "${AppConstants.baseUrl}/${room.type_image}",
                      ),
                      fit: BoxFit.fill,
                      matchTextDirection: true),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 0))
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w, top: 10.h),
              child: Container(
                width: 90.w,
                height: 80.h,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(16.r)),
                child: MaskedImage(
                  frame: room.frame != null
                      ? "${room.frame}"
                      // ${AppConstants.mediaUrl}/${room.frame}
                      : null,
                  image:
                      "${room.cover}",
                  // ${AppConstants.baseUrl}/${AppConstants.mediaPath}/${room.cover}
                  isLocked: room.hasPassword == true,
                ),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Padding(
              padding: EdgeInsets.only(left: 120.w),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 10.h),
                            child: Text(
                              "${room.name}",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10.w, top: 10.h),
                            child: Container(
                              padding: EdgeInsets.only(
                                  top: 3.h,
                                  bottom: 3.h,
                                  left: 7.w,
                                  right: 10.w),
                              decoration: BoxDecoration(
                                color: Colors.black54.withOpacity(.3),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/images/hot.webp",
                                    width: height * 0.2,
                                    height: height * 0.2,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    "${room.totalIncome}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: height * 0.15,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        room.owner?.country?.flag != null
                            ? DynamicImage(
                                image:
                                    "${AppConstants.mediaUrl}/country/${room.owner?.country?.flag}",
                                width: height * 0.3,
                                height: height * .2,
                                fromAssets: false,
                              )
                            : const SizedBox(),
                        SizedBox(
                          width: room.owner?.country?.flag != null ? 10.w : 0.w,
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.white54,
                            borderRadius: BorderRadius.circular(
                              5,
                            ),
                          ),
                          child: Text(
                            "ID :${room.owner?.uuid ?? uuid}",
                            style: TextStyle(
                                fontSize: 12.sp, color: Colors.purpleAccent),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 13.h,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CustomImage(
                                image:
                                    '${Get.find<UserController>().userModelStatic?.senderLevel?.currentImage}',
                                // ${AppConstants.baseUrl}/
                                width: 40,
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              CustomImage(
                                image:
                                    // ${AppConstants.baseUrl}
                                    '${Get.find<UserController>().userModelStatic?.consigneeLevel?.currentImage}',
                                width: 40,
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 15.w),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/wave.gif',
                                  color: Colors.blue,
                                  width: 15,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  room.visitorsCount != null
                                      ? "${room.visitorsCount}"
                                      : "0",
                                  style: TextStyle(
                                      fontSize: height * 0.15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w200),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
