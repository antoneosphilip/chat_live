import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_app/controller/room_controller.dart';
import 'package:live_app/controller/user_controller.dart';
import 'package:live_app/data/model/response/user_model.dart';
import 'package:live_app/view/screens/room/agora/room_row_icons.dart';
import 'package:live_app/view/screens/room/agora/seat_item.dart';

import '../../../../data/model/response/room_model.dart';
import '../../../../util/styles.dart';
import 'custom_chair.dart';
import 'custom_owner_iten.dart';
import 'leave_from_room_dialog.dart';
import 'name_widget.dart';

class AudioRoomAgoraScreen extends StatelessWidget {
  final RoomModel room;
  final UserModel  userModel;

  const AudioRoomAgoraScreen(
      {super.key, required this.room, required this. userModel});

  @override
  Widget build(BuildContext context) {
    final controller=Get.find<UserController>();
    return GetBuilder<RoomController>(
      builder: (roomController) {
        return WillPopScope(
          onWillPop: () async {
            showCustomDialog(context, 'room', () async {
              // await roomController.leaveChannel(
              //   userModel,
              //   room,
              // );
            });
            Navigator.pop(context);
            return true;
          },
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            body: Stack(
              children: [
                Container(
                  decoration:  BoxDecoration(
                    image:false?
                    DecorationImage(
                      image: CachedNetworkImageProvider(room.background!,),
                      fit: BoxFit.cover,
                    ):
                    const DecorationImage(image:AssetImage('assets/image/back_ground.webp'),fit: BoxFit.cover),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: true
                      ? Column(
                          children: [
                            SizedBox(height: 20.h),
                            NameWidget(
                              roomModel: room,
                              userModel: controller.userModelStatic
                            ),
                            SizedBox(height: 40.h),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Spacer(flex: 2),

                                SizedBox(
                                  width: 50.w,
                                  child: ((room.isOwner!) ||
                                      (roomController.inRoomStatic!.chairs?[0].user != null))
                                      ? CustomOwnerItem(
                                    roomModel: roomController.inRoomStatic!,
                                    chair: roomController.inRoomStatic!.chairs?[0],
                                  )
                                      : Container(
                                    width: 50.w, // Adjust width
                                    decoration: BoxDecoration(
                                      color: Colors.white70.withOpacity(.7),
                                      shape: BoxShape.circle,
                                    ),
                                    child: CustomChair(
                                      chair: roomController.inRoomStatic!.chairs![0],
                                      numberOfItem: 1,
                                      imageChair: 'assets/image/chair.webp',
                                    ),
                                  ),
                                ),

                                const Spacer(flex: 1),

                                Padding(
                                  padding: EdgeInsets.only(right: 11.w),
                                  child: SizedBox(
                                    width: 50.w,
                                    child: Column(
                                      children: [
                                        SeatItem(
                                          chair: roomController.inRoomStatic!.chairs![1],
                                          numberOfItem: 2,
                                            userModel:  controller.userModelStatic,
                                          roomModel: room,
                                          imageChair: 'assets/images/vip_chair.webp',
                                        ),
                                        ((room.isOwner!) || (roomController.inRoomStatic!.chairs?[0].user != null))
                                            ? Padding(
                                          padding: const EdgeInsets.only(top: 4.0),
                                          child: Text(
                                            "",
                                            style: robotoWhite.copyWith(fontSize: 10),
                                            textAlign: TextAlign.center,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                        )
                                            : const SizedBox(),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 15.h),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2),
                              child: SizedBox(
                                width: double.infinity,
                                child: GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount:
                                        4, // Number of items per row
                                    mainAxisSpacing: 10.h,
                                    crossAxisSpacing: 15.w,
                                  ),
                                  padding: const EdgeInsets.all(0),
                                  itemCount:
                                      roomController.inRoomStatic!.chairs!.length - 2,
                                  itemBuilder: (context, index) {
                                    return SeatItem(
                                      numberOfItem: index + 3,
                                       userModel:  controller.userModelStatic,
                                      roomModel: room,
                                      chair: roomController
                                          .inRoomStatic!.chairs![index + 2],
                                    );
                                  },
                                ),
                              ),
                            ),
                            const Spacer(),
                            RoomRowIcons(
                              roomController: roomController,
                              userModel:  controller.userModelStatic,
                              room: room,
                            ),
                            SizedBox(height: 10.h),
                          ],
                        )
                      : const SizedBox(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
