import 'package:corex_flutter_test/shared/ui/my_bordered_link.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserPostListItem extends StatelessWidget {
  final String postTitle;
  final int postId;

  const UserPostListItem({
    super.key,
    required this.postTitle,
    required this.postId,
  });

  @override
  Widget build(BuildContext context) {
    return MyBorderedLink(
      text: postTitle,
      onPressed: () => context.go('/user-post-details?postId=$postId'),
    );
  }
}
