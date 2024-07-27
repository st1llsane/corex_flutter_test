import 'package:corex_flutter_test/shared/ui/my_outlined_button.dart';
import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final String message;
  final VoidCallback onPressed;

  const ErrorMessage({
    super.key,
    required this.message,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: Colors.red.shade600,
            ),
          ),
          const SizedBox(height: 15),
          MyOutlinedButton(
            text: 'Try again',
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
