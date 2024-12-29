import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_app/util/dimensions.dart';
import 'package:live_app/util/styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool backButton;
  final Function? onBackPressed;
  final bool showCart;
  final Function(String value)? onVegFilterTap;
  final String? type;
  final String? leadingIcon;
  final Color? backgroundColor;
  final List<Widget>? actions;
  final Color? color;
  final double? font;
  final FontWeight? fontWeight;
  final double ?iconSize;
  const CustomAppBar(
      {Key? key,
      required this.title,
      this.backButton = true,
      this.onBackPressed,
      this.showCart = false,
      this.leadingIcon,
      this.onVegFilterTap,
      this.type,
      this.backgroundColor,
      this.color,  this.font, this.fontWeight,  this.iconSize,  this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title,
          style: robotoRegular.copyWith(
              fontSize: font??Dimensions.fontSizeLarge,
              color: color ?? Colors.black,fontWeight:fontWeight)),
      centerTitle: true,
      leading: backButton
          ? IconButton(
              icon: leadingIcon != null
                  ? Image.asset(leadingIcon!, height: 22, width: 22)
                  :  Icon(Icons.arrow_back_ios,size:iconSize,),
              color: color ?? Colors.black,
              onPressed: () => onBackPressed != null
                  ? onBackPressed!()
                  : Navigator.pop(context),
            )
          : const SizedBox(),
      actions: actions,
      backgroundColor: backgroundColor ?? Theme.of(context).cardColor,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size(Get.width, GetPlatform.isDesktop ? 200 : 60);
}
