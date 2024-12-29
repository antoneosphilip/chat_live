import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_app/controller/room_controller.dart';
import 'package:live_app/view/base/room/widget/room_background_list_view.dart';
import 'package:live_app/view/widgets/custom_no_data.dart';

import '../../../../util/colors.dart';
import '../../../../util/styles.dart';
import '../../../screens/create_family/widget/elvated_button.dart';
import '../../../widgets/loading_idicator.dart';

void showBackGroundRoom(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: "Dismiss",
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 500),
    pageBuilder: (context, animation1, animation2) {
      return GetBuilder<RoomController>(
        builder: (RoomController roomController) {
          return Align(
              alignment: Alignment.topCenter,
              child: Container(
                  height: 500.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                  ),
                  child: roomController.isLoading
                      ? const LoadingIndicator()
                      : roomController
                              .getBackGroundList!.backGroundList!.isNotEmpty
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(height: 20.h),
                                Center(
                                  child: Text(
                                    'BackGround',
                                    style: robotoBlack3.copyWith(
                                        color: Colors.grey,
                                        decoration: TextDecoration.none,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.sp),
                                  ),
                                ),
                                SizedBox(height: 15.h),
                                Padding(
                                  padding: EdgeInsets.only(left: 16.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      RoomBackGroundListView(
                                        backGroundList: roomController
                                            .getBackGroundList!.backGroundList!,
                                      ),
                                    ],
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    width: 280.w,
                                    decoration: BoxDecoration(
                                      gradient:
                                          ColorManger.purpleToWhiteGradient,
                                      borderRadius: BorderRadius.circular(24.r),
                                    ),
                                    child: ElevatedButtonWidget(
                                      onTap: () async {
                                        // await roomController.updateRoomTypes();
                                      },
                                      width: 280,
                                      text: 'Submit',
                                      backGroundColor: Colors.transparent,
                                      textColor: ColorManger.whiteColor,
                                      borderColor: ColorManger.colorPurple,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : const CustomNoData(text: "no BackGround Found")));
        },
      );
    },
    transitionBuilder: (context, anim1, anim2, child) {
      return SlideTransition(
        position: Tween(
          begin: const Offset(0, -1),
          end: const Offset(0, 0),
        ).animate(anim1),
        child: child,
      );
    },
  );
}
