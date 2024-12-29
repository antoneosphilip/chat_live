import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:live_app/util/styles.dart';

import '../../../../util/colors.dart';

class CustomEditRoomTextFormField extends StatelessWidget {
  final bool isMaxLine;
  const CustomEditRoomTextFormField({super.key,  this.isMaxLine=false});

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      maxLines:!isMaxLine?5: null,
      minLines:!isMaxLine?1:3,
      initialValue: "أحلى أخوات", // Arabic text as initial value
      decoration: InputDecoration(
        hintText: "Room Name",
        hintStyle: robotoWhite,
        fillColor: ColorManger.colorPurpleTextForm, // Purple background similar to image
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
      style: const TextStyle(color: Colors.white, fontSize: 18), // White text color
    );
  }
}
