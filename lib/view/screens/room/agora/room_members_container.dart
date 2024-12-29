import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_app/controller/room_controller.dart';
import 'package:live_app/view/screens/room/agora/room_member_item.dart';

import '../../../../data/model/response/room_model.dart';
import '../../../../util/dimensions.dart';
import '../../../../util/styles.dart';
import '../../../widgets/loading_idicator.dart';
import 'members_list_view.dart';

class RoomMembersContainer extends StatelessWidget {
  final int myId;
  final RoomModel roomModel;
  final RoomController roomController;
  const RoomMembersContainer({super.key, required this.myId, required this.roomModel, required this.roomController});

  @override
  Widget build(BuildContext context) {
    var list = Get.find<RoomController>().visitors;
    return  DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.85,
      minChildSize: 0.85,
      maxChildSize: 0.85,
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: Container(
            padding: const EdgeInsets.all(16),
            child: GetBuilder<RoomController>(
              builder: (RoomController roomController) {
              return  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.keyboard_arrow_down_sharp,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text('Members (${list.length})',
                            style: robotoWhiteBold.copyWith(
                                fontSize: Dimensions.fontSizeExtraLarge)),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Divider(
                      color: Colors.white.withOpacity(0.3),
                    ),
                    SizedBox(height: 20.h),
                 roomController.isLoading?
                  const LoadingIndicator():
                  MembersListView(list: list,roomModel: roomModel,myId: myId,)
                  ],
                );
              },
            ),
          ),
        );
      },
    );

  }
}
