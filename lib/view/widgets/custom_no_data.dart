import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../util/styles.dart';

class CustomNoData extends StatelessWidget {
  final String text;
  const CustomNoData({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 140.0.h),
      child: Column(
        children: [
          Text(text,style: robotoBold,),
          Center(
            child: Lottie.asset('assets/animation/no_data.json',width: 150.w,height: 150.h),
          ),
        ],
      ),
    );
  }
}
