import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'invite_container.dart';
import 'invite_item.dart';

class ListInviteItem extends StatelessWidget {
  const ListInviteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return const InviteItem();

      }, separatorBuilder: (context, index) {
            return SizedBox(height: 5.h,);

      }, itemCount: 10),
    );
  }
}
