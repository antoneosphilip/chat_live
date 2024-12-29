import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:live_app/controller/home_controller.dart';

import '../../../../controller/user_controller.dart';
import '../../../base/room/room_list_item.dart';
import '../../../widgets/paginated_list_widget.dart';

class RoomListView extends StatelessWidget {
  final HomeController homeController;
  final ScrollController _scrollController = ScrollController();

  RoomListView({super.key, required this.homeController});

  @override
  Widget build(BuildContext context) {

    return   Container(
        padding: const EdgeInsets.symmetric(
            horizontal: 10),
        child: PaginatedListWidget(
          scrollController: _scrollController,
          page: homeController.page,
          isLoading: homeController.isLoading,
          enabledPagination: true,
          onPaginate: (int? page) {
            homeController
                .paginate(homeController.page + 1);
          },
          itemView: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 10),
            child: Column(
              children: [
                ...?homeController.homeRoomsStatic?.map(
                      (e) => Container(
                    height: 120.h,
                    child: RoomListItem(
                      userModel: Get.find<UserController>().userModel,
                      room: e,
                    ),
                  ),
                ),
                !homeController.hasMoreData?  Text("No more data".tr):const SizedBox()
              ],
            ),
          ),
        )
    );
  }
}
