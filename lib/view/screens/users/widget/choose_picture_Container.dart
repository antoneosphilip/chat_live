import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../controller/user_controller.dart';

class ChoosePictureContainer extends StatelessWidget {
  const ChoosePictureContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();

    return  Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: const Icon(Icons.camera),
          title: const Text('Picture'),
          onTap: () {
            userController.pickImageUpdateProfile(ImageSource.camera);
            Navigator.pop(context); // Close the bottom sheet
          },
        ),
        ListTile(
          leading: Icon(Icons.image),
          title: Text('Album'),
          onTap: () {
            userController.pickImageUpdateProfile(ImageSource.gallery);
            Navigator.pop(context); // Close the bottom sheet
          },
        ),
        Divider(height: 20), // Optional divider for spacing
        ListTile(
          title: Center(child: Text('Cancel')),
          onTap: () {
            Navigator.pop(context); // Close the bottom sheet
          },
        ),
      ],
    );
  }
}
