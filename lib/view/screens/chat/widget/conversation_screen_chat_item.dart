import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../controller/localization_controller.dart';
import '../../../../controller/user_controller.dart';
import '../../../../data/model/body/notification_body.dart';
import '../../../../data/model/response/conversation_model.dart';
import '../../../../helper/date_converter.dart';
import '../../../../helper/route_helper.dart';
import '../../../../util/app_constants.dart';
import '../../../../util/dimensions.dart';
import '../../../../util/styles.dart';
import '../../../base/custom_image.dart';
import '../../../base/custom_ink_well.dart';
import '../../../base/custom_snackbar.dart';

class ConversationScreenChatListview extends StatelessWidget {
  final ConversationsModel conversation;

  const ConversationScreenChatListview({super.key, required this.conversation});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: conversation
          .conversations!.length,
      physics:
      const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        print(
            '========== ${index} ==================');
        User? user;
        String? type;

        if (conversation
            .conversations![index]!
            .sender
            ?.id ==
            Get.find<UserController>()
                .userModel
                ?.id) {
          if (conversation
              .conversations![
          index]!
              .senderType ==
              AppConstants.admin ||
              conversation
                  .conversations![
              index]!
                  .receiverType ==
                  AppConstants.admin) {
            user = User(
                id: 0,
                image: '',
                fName: 'migo',
                lName: '');
            type = AppConstants.admin;
          } else {
            user = conversation
                .conversations![index]!
                .receiver;
            type = conversation
                .conversations![index]!
                .receiverType;
          }
        } else {
          if (conversation
              .conversations![
          index]!
              .senderType ==
              AppConstants.admin ||
              conversation
                  .conversations![
              index]!
                  .receiverType ==
                  AppConstants.admin) {
            user = User(
                id: 0,
                image: '',
                fName: 'migo',
                lName: '');
            type = AppConstants.admin;
          } else {
            user = conversation
                .conversations![index]!
                .sender;
            type = conversation
                .conversations![index]!
                .senderType;
          }
        }
        print(
            '=======================================');
        print(index);
        print(
            '=======================================');
        print(user?.toJson());
        print(
            '=======================================');
        print(conversation
            ?.conversations![index]!
            .toJson());
        print(
            '=======================================');
        String? baseUrl = '';
        if (type == AppConstants.admin) {
          baseUrl = '';
        } else {
          baseUrl =
          "${AppConstants.mediaUrl}/profile";
        }

        return Container(
          margin: const EdgeInsets.only(
              bottom: Dimensions
                  .paddingSizeSmall),
          decoration: BoxDecoration(
            color: Theme.of(context)
                .cardColor,
            borderRadius:
            BorderRadius.circular(
                Dimensions
                    .radiusSmall),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 1,
                  blurRadius: 5)
            ],
          ),
          child: CustomInkWell(
            onTap: () {
              if (user != null) {
                Get.toNamed(RouteHelper
                    .getChatRoute(
                  notificationBody:
                  NotificationBody(
                    type: conversation!
                        .conversations![
                    index]!
                        .senderType,
                    notificationType:
                    NotificationType
                        .message,
                    receiverType: type,
                  ),
                  conversationID:
                  conversation
                      .conversations![
                  index]!
                      .id,
                  index: index,
                ));
              } else {
                showCustomSnackBar(
                    '${type!.tr} ${'not_found'.tr}');
              }
            },
            highlightColor:
            Theme.of(context)
                .colorScheme
                .background
                .withOpacity(0.1),
            radius:
            Dimensions.radiusSmall,
            child: Stack(children: [
              Padding(
                padding: const EdgeInsets
                    .all(Dimensions
                    .paddingSizeSmall),
                child: Row(children: [
                  ClipOval(
                    child: CustomImage(
                      height: 50,
                      width: 50,
                      image:
                      '$baseUrl/${user != null ? user.image : ''}',
                    ),
                  ),
                  const SizedBox(
                      width: Dimensions
                          .paddingSizeSmall),
                  Expanded(
                      child: Column(
                          mainAxisAlignment:
                          MainAxisAlignment
                              .start,
                          crossAxisAlignment:
                          CrossAxisAlignment
                              .start,
                          children: [
                            user != null
                                ? Text(
                              '${user.fName} ${user.lName}',
                              style:
                              robotoMedium,
                            )
                                : Text(
                                '${type!.tr} ${'deleted'.tr}',
                                style:
                                robotoMedium),
                            const SizedBox(
                                height: Dimensions
                                    .paddingSizeExtraSmall),
                            user != null
                                ? Text(
                              type == 'customer'
                                  ? 'user'
                                  .tr
                                  : type!
                                  .tr,
                              style: robotoRegular.copyWith(
                                  fontSize: Dimensions
                                      .fontSizeSmall,
                                  color:
                                  Theme.of(context).disabledColor),
                            )
                                : const SizedBox(),
                          ])),
                ]),
              ),
              Positioned(
                right: Get.find<
                    LocalizationController>()
                    .isLtr
                    ? 5
                    : null,
                bottom: 5,
                left: Get.find<
                    LocalizationController>()
                    .isLtr
                    ? null
                    : 5,
                child: Text(
                  DateConverter.localDateToIsoStringAMPM(
                      DateConverter.dateTimeStringToDate(
                          conversation
                              .conversations![
                          index]!
                              .lastMessageTime!)),
                  style: robotoRegular.copyWith(
                      color: Theme.of(
                          context)
                          .hintColor,
                      fontSize: Dimensions
                          .fontSizeExtraSmall),
                ),
              ),
              GetBuilder<UserController>(
                  builder:
                      (userController) {
                    return (userController.userInfoModel != null &&
                        userController
                            .userInfoModel!
                            .userInfo !=
                            null &&
                        conversation!
                            .conversations![
                        index]!
                            .lastMessage!
                            .senderId !=
                            userController
                                .userInfoModel!
                                .userInfo!
                                .id &&
                        conversation
                            .conversations![
                        index]!
                            .unreadMessageCount! >
                            0)
                        ? Positioned(
                      right: Get.find<
                          LocalizationController>()
                          .isLtr
                          ? 5
                          : null,
                      top: 5,
                      left: Get.find<
                          LocalizationController>()
                          .isLtr
                          ? null
                          : 5,
                      child: Container(
                        padding: const EdgeInsets
                            .all(
                            Dimensions
                                .paddingSizeExtraSmall),
                        decoration: BoxDecoration(
                            color: Theme.of(
                                context)
                                .primaryColor,
                            shape: BoxShape
                                .circle),
                        child: Text(
                          conversation
                              .conversations![
                          index]!
                              .unreadMessageCount
                              .toString(),
                          style: robotoMedium.copyWith(
                              color: Theme.of(
                                  context)
                                  .cardColor,
                              fontSize:
                              Dimensions
                                  .fontSizeExtraSmall),
                        ),
                      ),
                    )
                        : const SizedBox();
                  }),
            ]),
          ),
        );
      },
    );
  }
}
