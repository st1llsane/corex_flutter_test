import 'package:flutter/material.dart';

class MyUnderlinedLink extends StatelessWidget {
  final Icon? icon;
  final IconAlignment iconAlignment;
  final String text;
  final VoidCallback onPressed;

  const MyUnderlinedLink({
    super.key,
    this.icon,
    this.iconAlignment = IconAlignment.end,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: const Color(0xFF64B5F6),
        backgroundColor: Colors.transparent,
        overlayColor: Colors.transparent,
        padding: const EdgeInsets.all(0),
        minimumSize: const Size(0, 0),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.zero),
        ),
      ),
      icon: icon,
      iconAlignment: iconAlignment,
      label: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          decoration: TextDecoration.underline,
          decorationColor: Color(0xFF64B5F6),
          decorationThickness: 1,
        ),
      ),
    );
  }
}
