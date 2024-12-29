import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../util/colors.dart';
import '../../../../util/styles.dart';

class CustomRulesItem extends StatelessWidget {
  final String text1;
  final String text2;
  const CustomRulesItem({super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Image(image: const AssetImage('assets/icon/invite.webp'),fit:BoxFit.cover,height: 50.h,width: 70.w,color:ColorManger.deepGrey,),
        Text(text1,style: robotoGreySmall.copyWith(color: ColorManger.deepGrey,fontWeight: FontWeight.w500)),
        Center(child: Text(text2,style: robotoGreySmall.copyWith(color: ColorManger.deepGrey,fontWeight: FontWeight.w500)))

      ],
    );
  }
}
