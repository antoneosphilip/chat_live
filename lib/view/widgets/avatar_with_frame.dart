import 'package:flutter/material.dart';

import '../../util/images.dart';

class AvatarWithFrame extends StatelessWidget {
  final double radius;
  final ImageProvider? frame;
  final ImageProvider? avatar;
  final Function()? onTab;
  const AvatarWithFrame(
      {super.key, this.radius = 50, this.frame, this.avatar, this.onTab});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: CircleAvatar(
        radius: radius,
        backgroundColor: Colors.transparent,
        foregroundImage: frame != null
            ? frame
            : AssetImage(
                'assets/images/top1.webp',
              ),
        child: Padding(
          padding: EdgeInsets.only(
              top: radius / 3,
              bottom: radius / 10,
              left: radius / 5,
              right: radius / 5),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image:
                      avatar != null ? avatar! : AssetImage(Images.guestIcon)),
              borderRadius: BorderRadius.circular(radius),
            ),
          ),
        ),
      ),
    );
  }
}
