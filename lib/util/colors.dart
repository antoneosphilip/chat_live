import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

abstract class ColorManger
{
  static const Color primary=Colors.deepPurpleAccent;
  static const Color whiteColor=Color(0xffffffff);
  static const Color orangeColor=Colors.orange;
  static const Color grey=Colors.grey;
  static const Color deepGold=  Color(0xFF996633);
  static const Color deepGrey=  Color(0xFFA9A9A9);
  static const Color deepGrey2=  Color(0xFF1C1C1C);
  static const Color colorPurpleTextForm=  Color(0xFF7A4DA1);

  static const Color colorPurple= Color(0xFF6A1B9A) ;
  static const Color colorPurpleMix= Color(0xff4000bf);
  static const Color lightPink=Color(0xFFFFB3B8);
  static const Color pink=Color(0xFFFF8C94);

  static const Color gold=Color(0xFFFFDA6B);
  static const Color lightGold=Color(0xFFFFE3B8);

  static const Color green=Color(0xFF6BCB77);
  static const Color lightGreen=Color(0xFFA7D6B7);

  static const Color blue=Color(0xFF6F8BFF);
  static const Color lightBlue=Color(0xFFA7C6FF);



      static LinearGradient get goldToWhiteGradient => const LinearGradient(
    colors: [deepGold, whiteColor],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static LinearGradient get purpleToWhiteGradient => const LinearGradient(
    colors: [Colors.blue, Colors.purple],
    begin: Alignment.bottomRight,
    end: Alignment.topLeft,
  );
}