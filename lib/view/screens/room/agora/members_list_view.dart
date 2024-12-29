import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:live_app/data/model/response/room_model.dart';
import 'package:live_app/view/screens/room/agora/room_member_item.dart';

import '../../../../data/model/response/user_model.dart';

class MembersListView extends StatelessWidget {
  final int myId;
  final RoomModel roomModel;
  final List<UserModel> list;
  const MembersListView({super.key, required this.list, required this.myId, required this.roomModel});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return RoomMemberItem(user: list[index], myId: myId, roomModel: roomModel,);
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 20.h,
          );
        },
        itemCount: list.length);
  }
}
