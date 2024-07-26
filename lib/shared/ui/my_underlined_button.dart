import 'package:flutter/material.dart';

class MyUnderlinedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final IconData? icon;
  final IconAlignment iconAlignment;

  const MyUnderlinedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.icon,
    this.iconAlignment = IconAlignment.end,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      label: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          decoration: TextDecoration.underline,
          decorationColor: Colors.pink.shade100,
          decorationThickness: 1,
        ),
      ),
      icon: icon != null
          ? Icon(
              icon,
              color: Colors.pink.shade100,
              size: 13,
            )
          : null,
      iconAlignment: iconAlignment,
    );
  }
}
