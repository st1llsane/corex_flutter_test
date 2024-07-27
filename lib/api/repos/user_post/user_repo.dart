import 'package:corex_flutter_test/api/repos/user_post/abstract_user_post_repo.dart';
import 'package:corex_flutter_test/shared/models/post/post.dart';
import 'package:dio/dio.dart';

class UserPostRepo implements AbstractUserPostRepo {
  final Dio dio;

  UserPostRepo({
    required this.dio,
  });

  @override
  Future<List<UserPost>> getUsersPosts() async {
    final res = await dio.get('https://jsonplaceholder.typicode.com/posts');

    List<UserPost> usersPostsList =
        (res.data as List).map((post) => UserPost.fromJson(post)).toList();

    return usersPostsList;
  }

  @override
  Future<UserPost> getUserPostById(String postId) async {
    final res = await dio.get(
      'https://jsonplaceholder.typicode.com/posts',
      queryParameters: {
        'id': postId,
      },
    );

    List<UserPost> userPost =
        (res.data as List).map((post) => UserPost.fromJson(post)).toList();

    return userPost[0];
  }
}
