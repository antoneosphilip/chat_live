import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_app/controller/auth_controller.dart';
import 'package:live_app/controller/user_controller.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();

    if (Get.find<AuthController>().isLoggedIn() &&
        Get.find<UserController>().userInfoModel == null) {
      Get.find<UserController>().getUserInfo();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawerEnableOpenDragGesture: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      key: UniqueKey(),
      body: GetBuilder<UserController>(builder: (userController) {
        bool isLoggedIn = Get.find<AuthController>().isLoggedIn();
        return (isLoggedIn && userController.userInfoModel == null)
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView();
      }),
    );
  }
}
