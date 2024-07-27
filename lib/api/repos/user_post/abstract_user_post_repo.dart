import 'package:corex_flutter_test/shared/models/user_post/user_post.dart';

abstract class AbstractUserPostRepo {
  Future<List<UserPost>> getUsersPosts();
  Future<UserPost> getUserPostById(String postId);
}
