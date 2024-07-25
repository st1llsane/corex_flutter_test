import 'package:corex_flutter_test/api/bloc/user/user_bloc.dart';
import 'package:corex_flutter_test/api/repos/user/abstract_user_repo.dart';
import 'package:corex_flutter_test/shared/models/user/user.dart';
import 'package:corex_flutter_test/shared/ui/my_bordered_link.dart';
import 'package:corex_flutter_test/shared/user_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class UsersList extends StatefulWidget {
  final int? userCountToDisplay;
  final Axis scrollDirection;

  const UsersList({
    super.key,
    this.userCountToDisplay,
    this.scrollDirection = Axis.vertical,
  });

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  final userBloc = UserBloc(GetIt.I<AbstractUserRepo>());

  @override
  void initState() {
    super.initState();

    userBloc.add(LoadUsers());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      bloc: userBloc,
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
                  onPressed: () => userBloc.add(LoadUsers()),
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
            scrollDirection: widget.scrollDirection,
            shrinkWrap: true,
            itemCount: widget.userCountToDisplay ?? usersList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: widget.scrollDirection == Axis.horizontal
                    ? const EdgeInsets.only(right: 12)
                    : const EdgeInsets.only(bottom: 4),
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
