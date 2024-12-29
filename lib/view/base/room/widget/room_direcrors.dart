import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_app/controller/room_controller.dart';

import '../../../../util/styles.dart';
import '../../../widgets/custom_no_data.dart';
import '../../../widgets/loading_idicator.dart';
import 'directors_item.dart';

class RoomDirectors extends StatelessWidget {
  const RoomDirectors({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 500.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.h),
            GetBuilder<RoomController>(
              builder: (RoomController roomController) {
                return roomController.isLoading?
                const LoadingIndicator():
                roomController.showRoomModel!.showRoomData!=null?
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: 10.w,),
                        Column(
                          children: [
                            Container(
                              width: 30.w,
                              height: 30.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.black, width: 2.w),
                              ),

                              child: const Icon(Icons.question_mark),
                            ),
                          ],
                        ),

                        const Spacer(),
                        Text(
                          'List of Directors',
                          style: robotoBlack2,
                        ),
                        const Spacer(),
                      ],
                    ),
                    SizedBox(height: 20.h,),
                    roomController.showRoomModel!.showRoomData!.admins!.isNotEmpty?
                    ListView.separated(
                        itemBuilder: (context, index) {
                      return DirectorsItem( admin: roomController.showRoomModel!.showRoomData!.admins![index], index: index,);
                    }, separatorBuilder: (context, index) {
                      return SizedBox(height: 15.h,);
                    }, itemCount: roomController.showRoomModel!.showRoomData!.admins!.length,
                    shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                    ):
                    const CustomNoData(text: "no Directors Found")
                  ],
                ):
                const Text("There are error please try later");
              },
            ),

          ],
        )
    );
  }
}
