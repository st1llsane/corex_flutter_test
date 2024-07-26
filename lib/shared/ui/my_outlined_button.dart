import 'package:flutter/material.dart';

class MyOutlinedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final IconData? icon;

  const MyOutlinedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
          color: Color(0xFF46393D),
          blurRadius: 4,
          spreadRadius: -3,
          offset: Offset(0, 1),
        )
      ]),
      child: OutlinedButton.icon(
        onPressed: onPressed,
        label: Text(text),
        icon: icon != null
            ? Icon(
                icon,
                color: Colors.pink.shade100,
                size: 13,
              )
            : null,
      ),
    );
  }
}
