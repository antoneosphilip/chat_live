import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../widgets/section_container.dart';

class LiveRooms extends StatelessWidget {
  const LiveRooms({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      containerColor: Colors.white,
      title: 'Live Rooms'.tr,
      color: Colors.transparent,
      padding: const EdgeInsets.only(top: 15),
      enableBtn: false,
      body: SizedBox(
        height: 500.h,
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 48.w),
                  child: Container(
                      width: 300.w,
                      height: 150.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(48.r),
                              bottomLeft: Radius.circular(8.r),
                              topLeft: Radius.circular(48.r),
                              topRight: Radius.circular(8.r)),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/live_rooms.webp'),
                            fit: BoxFit.fill,
                            matchTextDirection: true,
                          ))),
                ),
                Padding(
                  padding:  EdgeInsets.only(right: 220.w,left: 20.w),
                  child: Container(
                    width: 170.w,
                    height: 80.h,
                    child: Image(image: NetworkImage('https://th.bing.com/th/id/OIP.IGNf7GuQaCqz_RPq5wCkPgHaLH?rs=1&pid=ImgDetMain'),fit: BoxFit.cover,),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
