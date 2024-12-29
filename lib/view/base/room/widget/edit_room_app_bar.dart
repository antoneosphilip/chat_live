import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../util/dimensions.dart';

class EditRoomAppBar extends StatelessWidget {
  const EditRoomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 16.w,
        ),
        const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
          size: 20,
        ),
        const Spacer(),
        Center(
            child: Text(
              'edit room',
              style: TextStyle(
                  fontSize: Dimensions.fontSizeExtraLarge,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            )),
        const Spacer(),
        SizedBox(
          width: 16.w,
        ),
      ],
    );
  }
}
