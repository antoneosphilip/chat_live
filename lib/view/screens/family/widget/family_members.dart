import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_app/data/model/response/family_model.dart';

import '../../../widgets/section_container.dart';
import 'family_list_view.dart';

class FamilyMembers extends StatelessWidget {
  final FamilyResponse familyResponse;
  const FamilyMembers({super.key, required this.familyResponse});

  @override
  Widget build(BuildContext context) {
    return  SectionContainer(
      containerColor: Colors.white,
      title: 'Family Members'.tr,
      centerTitle:  Text(
        '${familyResponse.data?.membersCount}/${familyResponse.data?.owner?.friendsCount}',
        style: TextStyle(
            fontSize: 18.sp,
            color: Colors.blueAccent,
            fontWeight: FontWeight.bold),
      ),
      color: Colors.transparent,
      padding:  EdgeInsets.only(top: 15.h),
      body: FamilyListView(familyResponse: familyResponse,),
    );
  }
}
