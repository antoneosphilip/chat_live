import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_app/data/model/response/user_model.dart';

import '../../../../controller/room_controller.dart';
import '../../../../data/model/response/room_model.dart';
import '../../../../util/dimensions.dart';
import '../../../../util/styles.dart';

class RoomMemberItem extends StatelessWidget {
  final UserModel user;
  final int myId;
  final RoomModel roomModel;

  const RoomMemberItem(
      {super.key,
      required this.user,
      required this.myId,
      required this.roomModel});

  @override
  Widget build(BuildContext context) {
    final roomController = Get.find<RoomController>();
    bool isHost = checkIfHost(
        roomModel: roomModel, roomController: roomController, user: user);
    bool isYou = checkIfYou(user: user, myId: myId);
    return Row(
      children: [
        SizedBox(
          width: 50.w,
          child: ClipOval(
            // Make sure the image fits in a circular shape
            child: FadeInImage.assetNetwork(
              placeholder:
                  'https://www.bing.com/th?id=OIP.roQHQEuNf8SdJJ7wS3RxtgHaHa&w=150&h=150&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2',
              // Provide a local placeholder image
              image: '${user.image}',
              fit: BoxFit.cover,
              // Ensure the image covers the entire circular area
              imageErrorBuilder: (context, error, stackTrace) {
                return const Image(
                    image: NetworkImage(
                        'https://www.bing.com/th?id=OIP.roQHQEuNf8SdJJ7wS3RxtgHaHa&w=150&h=150&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2')); // Handle image loading error
              },
            ),
          ),
        ),
        SizedBox(width: 10.w),
        Text(user.name!,
            style: robotoWhite.copyWith(fontSize: Dimensions.fontSizeLarge)),
        SizedBox(
          width: 2.w,
        ),
        Text(
          "${isYou ? '(you${!isHost ? ')' : ','}' : ''}${isHost && isYou ? 'host)' : isHost && !isYou ? '(host)' : ''}",
          style: robotoWhite.copyWith(color: Colors.grey),
        )
      ],
    );
  }
}

bool checkIfYou({required int myId, required UserModel user}) {
  return myId == user.id;
}

bool checkIfHost({required roomModel, required roomController, required user}) {
  if (roomModel.owner != null) {
    if (roomController.inRoom!.owner!.id == user.id) {
      return true;
    }
  }
  return false;
}
