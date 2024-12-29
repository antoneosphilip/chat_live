import 'package:flutter/material.dart';

import '../base/room/layers/gift_show_layer.dart';

class AppMask extends StatelessWidget {
  const AppMask({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Positioned(
          top: 50,
          child: BigHornLayer(),
        ),
        Positioned(
          top: 50,
          child: AllRoomLayer(),
        ),
        Positioned(
          top: 50,
          child: AllSeatsLayer(),
        ),
      ],
    );
  }
}
