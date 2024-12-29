import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_app/util/app_constants.dart';
import 'package:live_app/view/screens/users/user_details_screen.dart';
import 'package:live_app/view/widgets/avatar_with_frame.dart';

import '../../controller/user_controller.dart';
import '../../data/model/response/user_model.dart';

class TopThree extends StatelessWidget {
  final List<UserModel>? users;
  const TopThree({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/top_three.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    AvatarWithFrame(
                      onTab: () {
                        if (users != null &&
                            users!.isNotEmpty &&
                            users!.length > 1) {
                          Get.find<UserController>()
                              .getUserDetails(users![1].id!);
                          Get.to(() => UserDetailsScreen(
                                user: users?[1],
                              ));
                        }
                      },
                      radius: 40,
                      frame: AssetImage(
                        'assets/images/top2.webp',
                      ),
                      avatar: (users != null &&
                              users!.isNotEmpty &&
                              users!.length > 1)
                          ? NetworkImage(
                              '${AppConstants.mediaUrl}/profile/${users?[1].image}')
                          : null,
                    ),
                    Text(
                      (users != null && users!.isNotEmpty && users!.length > 1)
                          ? '${users?[1].name}'
                          : '',
                      style: TextStyle(fontSize: 10),
                    ),
                    Text(
                      (users != null && users!.isNotEmpty && users!.length > 1)
                          ? 'ID:${users?[1].uuid}'
                          : '',
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  AvatarWithFrame(
                    onTab: () {
                      if (users != null && users!.isNotEmpty) {
                        Get.find<UserController>()
                            .getUserDetails(users![0].id!);
                        Get.to(() => UserDetailsScreen(
                              user: users?[0],
                            ));
                      }
                    },
                    radius: 40,
                    frame: AssetImage(
                      'assets/images/top1.webp',
                    ),
                    avatar: (users != null && users!.isNotEmpty)
                        ? NetworkImage(
                            '${AppConstants.mediaUrl}/profile/${users?[0].image}')
                        : null,
                  ),
                  Text(
                    (users != null && users!.isNotEmpty && users!.length > 0)
                        ? '${users?[0].name}'
                        : '',
                    style: TextStyle(fontSize: 10),
                  ),
                  Text(
                    (users != null && users!.isNotEmpty && users!.length > 0)
                        ? 'ID:${users?[0].uuid}'
                        : '',
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: AvatarWithFrame(
                      onTab: () {
                        if (users != null &&
                            users!.isNotEmpty &&
                            users!.length > 2) {
                          Get.to(UserDetailsScreen(
                            user: users?[2],
                          ));
                        }
                      },
                      radius: 40,
                      frame: AssetImage(
                        'assets/images/top3.webp',
                      ),
                      avatar: (users != null &&
                              users!.isNotEmpty &&
                              users!.length > 2)
                          ? NetworkImage(
                              '${AppConstants.mediaUrl}/profile/${users?[2].image}')
                          : null,
                    ),
                  ),
                  Text(
                    (users != null && users!.isNotEmpty && users!.length > 2)
                        ? '${users?[2].name}'
                        : '',
                    style: TextStyle(fontSize: 10),
                  ),
                  Text(
                    (users != null && users!.isNotEmpty && users!.length > 2)
                        ? 'ID:${users?[2].uuid}'
                        : '',
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
