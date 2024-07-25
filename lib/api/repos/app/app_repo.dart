import 'package:corex_flutter_test/api/repos/app/abstract_app_repo.dart';
import 'package:corex_flutter_test/shared/models/user/user.dart';
import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';

class AppRepo implements AbstractAppRepo {
  final Dio dio;

  AppRepo({
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
}
