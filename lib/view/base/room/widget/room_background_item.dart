import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:live_app/data/model/response/get_back_ground_model.dart';
import 'package:live_app/util/colors.dart';

import '../../../../util/styles.dart';

class RoomBackGroundItem extends StatelessWidget {
  final BackGroundItems backGroundList;
  final bool isSelected;
  const RoomBackGroundItem({
    super.key,required this.backGroundList, required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: 100.w,
            height: 200.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: backGroundList.thumbnail!,
              placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(
                    color: ColorManger.primary,
                  )),
              errorWidget: (context, url, error) =>  const Image(
                image: CachedNetworkImageProvider(
                    'https://www.bing.com/th?id=OIP.roQHQEuNf8SdJJ7wS3RxtgHaHa&w=150&h=150&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2',
              ),
                fit: BoxFit.cover,
              ),
            )),
        SizedBox(height: 20.h,),
        Container(
            decoration: BoxDecoration(
                gradient: isSelected?ColorManger.purpleToWhiteGradient:const LinearGradient(colors: [Colors.white,Colors.white]),
                border: Border.all(color:isSelected?ColorManger.colorPurpleMix:Colors.black),
                borderRadius: BorderRadius.circular(8.r)),
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
              child: Center(
                child: Text(
                  backGroundList.price!,
                  style: robotoBlack2.copyWith(
                      color: isSelected?Colors.white:Colors.grey,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w500),
                ),
              ),
            )),
      ],
    );
  }
}
