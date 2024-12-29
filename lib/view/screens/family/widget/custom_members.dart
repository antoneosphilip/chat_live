import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../util/colors.dart';
import '../../../../util/styles.dart';

class CustomMembers extends StatelessWidget {
  final String number;
  final String type;
  const CustomMembers({super.key, required this.number, required this.type});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(number,style: robotoWhiteVeryBold.copyWith(color: ColorManger.whiteColor),),
        const SizedBox(height: 3,),
        Text(type,style: robotoWhite.copyWith(color: Colors.white70),)
      ],
    );
  }
}
