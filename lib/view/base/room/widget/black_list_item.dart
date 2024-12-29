import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_app/controller/room_controller.dart';
import 'package:live_app/data/model/response/get_black_list_model.dart';
import 'package:live_app/view/screens/family/widget/custom_netwok_image.dart';

import '../../../../util/app_constants.dart';
import '../../../../util/colors.dart';
import '../../../../util/styles.dart';

class BlackListItem extends StatelessWidget {
  final RoomBlackListData roomBlackListData;
  final int index;

  const BlackListItem(
      {super.key, required this.roomBlackListData, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 10.w,
        ),
        Padding(
          padding: EdgeInsets.only(top: 15.h),
          child: Text('${index + 1}.',
              style: robotoGreySmall.copyWith(color: Colors.black)),
        ),
        SizedBox(
          width: 5.w,
        ),
        CustomNetworkImage(
          image:'${AppConstants.mediaUrl}/profile/${roomBlackListData.user?.image}',
          width: 50.w,
          height: 50.w,
        ),
        SizedBox(
          width: 15.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              roomBlackListData.user?.name!??"",
              style: robotoLargeBold.copyWith(fontWeight: FontWeight.w500),
            ),
            Container(
              width: 40.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.r),
                color: roomBlackListData.user?.gender == "male"
                    ? Colors.lightBlueAccent.shade100
                    : Colors.pinkAccent,
              ),
              child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: roomBlackListData.user?.gender == "male"
                      ? const Icon(
                          Icons.male,
                          color: Colors.blue,
                        )
                      : const Icon(
                          Icons.female,
                          color: Colors.pink,
                        )),
            )
          ],
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            Get.find<RoomController>().removeUserFromBlackList(
                userId: roomBlackListData.user!.id!);
          },
          child: Container(
            height: 30.h,
            decoration: BoxDecoration(
              border: Border.all(color: ColorManger.colorPurple),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'remove',
                  style: robotoWhite.copyWith(color: ColorManger.colorPurple),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 15.w,
        )
      ],
    );
  }
}
