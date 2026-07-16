import 'package:flutter/material.dart';

class TaskManagerLogo extends StatelessWidget {
  final double iconSize;
  final double fontSize;

  const TaskManagerLogo({
    super.key,
    this.iconSize = 64,
    this.fontSize = 32,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.assignment_turned_in_outlined,
          color: const Color(0xFF21b573),
          size: iconSize,
        ),
        const SizedBox(width: 8),
        Text(
          'TaskManager',
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF2E3E5C),
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }
}
