import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_app/controller/reltionship_controller.dart';
import 'package:live_app/view/base/custom_app_bar.dart';
import 'package:live_app/view/screens/users/user_list_screen.dart';

class FollowersScreen extends StatelessWidget {
  const FollowersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar(
        title: 'Followers'.tr,
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
