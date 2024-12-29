import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoomIcon extends StatelessWidget {
  final IconData iconData;
  final Color backGroundColor;
  final Color iconColor;
  const RoomIcon({super.key, required this.iconData,  this.backGroundColor=Colors.grey,this.iconColor=Colors.grey});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Container(
            width: 35,
            height: 35,
           decoration:   iconColor==Colors.white? BoxDecoration(
                shape: BoxShape.circle,
                color: backGroundColor
            ):BoxDecoration(),
            child: Icon(iconData,color:iconColor,)),
      ),
    );
  }
}
