import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:live_app/controller/room_controller.dart';
import 'package:live_app/view/base/room/widget/room_shape_item.dart';

class RoomTypeListView extends StatefulWidget {
  int i = 0;
  final RoomController roomController;

  RoomTypeListView({super.key, required this.roomController});

  @override
  State<RoomTypeListView> createState() => _RoomTypeListViewState();
}

class _RoomTypeListViewState extends State<RoomTypeListView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  widget.i = index;
                  widget.roomController.typeId= widget.roomController.roomTypeList[index].id!;
                  setState(() {});
                },
                child: RoomShapeItem(
                  text: widget.roomController.roomTypeList[index].name!,
                  isSelected: widget.i == index,
                  image: widget.roomController.roomTypeList[index].image!,
                ));
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 15.w,
            );
          },
          itemCount: widget.roomController.roomTypeList.length),
    );
  }
}
