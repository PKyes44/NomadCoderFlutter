import 'package:flutter/material.dart';

// Reusable Button
class Button extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;

  const Button({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(45),
        color: backgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 50,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 19,
          ),
        ),
      ),
    );
  }
}
