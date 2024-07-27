import 'package:corex_flutter_test/api/dio_instance.dart';
import 'package:corex_flutter_test/api/repos/user/abstract_user_repo.dart';
import 'package:corex_flutter_test/api/repos/user/user_repo.dart';
import 'package:corex_flutter_test/api/repos/user_post/abstract_user_post_repo.dart';
import 'package:corex_flutter_test/api/repos/user_post/user_repo.dart';
import 'package:get_it/get_it.dart';

void registerDependencies() {
  GetIt.I.registerLazySingleton<AbstractUserRepo>(() {
    return UserRepo(dio: dioInstance);
  });
  GetIt.I.registerLazySingleton<AbstractUserPostRepo>(() {
    return UserPostRepo(dio: dioInstance);
  });
}
