import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:live_app/data/model/response/get_back_ground_model.dart';
import 'package:live_app/view/base/room/widget/room_background_item.dart';
import 'package:live_app/view/base/room/widget/room_shape_item.dart';

class RoomBackGroundListView extends StatefulWidget {
  final List<BackGroundItems> backGroundList;
  int i = 0;

  RoomBackGroundListView( {super.key, required this.backGroundList});

  @override
  State<RoomBackGroundListView> createState() => _RoomBackGroundListViewState();

}

class _RoomBackGroundListViewState extends State<RoomBackGroundListView> {
  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 300.h,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  widget.i = index;
                  setState(() {
                  });
                },
                child: RoomBackGroundItem(
               backGroundList:  widget.backGroundList[index],
                  isSelected:  widget.i == index,
                ));
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 15.w,
            );
          },
          itemCount: widget.backGroundList.length),
    );
  }
}
