import 'package:corex_flutter_test/api/repos/user/abstract_user_repo.dart';
import 'package:corex_flutter_test/shared/models/user/user.dart';
import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';

class UserRepo implements AbstractUserRepo {
  final Dio dio;

  UserRepo({
    required this.dio,
  });

  @override
  Future<List<User>> getUsers() async {
    final res = await dio.get('https://jsonplaceholder.typicode.com/users');
    // debugPrint(res.toString());

    List<User> usersList =
        (res.data as List).map((user) => User.fromJson(user)).toList();

    return usersList;
  }

  @override
  Future<User> getUserById(String userId) async {
    final res = await dio.get(
      'https://jsonplaceholder.typicode.com/users',
      queryParameters: {
        'id': userId,
      },
    );

    // debugPrint('USER BY ID: ${res.toString()}');

    List<User> user =
        (res.data as List).map((user) => User.fromJson(user)).toList();

    return user[0];
  }
}
