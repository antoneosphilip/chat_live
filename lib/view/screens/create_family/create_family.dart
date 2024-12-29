import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_app/util/styles.dart';
import 'package:live_app/view/screens/create_family/widget/create_family_appbar.dart';

import 'clan_screen.dart';
import 'family_tabbar_screen.dart';

class CreateFamily extends StatelessWidget {
  final String image;
  final bool hasFamily;
  final String gold;
  final int id;

  const CreateFamily( {super.key, required this.image, required this.hasFamily, required this.gold, required this.id});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5, // Number of tabs
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize:  Size.fromHeight(250.0.h), // Adjust height for TabBar + Image
          child: CreateFamilyAppbar(image: image,),
        ),
        body:  TabBarView(
          children: [
            FamilyTabBarScreen(image:image, hasFamily: hasFamily, gold: gold, id: id,),
            const ClanScreen(),
            const ClanScreen(),
            const ClanScreen(),
            const ClanScreen(),
          ],
        ),
      ),
    );
  }
}

