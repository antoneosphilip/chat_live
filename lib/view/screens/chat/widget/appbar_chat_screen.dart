import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../util/styles.dart';

class CustomAppBarChatScreen extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Message',
            style: robotoBlack.copyWith(color: Colors.black),
          ),
          IconButton(
            icon: const FaIcon(
              FontAwesomeIcons.eraser,
              color: Colors.black,
              size: 18, // يمكنك استخدام 18.sp إذا كان لديك مكتبة للتحجيم
            ),
            onPressed: () {},
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(
            FontAwesomeIcons.search,
            color: Colors.black,
            size: 18, // يمكنك استخدام 18.sp إذا كان لديك مكتبة للتحجيم
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: const FaIcon(
            FontAwesomeIcons.bell,
            color: Colors.black,
            size: 18, // يمكنك استخدام 18.sp إذا كان لديك مكتبة للتحجيم
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.add, color: Colors.black),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
