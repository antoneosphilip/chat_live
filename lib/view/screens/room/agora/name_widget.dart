import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_app/controller/room_controller.dart';

import '../../../../data/model/response/room_model.dart';
import '../../../../data/model/response/user_model.dart';
import '../../../../util/styles.dart';

class NameWidget extends StatelessWidget {
  final RoomModel roomModel;
  final dynamic userModel;

  const NameWidget({super.key, required this.userModel, required this.roomModel});

  @override
  Widget build(BuildContext context) {
    return    Row(
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  roomModel.name!,
                  style: robotoWhite700,
                ),
                 Text(
                  "id: ${roomModel.owner?.uuid??""}",
                  style: robotoWhite700,
                )
              ],
            )
          ],
        ),
        const Spacer(),
        InkWell(
          onTap: () async {
            await Get.find<RoomController>().leaveChannel(
              userModel,
              roomModel,
            );
          },
          child: Container(
            padding: const EdgeInsets.all(3),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const Center(child: Icon(Icons.power_settings_new,color: Colors.black,size: 28,)),
          ),
        )
      ],
    );
  }
}
