import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_app/controller/reltionship_controller.dart';
import 'package:live_app/view/screens/users/user_list_screen.dart';

import '../../base/custom_app_bar.dart';

class FriendsScreen extends StatelessWidget {
  const FriendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar(
        title: 'Friends'.tr,
      ),
      body: GetBuilder<RelationshipController>(
        builder: (controller) {
          return UserListScreen(
            list: controller.userList,
            onPaginate: (int? page) {
              controller.getFriendList();
            },
            isLoading: controller.isLoading,
          );
        },
      ),
    ));
  }
}
