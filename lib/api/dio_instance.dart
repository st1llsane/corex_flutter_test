import 'package:dio/dio.dart';

final options = BaseOptions(
  connectTimeout: const Duration(seconds: 5),
  receiveTimeout: const Duration(seconds: 3),
);

final dioInstance = Dio(options);
