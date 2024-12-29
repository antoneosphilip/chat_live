import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../util/colors.dart';
import '../../../../util/styles.dart';
import '../../../widgets/delete_show_dialog.dart';

class ClearMessage extends StatelessWidget {
  final String text;
  const ClearMessage({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        showDialog(context: context, builder: (context){
          return const DeleteShowDialog();
        });
      },
      child: Container(
        width: double.infinity,
        height: 50.h,
        color: ColorManger.whiteColor,
        child: Padding(
          padding:  EdgeInsets.only(left: 16.w),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                text,
                style: robotoBlack2.copyWith(color: Colors.lightBlueAccent),
              )),
        ),
      ),
    );
  }
}
