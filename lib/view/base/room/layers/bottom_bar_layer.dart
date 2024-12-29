import 'package:flutter/material.dart';

class BottomBarLayer extends StatelessWidget {
  const BottomBarLayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 15,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            // GiftBox()
          ],
        ),
      ),
    );
  }
}
