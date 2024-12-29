import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:live_app/util/styles.dart';
import 'package:live_app/view/base/room/widget/room_defination_item.dart';
import 'package:live_app/view/base/room/widget/type_room_list_view.dart';
import 'package:live_app/view/screens/family/widget/join_family_button.dart';

import '../../../../util/colors.dart';
import '../../../../util/dimensions.dart';
import '../../../../util/images.dart';
import '../../custom_image.dart';
import 'custom_edit_room_textform_field.dart';
import 'edit_room_app_bar.dart';
import 'edit_room_image_person.dart';
import 'edit_room_settings.dart';

class EditRoom extends StatelessWidget {
  const EditRoom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/back_ground_type_room.webp'),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  const EditRoomAppBar(),
                  SizedBox(
                    height: 20.h,
                  ),
                  const EditRoomImagePerson(),
                  SizedBox(
                    height: 15.h,
                  ),
                  const EditRoomSettings(),
                ],
              ),
            ),
          ),
          JoinFamilyButton(
            width: 320,
            colorText: Colors.white,
            text: 'Confirm', onTap: () {

          },)
        ],
      ),
    );
  }
}
