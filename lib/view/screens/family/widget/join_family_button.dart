import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../helper/responsive_helper.dart';

class JoinFamilyButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  final double? width;
  final Color? colorText;
  const JoinFamilyButton({super.key, required this.text, required this.onTap,  this.width, this.colorText});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: ResponsiveHelper.ofHeight(context, 0.05),
        child: SizedBox(
          width: ResponsiveHelper.ofWidth(context, 1),
          child: Center(
            child: InkWell(
              onTap:onTap,
              child: Container(
                height: 50,
                width: width?.w??ResponsiveHelper.ofWidth(context, 0.6),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/family_btn_bg.webp',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Center(
                  child: Text(
                    text,
                    style:  TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: colorText??Colors.white60),
                  ),
                ),
              ),
            ),
          ),
        ));

  }
}
