import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:live_app/view/widgets/app_bar.dart';

import '../../../util/colors.dart';

class BlackList extends StatelessWidget {
  const BlackList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorManger.whiteColor,
      appBar: AppBarCustom(name: "Blacklist"),
    );
  }
}
