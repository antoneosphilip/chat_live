import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_app/controller/room_controller.dart';
import 'package:live_app/view/base/room/widget/black_list_item.dart';

import '../../../../util/styles.dart';
import '../../../widgets/custom_no_data.dart';
import '../../../widgets/loading_idicator.dart';

class BlackListContainer extends StatelessWidget {
  const BlackListContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RoomController>(builder: (roomController) {
      return roomController.isLoading
          ? const LoadingIndicator()
          : roomController.roomBlackListModel!.roomBlackListData!.isNotEmpty
              ? SizedBox(
                  width: double.infinity,
                  height: 500.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20.h),
                      Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 10.w,
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: 30.w,
                                    height: 30.h,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Colors.black, width: 2.w),
                                    ),
                                    child: const Icon(Icons.question_mark),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Text(
                                'List of BlackList',
                                style: robotoBlack2,
                              ),
                              const Spacer(),
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          ListView.separated(
                              scrollDirection: Axis.vertical,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return BlackListItem(
                                  roomBlackListData: roomController
                                      .roomBlackListModel!
                                      .roomBlackListData![index],
                                  index: index,
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: 10.h,
                                );
                              },
                              itemCount: roomController.roomBlackListModel!
                                  .roomBlackListData!.length)
                        ],
                      ),
                    ],
                  ))
              : const CustomNoData(text: 'No BlackList Found',);
    });
  }
}
