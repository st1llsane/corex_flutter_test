import 'package:corex_flutter_test/shared/models/user/user.dart';

abstract class AbstractUserRepo {
  Future<List<User>> getUsers();
  Future<User> getUserById(String userId);
}
