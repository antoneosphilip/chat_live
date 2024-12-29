import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:live_app/view/base/room/widget/room_shape_item.dart';

class RoomShapeListView extends StatefulWidget {
  int i = 0;
  RoomShapeListView({super.key});

  @override
  State<RoomShapeListView> createState() => _RoomShapeListViewState();
}

class _RoomShapeListViewState extends State<RoomShapeListView> {
  @override
  Widget build(BuildContext context) {
    List<String> roomShapeList = [
      'classic',
      'party',
      'video',
    ];
    return SizedBox(
      height: 40.h,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  widget.i = index;
                  setState(() {
                  });
                },
                child: RoomShapeItem(
                  text: roomShapeList[index],
                  isSelected: widget.i == index, image: '',
                ));
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 15.w,
            );
          },
          itemCount: roomShapeList.length),
    );
  }
}
