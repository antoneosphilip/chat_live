import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_app/controller/searching_controller.dart';

import '../../../../util/dimensions.dart';
import '../../../base/footer_view.dart';
import '../../../base/item_view.dart';

class ItemView extends StatelessWidget {
  final bool isRoom;
  const ItemView({Key? key, required this.isRoom}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MySearchController>(builder: (searchController) {
        return SingleChildScrollView(
          child: FooterView(
            child: SizedBox(
              width: Dimensions.webMaxWidth,
              child: ItemsView(
                isRoom: isRoom,
                rooms: searchController.searchRoomList,
                users: searchController.searchUserList,
              ),
            ),
          ),
        );
      }),
    );
  }
}
