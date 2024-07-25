import 'package:corex_flutter_test/shared/ui/my_bordered_link.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserListItem extends StatelessWidget {
  final String name;
  final int userId;

  const UserListItem({
    super.key,
    required this.name,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    return MyBorderedLink(
      text: name,
      onPressed: () => context.go('/user-details/:$userId'),
    );
  }
}
