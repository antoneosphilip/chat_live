import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_app/data/model/response/conversation_model.dart';

import '../../../../controller/auth_controller.dart';
import '../../../../controller/user_controller.dart';
import '../../../../data/model/body/notification_body.dart';
import '../../../../helper/route_helper.dart';
import '../../../../util/app_constants.dart';
import '../../../../util/images.dart';
import '../../../base/confirmation_dialog.dart';
import '../../../widgets/custom_card.dart';
import '../../../widgets/image_button.dart';
import '../../create_family/create_family.dart';
import '../../level/level_screen.dart';

class MineOther extends StatelessWidget {
  final UserController userController;
  const MineOther({super.key, required this.userController});

  @override
  Widget build(BuildContext context) {
    return  CustomCard(
      // backgroundImage: 'assets/images/one_bg.png',
      child: Container(
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            Text('other'.tr),
            SizedBox(
              height: 10.h,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment
                      .spaceEvenly,
                  children: [
                    ImageButton(
                      text: 'invite_friends'.tr,
                      image:
                      'assets/icon/invite.webp',
                      onTap: () {
                        Get.toNamed(RouteHelper
                            .inviteFriends);
                      },
                    ),
                    ImageButton(
                      text: 'level'.tr,
                      image:
                      'assets/icon/level.webp',
                      onTap: () {
                        Get.to(
                            const LevelScreen());
                      },
                    ),
                    // ImageButton(
                    //   text: 'my_family'.tr,
                    //   image: 'assets/icon/my_family.webp',
                    //   onTap: () {
                    //     Get.to(
                    //         () => const UserFamilyScreen(
                    //               id: 0,
                    //             ));
                    //   },
                    // ),
                    ImageButton(
                      text: 'my family'.tr,
                      image:
                      'assets/icon/my_family.webp',
                      onTap: () {
                        Get.to(() => CreateFamily(
                          image: userController
                              .userModelStatic
                              ?.image ??
                              "",
                          hasFamily:
                          userController
                              .userModelStatic!
                              .hasFamily!,
                          gold: userController
                              .userModelStatic!
                              .wallet!
                              .gold!,
                          id: 0,
                        ));
                      },
                    ),
                    // ImageButton(
                    //   text: 'medals'.tr,
                    //   image: 'assets/icon/medal.webp',
                    //   onTap: () {},
                    // ),
                  ],
                ),
                 SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment
                      .spaceEvenly,
                  children: [
                    ImageButton(
                      text: 'language'.tr,
                      image:
                      'assets/icon/launage.webp',
                      onTap: () {
                        Get.toNamed(RouteHelper
                            .getLanguageRoute(
                            'menu'));
                      },
                    ),
                    ImageButton(
                      text: 'contact_us'.tr,
                      image:
                      'assets/icon/chat.webp',
                      onTap: () {
                        Get.toNamed(
                          RouteHelper
                              .getChatRoute(
                            notificationBody:
                            NotificationBody(
                              notificationType:
                              NotificationType
                                  .message,
                              receiverId: 0,
                              receiverType:
                              AppConstants
                                  .admin,
                            ),
                          ),
                        );
                      },
                    ),
                    ImageButton(
                      text: 'settings'.tr,
                      image:
                      'assets/icon/setting.webp',
                      onTap: () {
                        Get.toNamed(RouteHelper
                            .settingScreen);
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment
                      .spaceEvenly,
                  children: [
                    ImageButton(
                      text: 'network_test'.tr,
                      image:
                      'assets/icon/net_test.webp',
                      onTap: () {
                        Get.toNamed(RouteHelper
                            .networkTest);
                      },
                    ),
                    ImageButton(
                      text: 'our_policy'.tr,
                      image:
                      'assets/icon/policy.webp',
                      onTap: () {
                        Get.toNamed(RouteHelper
                            .getHtmlRoute(
                            'privacy-policy'));
                      },
                    ),
                    ImageButton(
                      text: 'log_out'.tr,
                      image:
                      'assets/icon/logout.webp',
                      onTap: () {
                        if (Get.find<
                            AuthController>()
                            .isLoggedIn()) {
                          Get.dialog(
                              ConfirmationDialog(
                                  icon: Images
                                      .support,
                                  description:
                                  'are_you_sure_to_logout'
                                      .tr,
                                  isLogOut: true,
                                  onYesPressed:
                                      () {
                                    Get.find<
                                        UserController>()
                                        .clearUserInfo();
                                    Get.find<
                                        AuthController>()
                                        .clearSharedData();
                                    Get.find<
                                        AuthController>()
                                        .socialLogout();

                                    Get.offAllNamed(
                                        RouteHelper.getSignInRoute(
                                            RouteHelper
                                                .splash));
                                  }),
                              useSafeArea: false);
                        } else {
                          Get.toNamed(RouteHelper
                              .getSignInRoute(Get
                              .currentRoute));
                        }
                      },
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
