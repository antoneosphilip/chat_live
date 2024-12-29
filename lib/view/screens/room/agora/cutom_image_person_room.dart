import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_app/controller/room_controller.dart';

import '../../../../data/model/response/room_model.dart';
import '../../../../util/app_constants.dart';
import '../../../../util/images.dart';
import '../../../base/custom_image.dart';

class CustomImagePersonRoom extends StatefulWidget {
  final String image;
  final Chairs? chair;

  const CustomImagePersonRoom(
      {super.key, required this.image, required this.chair});

  @override
  State<CustomImagePersonRoom> createState() => _CustomImagePersonRoomState();
}

class _CustomImagePersonRoomState extends State<CustomImagePersonRoom>
    with SingleTickerProviderStateMixin {
  final roomController = Get.find<RoomController>();


  @override
  Widget build(BuildContext context) {
    return GetBuilder<RoomController>(
      builder: (roomController) {
        return Container(
          child: ClipOval(
            child: CustomImage(
              placeholder: Images.guestIconLight,
              image: '${AppConstants.mediaUrl}/profile'
                  '/${widget.image}',
              width: 70.w,
              height: 50.h,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
