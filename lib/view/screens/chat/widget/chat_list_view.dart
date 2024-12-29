import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../controller/chat_controller.dart';
import '../../../../data/model/body/notification_body.dart';
import '../../../base/paginated_list_view.dart';
import 'message_bubble.dart';

class ChatListView extends StatelessWidget {
  final NotificationBody notificationBody;
  final ScrollController _scrollController = ScrollController();

   ChatListView({super.key, required this.notificationBody});

  @override
  Widget build(BuildContext context) {
    return     GetBuilder<ChatController>(builder: (chatController) {
      return Expanded(
          child: chatController.chatModelStatic != null
              ? chatController
              .chatModelStatic!.messages!.isNotEmpty
              ? SingleChildScrollView(
            controller: _scrollController,
            reverse: true,
            child: PaginatedListView(
              scrollController:
              _scrollController,
              reverse: true,
              totalSize:
              chatController.chatModelStatic !=
                  null
                  ? chatController
                  .chatModelStatic!
                  .totalSize
                  : null,
              offset:
              chatController.chatModelStatic !=
                  null
                  ? chatController
                  .chatModelStatic!.offset
                  : null,
              onPaginate: (int? offset) async =>
              // await chatController
              //     .getMessages(
              //   offset!,
              //   notificationBody,
              //   user,
              //   conversationID,
              // ),
              //
              await(){},
              itemView: ListView.builder(
                physics:
                const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                reverse: true,
                itemCount: chatController
                    .chatModelStatic!
                    .messages!
                    .length,
                itemBuilder: (context, index) {
                  return MessageBubble(
                    message: chatController
                        .chatModelStatic!
                        .messages![index],
                    user:
                    // true ?
                        chatController
                            .chatModelStatic!
                            .conversation!
                            .receiver,
                    userType: notificationBody !=
                        null
                        ? "${notificationBody?.receiverType}"
                        : "${notificationBody!.receiverType}",
                  );
                },
              ),
            ),
          )
              : Center(
              child: Text('no_message_found'.tr))
              : const Center(
              child: CircularProgressIndicator()));
    });
  }
}
