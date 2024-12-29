import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_app/data/model/response/get_all_families.dart';
import 'package:live_app/view/screens/family/user_family_screen.dart';
import 'package:live_app/view/screens/family/widget/custom_netwok_image.dart';

import '../../../../controller/family_controller.dart';
import '../../../../util/styles.dart';

class GetAllFamiliesItem extends StatelessWidget {
  final FamiliesData familiesData;
  const GetAllFamiliesItem({super.key, required this.familiesData});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()
      {
        Get.to(UserFamilyScreen(id: familiesData.id!,));
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: const AssetImage(
                'assets/images/all_families_number2.webp'),
            height: 50.h,
            width: 50.w,
          ),
          CustomNetworkImage(image:familiesData.image,
          width: 50.w,
            height: 50.h,
            ),
          SizedBox(
            width: 10.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                familiesData.name!,
                style: robotoBlack,
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                height: 30.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(48.r),
                    color: Colors.blue),
                child: Row(
                  children: [
                    SizedBox(
                      width: 3.w,
                    ),
                    ClipOval(
                        child: Image(
                          image: const NetworkImage(
                              'https://th.bing.com/th/id/OIP.hLTThhxHPeGqFQVjpD1-hwHaE8?rs=1&pid=ImgDetMain'),
                          height: 25.h,
                          width: 25.w,
                          fit: BoxFit.cover,
                        )),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      "Real famil",
                      style: robotoWhite,
                    ),
                    SizedBox(
                      width: 10.w,
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(width: 25.w,),
          Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/fire.webp',
                    height: 20.h,
                    width: 20.w,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    "6,417,977",
                    style:
                    robotoMedium.copyWith(color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(height: 3.h,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(width: 20.w,),
                  Center(
                      child: Image.asset(
                        'assets/images/group_memer.webp',
                        height: 20.h,
                        width: 20.w,
                      )),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    "326",
                    style:
                    robotoMedium.copyWith(color: Colors.grey),
                  ),
                ],
              )
      
            ],
          ),
          SizedBox(height: 5.h,),
      
        ],
      ),
    );
  }
}
