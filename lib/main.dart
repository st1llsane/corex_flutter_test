import 'package:corex_flutter_test/api/dio_instance.dart';
import 'package:corex_flutter_test/api/repos/user/abstract_user_repo.dart';
import 'package:corex_flutter_test/api/repos/user/user_repo.dart';
import 'package:corex_flutter_test/api/repos/user_post/abstract_user_repo.dart';
import 'package:corex_flutter_test/api/repos/user_post/user_repo.dart';
import 'package:corex_flutter_test/corex_flutter_test_app.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  // runApp(
  //   BlocProvider(
  //     create: (context) => {},
  //     child: const CorexFlutterTestApp(),
  //   ),
  // );

  GetIt.I.registerLazySingleton<AbstractUserRepo>(() {
    return UserRepo(dio: dioInstance);
  });
  GetIt.I.registerLazySingleton<AbstractUserPostRepo>(() {
    return UserPostRepo(dio: dioInstance);
  });

  runApp(
    const CorexFlutterTestApp(),
  );
}
