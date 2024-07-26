import 'package:corex_flutter_test/shared/models/post/post.dart';

abstract class AbstractUserPostRepo {
  Future<List<UserPost>> getUsersPosts();
  Future<UserPost> getUserPostById(String postId);
}
