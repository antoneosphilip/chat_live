import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:live_app/data/model/response/family_model.dart';
import 'package:live_app/view/screens/family/widget/person_photo.dart';

import '../../../../util/dimensions.dart';
import '../../../../util/styles.dart';
import 'custom_netwok_image.dart';
import 'custom_vip_container.dart';

class UserInformation extends StatelessWidget {
  final Owner? owner;
  const UserInformation( {super.key, required this.owner});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:  EdgeInsets.only(top: 15.h),
              child: Text(
                owner!.name.toString(),
                style: robotoWhiteVeryBold.copyWith(
                    color: Colors.purpleAccent,
                    fontSize: Dimensions.fontSizeExtraLarge),
              ),
            ),
            SizedBox(height: 10.h,),
            Column(
              children: [
                Row(
                  children: [
                    CustomVipContainer(senderLevel: owner?.senderLevel,),
                    SizedBox(width: 10.w,),
                    CustomVipContainer(senderLevel: owner!.consigneeLevel,),
                  ],
                ),
                SizedBox(height: 10.h,),
                Padding(
                  padding: const EdgeInsets.only(top: 0,bottom: 30),
                  child: Container(
                    height: 20.h,
                    decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent.shade100,
                      borderRadius: BorderRadius.circular(40.r)
                    ),
                    child: Padding(
                      padding:  EdgeInsets.only(right: 10.w,left: 10.w),
                      child: Row(
                        children: [
                          Icon(Icons.headset_mic_rounded,size: 13.sp,),
                          SizedBox(width: 2.w,),
                          Text(owner!.pio.toString()??''),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
              ],
            ),



      ],
    );
  }
}
