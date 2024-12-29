import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_app/controller/localization_controller.dart';
import 'package:live_app/data/model/response/user_model.dart';
import 'package:live_app/util/app_constants.dart';
import 'package:live_app/view/screens/users/user_details_screen.dart';

import '../../controller/room_controller.dart';
import '../../controller/user_controller.dart';
import '../../util/images.dart';
import '../base/custom_image.dart';

class UserListItem extends StatelessWidget {
  final UserModel user;

  const UserListItem({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.find<UserController>().getUserDetails(user.id!);
        Get.to(() => UserDetailsScreen(
              user: user,
            ));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        width: MediaQuery.of(context).size.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipOval(
              child: CustomImage(
                placeholder: Images.guestIcon,
                image: '${AppConstants.mediaUrl}/profile/${user.image}',
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "${user.name}",
                          style: TextStyle(fontSize: 15, color: Colors.black54),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          user.gender == 'male'
                              ? 'assets/images/male.webp'
                              : 'assets/images/female.webp',
                          width: 10,
                          height: 10,
                          fit: BoxFit.fill,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    user.inRoom != null
                        ? InkWell(
                            onTap: () {
                              Get.find<RoomController>().joinRoom(user.inRoom!);
                            },
                            child: Container(
                              height: 20,
                              padding: Get.find<LocalizationController>()
                                          .locale
                                          .languageCode ==
                                      'ar'
                                  ? EdgeInsets.only(left: 5)
                                  : EdgeInsets.only(right: 5),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage('assets/images/btn.webp'),
                                      fit: BoxFit.fill),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/images/wave.gif',
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Join Now'.tr,
                                    style: TextStyle(fontSize: 12),
                                  )
                                ],
                              ),
                            ),
                          )
                        : SizedBox()
                  ],
                ),
                Row(
                  children: [
                    CustomImage(
                      image:
                          "${AppConstants.baseUrl}/${user.consigneeLevel?.currentImage}",
                      width: 30,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    CustomImage(
                      image:
                          "${AppConstants.baseUrl}/${user.senderLevel?.currentImage}",
                      width: 30,
                    ),
                  ],
                ),
                Text(
                  '${user.pio}',
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
