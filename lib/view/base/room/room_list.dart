import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_app/controller/room_controller.dart';

class RoomList extends StatefulWidget {
  final ScrollController scrollController;
  const RoomList({Key? key, required this.scrollController}) : super(key: key);

  @override
  State<RoomList> createState() => _RoomListState();
}

class _RoomListState extends State<RoomList> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RoomController>(builder: (roomController) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        // child: roomController.room_list.isNotEmpty
        //     ? PaginatedListWidget(
        //         scrollController: widget.scrollController,
        //         page: roomController.page,
        //         isLoading: roomController.isLoading,
        //         enabledPagination: true,
        //         onPaginate: (int? page) {
        //           roomController.getRooms('');
        //         },
        //         itemView: ListView.builder(
        //           physics: const NeverScrollableScrollPhysics(),
        //           shrinkWrap: true,
        //           reverse: true,
        //           itemCount: roomController.room_list.length,
        //           itemBuilder: (context, index) {
        //             return RoomListItem(
        //                 room: roomController.room_list[index]);
        //           },
        //         ),
        //       )
        //     : const Center(child: CircularProgressIndicator()),
      );
    });
  }
}
