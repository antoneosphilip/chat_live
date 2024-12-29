import 'package:country_list_picker/models/countries.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_app/controller/user_controller.dart';
import 'package:live_app/data/model/response/update_profile_model.dart';

import '../../../../data/model/response/country_model.dart';
import '../../../../util/app_constants.dart';
import '../../../../util/styles.dart';
import '../../../base/custom_image.dart';
import '../../wallet/widget/custom_line.dart';

class CountryItem extends StatelessWidget {
  final CountryModel country;
  const CountryItem({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.find<UserController>().updateUserInfo(UpdateProfileModel(
          countryId: country.id.toString()
        ));
      },
      child: Column(
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                Text(country.name??"",style: robotoBlack.copyWith(fontWeight: FontWeight.w300),),
                const Spacer(),
                CustomImage(
                  height: 20,
                  width: 30,
                  image: AppConstants
                      .getMedia(
                    'country',
                    "${country.flag}",
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12.h,),
          CustomLine(color: Colors.grey[200],),
        ],
      ),
    );
  }
}
