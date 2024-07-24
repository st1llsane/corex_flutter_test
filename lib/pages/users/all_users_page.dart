import 'package:corex_flutter_test/shared/page_container.dart';
import 'package:corex_flutter_test/shared/ui/my_underlined_link.dart';
import 'package:corex_flutter_test/shared/ui/my_title.dart';
import 'package:corex_flutter_test/shared/utils/build_column_with_gap.dart';
import 'package:flutter/material.dart';

class AllUsersPage extends StatelessWidget {
  const AllUsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: buildColumnWithGap([
          const MyTitle(text: 'Все пользователи'),
          const MyUnderlinedLink(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Color(0xFF64B5F6),
                size: 13,
              ),
              iconAlignment: IconAlignment.start,
              text: 'На Главную',
              href: '/'),
        ], 10),
      ),
    );
  }
}
