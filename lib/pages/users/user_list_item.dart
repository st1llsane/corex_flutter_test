import 'package:corex_flutter_test/shared/ui/my_text_button.dart';
import 'package:flutter/material.dart';

class UserListItem extends StatelessWidget {
  final String name;

  const UserListItem({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return MyTextButton(
      text: name,
    );
  }
}
