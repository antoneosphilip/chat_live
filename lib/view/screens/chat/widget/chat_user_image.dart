import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../controller/chat_controller.dart';
import '../../../../data/model/response/conversation_model.dart';
import '../../../../util/app_constants.dart';
import '../../../../util/images.dart';
import '../../../base/custom_image.dart';

class ChatUserImage extends StatelessWidget {
  final ChatController chatController;

  const ChatUserImage({super.key, required this.chatController});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 40,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
              width: 2, color: Theme.of(context).cardColor),
          color: Theme.of(context).cardColor,
        ),
        child: ClipOval(
            child: CustomImage(
              placeholder: Images.defaultUserImg,
              image: chatController
                  .chatModelStatic?.conversation?.receiverType !=
                  AppConstants.admin
                  // baseUrl
                  ? true?  "${chatController.chatModelStatic?.conversation?.receiver?.image}":"":"",
                  // user != null ? "${user?.image

              fit: BoxFit.cover,
              height: 40,
              width: 40,
            )),
      ),
    );
  }
}
