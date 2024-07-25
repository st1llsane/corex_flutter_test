import 'package:corex_flutter_test/api/bloc/app_bloc.dart';
import 'package:corex_flutter_test/api/repos/app/abstract_app_repo.dart';
import 'package:corex_flutter_test/shared/models/user/user.dart';
import 'package:corex_flutter_test/shared/ui/my_bordered_link.dart';
import 'package:corex_flutter_test/shared/user_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

// ignore: constant_identifier_names
const int USERS_COUNT_TO_DISPLAY = 5;

class UsersList extends StatefulWidget {
  const UsersList({super.key});

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  final appBloc = AppBloc(GetIt.I<AbstractAppRepo>());

  @override
  void initState() {
    super.initState();

    appBloc.add(LoadUsers());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      bloc: appBloc,
      builder: (context, state) {
        if (state is UsersLoadingError) {
          return Center(
            child: Column(
              children: [
                Text(
                  'Error when loading users. Please, try again later.',
                  style: TextStyle(
                    color: Colors.red.shade900,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 15),
                MyBorderedLink(
                  text: 'Try again',
                  onPressed: () => appBloc.add(LoadUsers()),
                ),
              ],
            ),
          );
        }

        if (state is UsersLoaded) {
          List<User> usersList = state.users;

          if (usersList.isEmpty) {
            return Center(
              child: Text(
                'Users were not found.',
                style: TextStyle(
                  color: Colors.grey.shade900,
                  fontSize: 16,
                ),
              ),
            );
          }

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
                child: UserListItem(
                  name: usersList[index].name,
                  userId: usersList[index].id,
                ),
              );
            },
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
