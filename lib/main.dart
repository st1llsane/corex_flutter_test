import 'package:corex_flutter_test/corex_flutter_test_app.dart';
import 'package:corex_flutter_test/shared/dependencies/dependencies.dart';
import 'package:flutter/material.dart';

void main() {
  registerDependencies();

  runApp(
    const CorexFlutterTestApp(),
  );
}
