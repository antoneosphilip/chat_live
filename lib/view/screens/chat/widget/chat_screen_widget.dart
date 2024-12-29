import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:live_app/util/colors.dart';
import 'package:live_app/view/screens/chat/chat_screen.dart';
import 'package:live_app/view/screens/chat/conversation_screen.dart';
import 'package:live_app/view/screens/chat/widget/tab_bar_chat_screen.dart';

import '../../../../data/model/body/notification_body.dart';
import '../../../../data/model/response/conversation_model.dart';
import '../../../../util/styles.dart';
import 'appbar_chat_screen.dart';
import 'chat_new_friend_item.dart';
import 'custom_new_friends_notification_containers.dart';

class ChatScreenWidget extends StatelessWidget {
  const ChatScreenWidget({super.key});



  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar:CustomAppBarChatScreen(),
          body: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              const CustomNewFriendsNotificationContainers(),
              SizedBox(
                height: 10.h,
              ),
              const TabBarChatScreen(),
              Expanded(
                child: TabBarView(
                  children: [
                    ConversationScreen(),
                    Center(
                      child: Text('Content for Group Chat'),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
