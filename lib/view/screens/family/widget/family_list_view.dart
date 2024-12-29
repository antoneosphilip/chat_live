import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/model/response/family_model.dart';
import 'family_member_item.dart';

class FamilyListView extends StatelessWidget {
  final FamilyResponse familyResponse;

  const FamilyListView({super.key, required this.familyResponse});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return  const FamilyMemberItem();
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 30.w,
            );
          },
          itemCount: 10),
    );
  }
}
