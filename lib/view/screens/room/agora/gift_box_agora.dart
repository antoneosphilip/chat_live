import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_app/helper/route_helper.dart';
import 'package:live_app/util/colors.dart';
import 'package:live_app/util/styles.dart';
import 'package:live_app/view/base/room/gift_container.dart';
import 'package:live_app/view/base/room/widget/room_setting_bottom_sheet.dart';
import 'package:live_app/view/base/room/widget/room_setting_item.dart';

import 'gift_container_agora.dart';

class GiftBoxAgora extends StatelessWidget {
  final int roomId;
  const GiftBoxAgora({super.key, required this.roomId});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            Get.bottomSheet(GiftContainerAgora());
          },
          child: Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage('assets/image/gift_box.webp'),
                    fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(50),
                color: Colors.lightBlue),
          ),
        ),
        SizedBox(width:5.w ,),
        InkWell(
          onTap: ()
          {
            showModalBottomSheet(
                backgroundColor: const Color(0xff2F3037),
                clipBehavior: Clip.hardEdge, // Control how content is clipped
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
                ),
                context: context, builder:(context){
              return  RoomSettingBottomSheet(roomId: roomId,);
            } );
          },
          child: Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(50),
              color: ColorManger.primary,
            ),
            child: Icon(Icons.settings,color: Colors.white,),
          ),
        ),

      ],
    );
  }
}
