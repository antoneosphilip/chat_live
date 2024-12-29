import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:live_app/data/model/body/app_mode.dart';

import 'app_mode_item.dart';

class AppModeListview extends StatefulWidget {
  AppModeListview({super.key});

  int i = 0;

  @override
  State<AppModeListview> createState() => _AppModeListviewState();
}

class _AppModeListviewState extends State<AppModeListview> {
  @override
  Widget build(BuildContext context) {
    List<AppMode> list = [
      AppMode(
          title: 'Smart Mode',
          description:
              'In Smart Mode,the operating mode will automatically switch based on the status of your device'),
      AppMode(
          title: 'High-Quality Mode',
          description:
              'in High-Quality Mode, all prop effects will be  displayed'),
      AppMode(
          title: 'Data-Saving Mode',
          description:
              'in Data-Saving Mode, the effects of all props will not be displayed'),
    ];
    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              widget.i = index;
              setState(() {});
            },
            child: AppModeItem(
              title: list[index].title,
              description: list[index].description,
              isCheck: widget.i == index,
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 20.h,
          );
        },
        itemCount: list.length);
  }
}
