import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_app/controller/auth_controller.dart';
import 'package:live_app/controller/chat_controller.dart';
import 'package:live_app/controller/localization_controller.dart';
import 'package:live_app/controller/user_controller.dart';
import 'package:live_app/data/model/body/notification_body.dart';
import 'package:live_app/data/model/response/conversation_model.dart';
import 'package:live_app/helper/date_converter.dart';
import 'package:live_app/helper/responsive_helper.dart';
import 'package:live_app/helper/route_helper.dart';
import 'package:live_app/util/app_constants.dart';
import 'package:live_app/util/dimensions.dart';
import 'package:live_app/util/styles.dart';
import 'package:live_app/view/base/custom_app_bar.dart';
import 'package:live_app/view/base/custom_image.dart';
import 'package:live_app/view/base/custom_ink_well.dart';
import 'package:live_app/view/base/custom_snackbar.dart';
import 'package:live_app/view/base/paginated_list_view.dart';
import 'package:live_app/view/screens/chat/widget/conversation_screen_chat_item.dart';
import 'package:live_app/view/screens/search/widget/search_field.dart';

class ConversationScreen extends StatefulWidget {
  final bool fromNavBar;
  const ConversationScreen({Key? key, this.fromNavBar = false})
      : super(key: key);

  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    initCall();
  }

  void initCall() {
    if (Get.find<AuthController>().isLoggedIn()) {
      Get.find<UserController>().getUserInfo();
      Get.find<ChatController>().getConversationList(1,
          type: ResponsiveHelper.isDesktop(Get.context) ? 'vendor' : '');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(builder: (chatController) {
      ConversationsModel? conversation;
      if (chatController.searchConversationModel != null) {
        conversation = chatController.searchConversationModel;
      } else {
        conversation = chatController.conversationsModelStatic;
      }

      return Scaffold(
        // appBar: CustomAppBar(
        //     title: 'conversation_list'.tr, backButton: !widget.fromNavBar),
        // endDrawerEnableOpenDragGesture: false,
        // floatingActionButton: (chatController.conversationModel != null &&
        //         !chatController.hasAdmin)
        //     ? FloatingActionButton.extended(
        //         label: SizedBox(
        //           width: context.width * 0.75,
        //           child: Text(
        //             '${'chat_with'.tr} migo',
        //             maxLines: 2,
        //             overflow: TextOverflow.ellipsis,
        //             style: robotoMedium.copyWith(
        //                 fontSize: Dimensions.fontSizeLarge,
        //                 color: Colors.white),
        //           ),
        //         ),
        //         icon: const Icon(Icons.chat, color: Colors.white),
        //         backgroundColor: Theme.of(context).primaryColor,
        //         onPressed: () => Get.toNamed(
        //           RouteHelper.getChatRoute(
        //             notificationBody: NotificationBody(
        //               notificationType: NotificationType.message,
        //               receiverId: 0,
        //               receiverType: AppConstants.admin,
        //             ),
        //           ),
        //         ),
        //       )
        //     : null,
        body: Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
          child: Column(children: [
            // (Get.find<AuthController>().isLoggedIn() &&
            //         conversation != null &&
            //         conversation.conversations != null &&
            //         chatController.conversationModel!.conversations!.isNotEmpty)
            //     ? Center(
            //         child: SizedBox(
            //             width: Dimensions.webMaxWidth,
            //             child: SearchField(
            //               controller: _searchController,
            //               hint: 'search'.tr,
            //               suffixIcon:
            //                   chatController.searchConversationModel != null
            //                       ? Icons.close
            //                       : Icons.search,
            //               onSubmit: (String text) {
            //                 if (_searchController.text.trim().isNotEmpty) {
            //                   chatController.searchConversation(
            //                       _searchController.text.trim());
            //                 } else {
            //                   showCustomSnackBar('write_something'.tr);
            //                 }
            //               },
            //               iconPressed: () {
            //                 if (chatController.searchConversationModel !=
            //                     null) {
            //                   _searchController.text = '';
            //                   chatController.removeSearchMode();
            //                 } else {
            //                   if (_searchController.text.trim().isNotEmpty) {
            //                     chatController.searchConversation(
            //                         _searchController.text.trim());
            //                   } else {
            //                     showCustomSnackBar('write_something'.tr);
            //                   }
            //                 }
            //               },
            //             )))
            //     : const SizedBox(),
            SizedBox(
                height: (Get.find<AuthController>().isLoggedIn() &&
                        conversation != null &&
                        conversation.conversations != null &&
                        chatController
                            .conversationsModelStatic!.conversations!.isNotEmpty)
                    ? Dimensions.paddingSizeSmall
                    : 0),
            Expanded(
                child: Get.find<AuthController>().isLoggedIn()
                    ? (conversation != null &&
                            conversation.conversations != null)
                        ? conversation.conversations!.isNotEmpty
                            ? RefreshIndicator(
                                onRefresh: () async {
                                  await Get.find<ChatController>()
                                      .getConversationList(1);
                                },
                                child: SingleChildScrollView(
                                  controller: _scrollController,
                                  padding: EdgeInsets.zero,
                                  child: Container(
                                    child: SizedBox(
                                        width: Dimensions.webMaxWidth,
                                        child: PaginatedListView(
                                          scrollController: _scrollController,
                                          onPaginate: (int? offset) =>
                                              chatController
                                                  .getConversationList(offset!),
                                          totalSize: conversation.totalSize,
                                          offset: conversation.offset,
                                          enabledPagination: chatController
                                                  .searchConversationModel ==
                                              null,
                                          itemView: ConversationScreenChatListview(conversation: conversation,),
                                        )),
                                  ),
                                ),
                              )
                            : Center(child: Text('no_conversation_found'.tr))
                        : const Center(child: CircularProgressIndicator())
                    : Container()),
          ]),
        ),
      );
    });
  }
}
