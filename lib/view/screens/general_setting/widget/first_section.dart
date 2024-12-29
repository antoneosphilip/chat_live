import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:live_app/view/screens/general_setting/widget/show_all_item.dart';

import '../../../../util/colors.dart';

class FirstSection extends StatelessWidget {
  const FirstSection({super.key});

  @override
  Widget build(BuildContext context) {
    bool isSwitch1=false;
    return Container(
      color: ColorManger.whiteColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child:  Column(
          children: [
            ShowAllItem(text1: 'Show all gifts announcement line', text2: 'After closing, all gifts lines announcements will not be displayed', isSwitch: isSwitch1,),
            ShowAllItem(text1: 'Show all game Announcement line', text2: 'After closing, all games lines announcements will not be displayed', isSwitch: isSwitch1,),
          ],
        ),

      ),
    );
  }
}
