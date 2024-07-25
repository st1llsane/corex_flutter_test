import 'package:corex_flutter_test/shared/models/user/user.dart';

abstract class AbstractAppRepo {
  Future<List<User>> getUsers();
}
