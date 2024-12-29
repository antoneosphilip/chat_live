import 'package:flutter/material.dart';
import 'package:live_app/view/widgets/tap_item.dart';

class HomeTab extends StatelessWidget {
  final List<Map<String, dynamic>> taps;
  final Color? color;
  const HomeTab({super.key, required this.taps, this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...taps.map(
          (e) => TapItem(
              text: e['name'],
              onTap: e['onTap'],
              color: e['isActive'] != false
                  ? (color ?? Colors.teal.withOpacity(0.6))
                  : Colors.grey),
        ),
      ],
    );
  }
}
