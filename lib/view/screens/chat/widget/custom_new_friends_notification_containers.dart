import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../util/colors.dart';
import 'chat_new_friend_item.dart';

class CustomNewFriendsNotificationContainers extends StatelessWidget {
  const CustomNewFriendsNotificationContainers({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        SizedBox(
          width: 20.w,
        ),
        const Expanded(
            child: ChatNewFriendItem(
              color: ColorManger.lightPink,
              text: 'New Friends', colorText: ColorManger.pink,
            )),
        SizedBox(
          width: 20.w,
        ),
        const Expanded(
            child: ChatNewFriendItem(
              color: ColorManger.lightGold,
              text: 'chat team', colorText: ColorManger.gold,
            )),
        SizedBox(
          width: 20.w,
        ),
        const Expanded(
            child: ChatNewFriendItem(
              color: ColorManger.lightGreen,
              text: 'Event', colorText: ColorManger.green,
            )),
        SizedBox(
          width: 20.w,
        ),
        const Expanded(
            child: ChatNewFriendItem(
              color: ColorManger.lightBlue,
              text: 'Notice', colorText: ColorManger.blue,
            )),
        SizedBox(
          width: 20.w,
        ),
      ],
    );
  }
}
