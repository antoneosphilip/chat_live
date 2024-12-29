import 'package:flutter/material.dart';

class NotificationSign extends StatelessWidget {
  final bool isActive;
  const NotificationSign({super.key, this.isActive = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: isActive
          ? Positioned(
              top: 10,
              right: 10,
              child: Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.9),
                  shape: BoxShape.circle,
                  border:
                      Border.all(width: 1, color: Theme.of(context).cardColor),
                ),
              ),
            )
          : const SizedBox(),
    );
  }
}
