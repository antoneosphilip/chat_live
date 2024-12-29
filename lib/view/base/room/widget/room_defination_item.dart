import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../util/styles.dart';


class RoomDefinationItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color colorIcon;
  const RoomDefinationItem({super.key, required this.text, required this.icon, required this.colorIcon});

  @override
  Widget build(BuildContext context) {
    return   Row(
      children: [
         Icon(
          icon,
          color: colorIcon,
        ),
        Text(
          text,
          style: robotoWhiteMedium,
        ),
      ],
    );
  }
}
