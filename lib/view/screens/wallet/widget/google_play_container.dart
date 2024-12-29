import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:live_app/data/model/body/recharge_model.dart';
import 'package:live_app/data/model/response/user_model.dart';

import '../../../../util/styles.dart';
import 'custom_line.dart';

class GooglePlayContainer extends StatelessWidget {
  final RechargeModel rechargeModel;
  const GooglePlayContainer( {super.key, required this.rechargeModel,});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(left: 16.w),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 10.h,
          ),
          Text(
            "Google Play",
            style: robotoBlack2.copyWith(
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 15.h,
          ),
          const CustomLine(),
          SizedBox(
            height: 25.h,
          ),
          Row(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 50.w,
                height: 50.h,
                child: const Image(
                    image: AssetImage(
                        'assets/images/icon.png')),
              ),
              SizedBox(
                width: 5.w,
              ),
              Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                mainAxisAlignment:
                MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment:
                    CrossAxisAlignment.center,
                    children: [
                      Text(
                        "\$${rechargeModel.usd}=${rechargeModel.diamond}",
                        style: robotoBlack.copyWith(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 140.w,
                      ),
                      Text(
                        "EGP 54.99",
                        style: robotoBlack.copyWith(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "antoneosphilip3@gmail.com",
                    style: robotoGreySmall,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          const CustomLine(),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 30.w,
                height: 30.h,
                child: const Image(
                    image: AssetImage(
                        'assets/images/gift_google_play.webp')),
              ),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  mainAxisAlignment:
                  MainAxisAlignment.start,
                  children: [
                    Text(
                      "Play discount 0.50",
                      style: robotoBlack3,
                    ),
                    const Text(
                        "on an app, game, or in-app item over now or expires 7 days after the offer is applied.see terms")
                  ],
                ),
              ),
              Text(
                "Apply",
                style: robotoWhite.copyWith(
                    color: Colors.blue,
                    fontSize: 15.sp),
              ),
              SizedBox(
                width: 20.w,
              )
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          const CustomLine(),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Container(
                width: 30.w,
                height: 30.h,
                decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(16.r),
                    color: Colors.white),
                child: const Image(
                    image: NetworkImage(
                        'https://purepng.com/public/uploads/large/purepng.com-visa-logologobrand-logoiconslogos-251519938794uqvcz.png')),
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                'Visa_9905',
                style: robotoBlack2,
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 15,
              ),
              SizedBox(
                width: 16.w,
              )
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          const CustomLine(),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Text(
                "Click Buy to complete the purchase.",
                style: robotoGreySmall.copyWith(
                    color: Colors.black
                        .withOpacity(.5)),
              ),
              Text(
                "More",
                style: robotoWhite.copyWith(
                    color: Colors.blue),
              ),
            ],
          ),
          SizedBox(
            height: 25.h,
          ),

        ],
      ),
    );
  }
}
