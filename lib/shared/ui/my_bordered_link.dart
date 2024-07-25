import 'package:flutter/material.dart';

class MyBorderedLink extends StatelessWidget {
  final String text;

  const MyBorderedLink({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => {},
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
        ),
        side: BorderSide(
          color: Colors.grey.shade900,
        ),
        overlayColor: Colors.pinkAccent.shade100,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.grey.shade900,
          fontSize: 15,
        ),
      ),
    );
  }
}
