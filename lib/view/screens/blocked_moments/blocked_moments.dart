import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:live_app/util/colors.dart';
import 'package:live_app/view/widgets/app_bar.dart';

class BlockedMoments extends StatelessWidget {
  const BlockedMoments({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorManger.whiteColor,
      appBar: AppBarCustom(name: "Blocked Moments"),
    );
  }
}
