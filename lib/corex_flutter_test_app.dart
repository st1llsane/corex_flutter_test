import 'package:corex_flutter_test/shared/routes/routes.dart';
import 'package:corex_flutter_test/theme/theme.dart';
import 'package:flutter/material.dart';

class CorexFlutterTestApp extends StatelessWidget {
  const CorexFlutterTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Corex Flutter Test',
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      routerConfig: routes,
    );
  }
}
