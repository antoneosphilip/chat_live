import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_app/data/model/response/room_model.dart';
import 'package:live_app/view/base/custom_app_bar.dart';

import '../../../controller/room_controller.dart';
import '../../../controller/user_controller.dart';
import '../../base/no_data_screen.dart';
import '../../base/room/room_list_item.dart';
import '../../widgets/loading_idicator.dart';
import '../../widgets/paginated_list_widget.dart';

class RoomLisScreen extends StatefulWidget {
  final String title;
  final String? filter;
  const RoomLisScreen({super.key, required this.title, this.filter});

  @override
  State<RoomLisScreen> createState() => _RoomLisScreenState();
}

class _RoomLisScreenState extends State<RoomLisScreen> {
  final ScrollController _scrollController = ScrollController();
  List<RoomModel> roomList = [];
  int page = 1;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    if (roomList.isEmpty) {
      getData();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  void getData() async {
    isLoading = true;
    List<RoomModel> res = await Get.find<RoomController>()
        .getListOfRooms('page=$page&&${widget.filter}');
    if (res.isNotEmpty) {
      page += 1;
      roomList.addAll(res);
    }
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: widget.title,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: isLoading
              ? const LoadingIndicator()
              : SingleChildScrollView(
                  child: roomList.isNotEmpty
                      ? PaginatedListWidget(
                          scrollController: _scrollController,
                          page: page,
                          isLoading: isLoading,
                          enabledPagination: true,
                          onPaginate: (int? page) {
                            setState(() {
                              getData();
                            });
                          },
                          itemView: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            reverse: true,
                            itemCount: roomList.length,
                            itemBuilder: (context, index) {
                              return Container(
                                  height: 100,
                                  child: RoomListItem(
                                    room: roomList[index], userModel:  Get.find<UserController>().userModel!,
                                  ));
                            },
                          ),
                        )
                      : NoDataScreen(
                          text: 'no rooms'.tr,
                        ),
                ),
        ),
      ),
    );
  }
}
