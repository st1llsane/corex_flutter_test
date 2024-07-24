import 'package:flutter/material.dart';

class MyLink extends StatelessWidget {
  final String text;
  final String pageName;

  const MyLink({
    super.key,
    required this.text,
    required this.pageName,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print(pageName),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: const TextStyle(
              color: Color(0xFF53A9F0),
              fontSize: 16,
              decoration: TextDecoration.underline,
              decorationColor: Color(0xFF53A9F0),
              decorationThickness: 2,
            ),
          ),
          const SizedBox(width: 2),
          const Icon(
            Icons.arrow_forward_ios,
            color: Color(0xFF53A9F0),
            size: 14,
          ),
        ],
      ),
    );
  }
}
