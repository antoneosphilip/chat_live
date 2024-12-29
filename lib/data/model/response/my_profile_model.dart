import 'package:flutter/cupertino.dart';

class MyProfileModel
{
  final IconData icon;
  final String text;
  final String text2;
  final bool isIcon;
  final Function() onPressed;
  final Color colorIcon;

  MyProfileModel( {required this.colorIcon,required this.icon, required this.text, required this.text2, required this.isIcon,required this.onPressed,});
}