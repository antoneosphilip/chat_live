import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:live_app/view/base/room/widget/type_room_item.dart';

class TypeRoomListView extends StatelessWidget {
  const TypeRoomListView({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 100.h,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return const TypeRoomItem();
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 20.w,
            );
          },
          itemCount: 4),
    );
  }
}
