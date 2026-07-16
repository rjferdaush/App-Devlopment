import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget child;

  const BackgroundWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: BackgroundPainter(),
            ),
          ),
          child,
        ],
      ),
    );
  }
}

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.green.withOpacity(0.03) // Subtle green concentric waves
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    // Concentric circles in the bottom right corner
    final centerBR = Offset(size.width * 0.9, size.height * 0.9);
    for (double i = 40; i < 360; i += 24) {
      canvas.drawCircle(centerBR, i, paint);
    }

    // Concentric circles in the top left corner
    final centerTL = Offset(0, 0);
    for (double i = 60; i < 200; i += 24) {
      canvas.drawCircle(centerTL, i, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
