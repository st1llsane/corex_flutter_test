import 'package:corex_flutter_test/api/repos/app/abstract_app_repo.dart';
import 'package:corex_flutter_test/api/repos/app/app_repo.dart';
import 'package:corex_flutter_test/pages/home_page.dart';
import 'package:corex_flutter_test/pages/users/all_users_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
part 'shared/routes/routes.dart';

void main() {
  // runApp(
  //   BlocProvider(
  //     create: (context) => {},
  //     child: const MyApp(),
  //   ),
  // );
  GetIt.I.registerLazySingleton<AbstractAppRepo>(() => AppRepo(dio: Dio()));
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Corex Flutter Test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}
