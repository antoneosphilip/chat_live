import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:live_app/data/model/response/family_model.dart';

import '../../../../helper/responsive_helper.dart';
import 'custom_members.dart';

class FamilyInformationContainer extends StatelessWidget {
  final FamilyResponse familyResponse;
  const FamilyInformationContainer({super.key, required this.familyResponse});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.only(bottom: 5.h),
      child: Container(
        padding:  EdgeInsets.symmetric(horizontal: 12.w),
        height: ResponsiveHelper.ofHeight(context, 0.19),
        decoration:  BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.h),
            topRight: Radius.circular(20.h),
          ),
          image: const DecorationImage(
            image:
            AssetImage('assets/images/family_bg_1.png'),
            fit: BoxFit.fill,
            matchTextDirection: true,
          ),
        ),
        child: Column(
          children: [
            Container(
              // height: 75,
              height: 100.h,
            ),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/family_bg_2.webp'),
                        fit: BoxFit.fill,
                        matchTextDirection: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: Row(
                      crossAxisAlignment:
                      CrossAxisAlignment.center,
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 50.w,
                        ),
                         CustomMembers(
                          number: familyResponse.data!.membersCount.toString(),
                          type: 'members',
                        ),
                        SizedBox(
                          width: 30.w,
                        ),
                        const CustomMembers(
                          number: '50M',
                          type: 'prpularity',
                        ),
                        SizedBox(
                          width: 30.w,
                        ),
                        const CustomMembers(
                          number: '25',
                          type: 'Ranking',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
