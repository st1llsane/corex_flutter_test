import 'package:corex_flutter_test/api/bloc/app_bloc.dart';
import 'package:corex_flutter_test/api/repos/app/abstract_app_repo.dart';
import 'package:corex_flutter_test/shared/models/user/user.dart';
import 'package:corex_flutter_test/shared/user_list_item.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

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

  final appBloc = AppBloc();

  @override
  void initState() {
    super.initState();

    appBloc.add(LoadUsers());
    // TODO: может нужен await?
    users = GetIt.I<AbstractAppRepo>().getUsers();
    setState(() {});
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
