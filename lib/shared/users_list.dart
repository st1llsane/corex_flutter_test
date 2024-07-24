import 'package:corex_flutter_test/models/user/user.dart';
import 'package:corex_flutter_test/shared/user_list_item.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

// ignore: constant_identifier_names
const int USERS_COUNT_TO_DISPLAY = 5;

class UsersList extends StatefulWidget {
  const UsersList({super.key});

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  final dio = Dio();
  Future<List<User>>? users;

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  Future<List<User>> getUsers() async {
    final res = await dio.get('https://jsonplaceholder.typicode.com/users');
    List<User> usersList =
        (res.data as List).map((user) => User.fromJson(user)).toList();

    setState(() {
      users = Future.value(usersList);
    });

    return usersList;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<User>>(
      future: users,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.hasError) {
          return Center(
            child: Text(
              "Error: ${snapshot.error}",
              style: TextStyle(color: Colors.red.shade900),
            ),
          );
        }

        if ((!snapshot.hasData || snapshot.data!.isEmpty)) {
          return Center(
            child: Text(
              "Users not found",
              style: TextStyle(color: Colors.grey.shade900),
            ),
          );
        } else {
          List<User> usersData = snapshot.data!;

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: USERS_COUNT_TO_DISPLAY,
            itemBuilder: (context, index) {
              return Padding(
                padding: index == USERS_COUNT_TO_DISPLAY - 1
                    ? EdgeInsets.zero
                    : const EdgeInsets.only(
                        right: 12,
                      ),
                child: UserListItem(name: usersData[index].name),
              );
            },
          );
        }
      },
    );
  }
}
