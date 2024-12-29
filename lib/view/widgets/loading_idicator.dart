import 'package:flutter/material.dart';

class LoadingIndicator extends StatefulWidget {
  const LoadingIndicator({super.key});

  @override
  _LoadingIndicatorState createState() => _LoadingIndicatorState();
}

class _LoadingIndicatorState extends State<LoadingIndicator> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300), // تم تقليل المدة لجعل الحركة أسرع
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          bool isAtTop = _controller.value < 0.5;
          return Transform.translate(
            offset: Offset(0, 10 * (_controller.value - 0.5)),
            child: Image.asset(
              isAtTop ? 'assets/images/loading2.webp' : 'assets/images/loading3.webp',
              height: 100,
            ),
          );
        },
      ),
    );
  }
}
