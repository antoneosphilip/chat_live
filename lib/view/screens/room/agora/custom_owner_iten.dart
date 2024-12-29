import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_app/view/screens/room/agora/show_profile_container.dart';

import '../../../../controller/room_controller.dart';
import '../../../../data/model/response/room_model.dart';
import '../../../../util/app_constants.dart';
import '../../../../util/images.dart';
import '../../../../util/styles.dart';
import '../../../base/custom_image.dart';

class CustomOwnerItem extends StatelessWidget {
  final Chairs? chair;
  final RoomModel roomModel;

  const CustomOwnerItem({super.key, this.chair, required this.roomModel});

  @override
  Widget build(BuildContext context) {
    final roomController=Get.find<RoomController>();
    return GetBuilder<RoomController>(builder: (RoomController roomController) {
      return  InkWell(
        onTap: () {
          if(!roomModel.isOwner!)
          {
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
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: Colors.blue,
                      width: roomController.borderThickness
                  )
              ),
              child: ClipOval(
                child:CustomImage(
                  placeholder: Images.guestIconLight,
                  image: '${AppConstants.mediaUrl}/profile'
                      '/${roomController.inRoom!.owner!.image}',
                  width: 70.w,
                  height: 50.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 4.0),
              // Reduce top padding
              child: Text(
                roomController
                    .inRoom!.owner!.name!,
                // Show only the first name
                style: robotoWhite.copyWith(
                    fontSize: 10),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                // Avoid overflow
                maxLines: 1,
              ),
            ),
          ],
        ),
      );
    },

    );
  }
}
