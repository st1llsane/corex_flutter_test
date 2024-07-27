import 'package:flutter/material.dart';

class MyTitle extends StatelessWidget {
  final String text;

  const MyTitle({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
