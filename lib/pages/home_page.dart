import 'dart:async';

import 'package:corex_flutter_test/api/bloc/user/user_bloc.dart';
import 'package:corex_flutter_test/api/bloc/user_post/user_post_bloc.dart';
import 'package:corex_flutter_test/api/repos/user/abstract_user_repo.dart';
import 'package:corex_flutter_test/api/repos/user_post/abstract_user_post_repo.dart';
import 'package:corex_flutter_test/shared/ui/my_title.dart';
import 'package:corex_flutter_test/shared/ui/my_underlined_button.dart';
import 'package:corex_flutter_test/shared/users_list.dart';
import 'package:corex_flutter_test/shared/users_posts_list.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final userBloc = UserBloc(GetIt.I<AbstractUserRepo>());
  final userPostBloc = UserPostBloc(GetIt.I<AbstractUserPostRepo>());

  @override
  void initState() {
    super.initState();

    userBloc.add(LoadUsers());
    userPostBloc.add(LoadUsersPosts());
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        final userCompleter = Completer();
        final userPostCompleter = Completer();

        userBloc.add(LoadUsers(completer: userCompleter));
        userPostBloc.add(LoadUsersPosts(completer: userPostCompleter));

        await Future.wait([userCompleter.future, userPostCompleter.future]);
      },
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MyTitle(text: 'Users'),
              UsersList(
                userBloc: userBloc,
                userCountToDisplay: 5,
                direction: Axis.horizontal,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MyUnderlinedButton(
                    text: 'All Users',
                    icon: Icons.arrow_forward_ios,
                    onPressed: () => context.push('/all-users'),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MyTitle(text: 'Posts'),
                Expanded(
                  child: UsersPostsList(
                    userPostBloc: userPostBloc,
                    postCountToDisplay: 10,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MyUnderlinedButton(
                      text: 'All Posts',
                      icon: Icons.arrow_forward_ios,
                      onPressed: () => context.push('/all-users-posts'),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
