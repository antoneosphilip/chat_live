import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_app/data/model/response/family_model.dart';

import '../../../../util/styles.dart';
import '../../../widgets/section_container.dart';

class FamilyStars extends StatelessWidget {
  final FamilyResponse familyResponse;
  const FamilyStars({super.key, required this.familyResponse });

  @override
  Widget build(BuildContext context) {
    List<String> image=[
      'assets/images/family_name.webp',
      'assets/images/family_name_1.webp',
      'assets/images/family_name_3.webp'
    ];
    return SectionContainer(
      containerColor: Colors.white,
      title: 'Family Stars'.tr,
      color: Colors.transparent,
      padding: EdgeInsets.only(top: 15.h),
      body: SizedBox(
        height: 150.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
            itemBuilder: (context,index){
          return    Column(
            children: [
              Image.asset(
                image[index],
                height: index==1?100:120,
                width: 100.w,
              ),
              Text('VIP UAE',style: robotoBold.copyWith(color: CupertinoColors.systemGreen),)
            ],
          );
        }, separatorBuilder: (context,index){
          return SizedBox(width: 10.w,);
        }, itemCount: 3),
      )
    );
  }
}
