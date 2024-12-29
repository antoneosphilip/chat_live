import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:live_app/util/colors.dart';

import '../../../../util/styles.dart';
import '../../../widgets/custom_clooval_image.dart';

class InvitationCodeContainer extends StatelessWidget {
  const InvitationCodeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 200.h,
          width:350.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.r),
            color: Colors.deepPurple,
            border: Border.all(
              color:Colors.amber,
              width: 5,
            )
          ),


        ),
        Padding(
          padding:  EdgeInsets.only(bottom: 200.h),
          child: Stack(
            children: [
              const CustomClipOvalImage(image: '',),
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/family_name.webp',
                  fit: BoxFit.cover,
                  height: 100.h,
                  width: 100.w,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: Container(
            color: Colors.orangeAccent,
            width: 60,
            height: 20,
            child: Center(child: Text('tony3',style: robotoWhite.copyWith(color:Colors.yellow),)),
          ),
        ),
        SizedBox(height: 10.h,),
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Text('My invitation code',style: robotoWhiteDefaultBold,),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Text('20140601',style: robotoWhiteDefaultBold,),
        ),
        Padding(
          padding:  EdgeInsets.only(top: 110.h),
          child: Container(
            width: 65,
            height: 25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: Colors.white,
              ),
            ),
            child: Center(child: Text('copy',style: robotoWhite.copyWith(color: Colors.yellow.shade100),)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 170),
          child: Text('the number of people i invited:0',style: robotoWhiteDefaultBold,),
        )

      ],
    );
  }
}
