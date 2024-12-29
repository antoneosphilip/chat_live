import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:live_app/controller/user_controller.dart';

import '../../../../data/model/response/my_profile_model.dart';
import '../../../../helper/route_helper.dart';
import '../../countries/country_list.dart';
import '../phone_screen.dart';


IconData getIconForText(String text) {
  switch (text) {
    case 'Nickname':
      return Icons.person;
    case 'Gender':
      return Icons.male;
    case 'Location':
      return Icons.location_city;
    case 'Level':
      return Icons.format_align_justify;
    case 'Signature':
      return Icons.edit;
    default:
      return Icons.help_outline; // أيقونة افتراضية في حال عدم تطابق النص
  }
}

Color getColorForText(String text) {
  switch (text) {
    case 'Nickname':
      return Colors.pink;
    case 'Gender':
      return Colors.blue;
    case 'Location':
      return Colors.green;
    case 'Level':
      return Colors.orange;
    case 'Signature':
      return Colors.red;
    default:
      return Colors.grey; // لون افتراضي في حال عدم تطابق النص
  }
}
