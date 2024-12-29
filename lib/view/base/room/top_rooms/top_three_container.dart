import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:live_app/view/base/room/top_rooms/square_top_rooms_item.dart';

import '../../../../controller/home_controller.dart';

class TopThreeContainer extends StatelessWidget {
  final HomeController homeController;
  const TopThreeContainer({super.key, required this.homeController});

  @override
  Widget build(BuildContext context) {
    return true
      // homeController.topRooms!.length >= 1
        ? Container(
            height: 250.h,
            padding: EdgeInsets.all(10),
            child: Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Center(
                      child: true
                      // homeController.topRooms!.length >= 1
                          ? SquareTopRoomsItem(
                              room: homeController.staticBannerImage[0],
                              no: '1',
                            )
                          : SizedBox(),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                true
                // homeController.topRooms!.length >= 2
                    ? Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: Container(
                                child: Center(
                                  child: true
                                  // homeController.topRooms!.length >= 2
                                      ? SquareTopRoomsItem(
                                          room: homeController.staticBannerImage[1],
                                          no: '2',
                                        )
                                      : const SizedBox(),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Expanded(
                              child: Container(
                                child: Center(
                                  child: true
                                  // homeController.topRooms!.length >= 3
                                      ? SquareTopRoomsItem(
                                          room: homeController.staticBannerImage[2],
                                          no: '3',
                                        )
                                      : SizedBox(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : SizedBox(),
              ],
            ),
          )
        : SizedBox();
  }
}
