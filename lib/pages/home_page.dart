import 'package:corex_flutter_test/pages/users/users_list.dart';
import 'package:corex_flutter_test/shared/ui/my_link.dart';
import 'package:corex_flutter_test/shared/ui/my_title.dart';
import 'package:corex_flutter_test/shared/utils/build_column_with_gap.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: buildColumnWithGap([
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: buildColumnWithGap(const [
            MyTitle(text: 'Пользователи: '),
            SizedBox(
              height: 40,
              child: UsersList(),
            ),
            MyLink(
              text: 'Все пользователи',
              pageName: '',
            ),
          ], 10),
        ),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyTitle(text: 'Посты: '),
              SizedBox(
                height: 6,
              ),
              Expanded(
                child: UsersList(),
              ),
            ],
          ),
        ),
      ], 20),
    );
  }
}
