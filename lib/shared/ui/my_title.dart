import 'package:flutter/material.dart';

class MyTitle extends StatelessWidget {
  final String text;

  const MyTitle({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
