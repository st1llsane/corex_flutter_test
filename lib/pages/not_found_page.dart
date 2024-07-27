import 'package:corex_flutter_test/shared/page_container.dart';
import 'package:corex_flutter_test/shared/ui/my_underlined_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageContainer(
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '404',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 10),
          Text(
            'Page was not found',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 20),
          MyUnderlinedButton(
            onPressed: () => context.go('/'),
            text: 'Main Page',
            icon: Icons.arrow_back_ios,
            iconAlignment: IconAlignment.start,
          )
        ],
      )),
    );
  }
}
