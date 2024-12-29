import 'package:flutter/material.dart';
import 'package:live_app/view/widgets/select_menu_bottom_Sheet.dart';
import 'package:zego_uikit_prebuilt_live_audio_room/zego_uikit_prebuilt_live_audio_room.dart';

void showBottomSheetWithSelectMenu(BuildContext context,String userId) {

  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return SelectMenuBottomSheet(userId: userId,);
    },
  );
}
