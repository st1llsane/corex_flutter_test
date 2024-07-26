import 'dart:async';

import 'package:corex_flutter_test/api/bloc/user/user_bloc.dart';
import 'package:corex_flutter_test/api/repos/user/abstract_user_repo.dart';
import 'package:corex_flutter_test/shared/page_container.dart';
import 'package:corex_flutter_test/shared/users_list.dart';
import 'package:corex_flutter_test/shared/ui/my_underlined_link.dart';
import 'package:corex_flutter_test/shared/ui/my_title.dart';
import 'package:corex_flutter_test/shared/utils/build_column_with_gap.dart';
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

  @override
  void initState() {
    super.initState();

    userBloc.add(LoadUsers());
  }

  @override
  Widget build(BuildContext context) {
    return PageContainer(
      child: RefreshIndicator(
        onRefresh: () {
          final completer = Completer();
          userBloc.add(LoadUsers(completer: completer));
          return completer.future;
        },
        child: ListView(
          children: buildColumnWithGap([
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: buildColumnWithGap([
                const MyTitle(text: 'Users'),
                SizedBox(
                  height: 80,
                  child: UsersList(
                    userBloc: userBloc,
                    userCountToDisplay: 5,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                MyUnderlinedLink(
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFF64B5F6),
                    size: 13,
                  ),
                  text: 'All Users',
                  onPressed: () => context.go('/all-users'),
                ),
              ], 10),
            ),
            // const Expanded(
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       MyTitle(text: 'Posts'),
            //       SizedBox(
            //         height: 6,
            //       ),
            //       Expanded(
            //         child: UsersList(),
            //       ),
            //     ],
            //   ),
            // ),
          ], 20),
        ),
      ),
    );
  }
}
