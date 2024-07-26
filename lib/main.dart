import 'package:corex_flutter_test/api/repos/user/abstract_user_repo.dart';
import 'package:corex_flutter_test/api/repos/user/user_repo.dart';
import 'package:corex_flutter_test/api/repos/user_post/abstract_user_repo.dart';
import 'package:corex_flutter_test/api/repos/user_post/user_repo.dart';
import 'package:corex_flutter_test/pages/home_page.dart';
import 'package:corex_flutter_test/pages/posts/all_users_posts_page.dart';
import 'package:corex_flutter_test/pages/users/all_users_page.dart';
import 'package:corex_flutter_test/pages/users/user_details_page.dart';
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
  late Dio dio;

  final options = BaseOptions(
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 3),
  );

  dio = Dio(options);

  GetIt.I.registerLazySingleton<AbstractUserRepo>(() {
    return UserRepo(dio: dio);
  });
  GetIt.I.registerLazySingleton<AbstractUserPostRepo>(() {
    return UserPostRepo(dio: dio);
  });

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
