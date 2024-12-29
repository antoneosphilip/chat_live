import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../util/styles.dart';
import '../../../widgets/custom_clooval_image.dart';

class InviteItem extends StatelessWidget {
  const InviteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: 320.w,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: Colors.deepPurple,
        ),
        child: Row(
          children: [
            SizedBox(width: 20.w,),
            Text('4',style: robotoWhite,),
            SizedBox(width: 25.w,),
            const CustomClipOvalImage(image: '',padding: 0,width: 40,),
            SizedBox(width: 10.w,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("antoneos",style: robotoWhite,),
                SizedBox(height: 5.h,),
                Text("ID:11311",style: robotoWhite,),

              ],
            ),
            const Spacer(),
            Row(
              children: [
                Image.asset('assets/images/juail.png',width: 30,),
                SizedBox(width: 2.w,),
                Text("*******",style: robotoWhite,)
              ],
            ),
            SizedBox(width: 30.w,)
          ],
        ),
      ),
    );
  }
}
