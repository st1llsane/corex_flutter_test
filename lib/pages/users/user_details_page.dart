import 'package:corex_flutter_test/shared/page_container.dart';
import 'package:corex_flutter_test/shared/ui/my_title.dart';
import 'package:corex_flutter_test/shared/ui/my_underlined_link.dart';
import 'package:corex_flutter_test/shared/utils/build_column_with_gap.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserDetailsPage extends StatelessWidget {
  final String userId;

  const UserDetailsPage({
    super.key,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    return PageContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: buildColumnWithGap([
          MyTitle(text: 'User ID: $userId'),
          MyUnderlinedLink(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xFF64B5F6),
              size: 13,
            ),
            iconAlignment: IconAlignment.start,
            text: 'On Home Page',
            onPressed: () => context.go('/'),
          ),
        ], 10),
      ),
    );
  }
}
