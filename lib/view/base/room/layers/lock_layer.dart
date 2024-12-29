import 'package:flutter/material.dart';

class LockLayer extends StatelessWidget {
  const LockLayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF412E2E6F),
      child: Center(
        child: Icon(
          Icons.lock,
          color: Colors.grey,
        ),
      ),
    );
  }
}
