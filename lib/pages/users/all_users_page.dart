import 'package:corex_flutter_test/api/bloc/user/user_bloc.dart';
import 'package:corex_flutter_test/api/repos/user/abstract_user_repo.dart';
import 'package:corex_flutter_test/shared/page_container.dart';
import 'package:corex_flutter_test/shared/ui/my_underlined_link.dart';
import 'package:corex_flutter_test/shared/ui/my_title.dart';
import 'package:corex_flutter_test/shared/users_list.dart';
import 'package:corex_flutter_test/shared/utils/build_column_with_gap.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class AllUsersPage extends StatefulWidget {
  const AllUsersPage({super.key});

  @override
  State<AllUsersPage> createState() => _AllUsersPageState();
}

class _AllUsersPageState extends State<AllUsersPage> {
  final userBloc = UserBloc(GetIt.I<AbstractUserRepo>());

  @override
  void initState() {
    super.initState();

    userBloc.add(LoadUsers());
  }

  @override
  Widget build(BuildContext context) {
    return PageContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: buildColumnWithGap([
          const MyTitle(text: 'All Users'),
          MyUnderlinedLink(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xFF64B5F6),
              size: 13,
            ),
            iconAlignment: IconAlignment.start,
            text: 'On Home Page',
            onPressed: () => context.pop(),
          ),
          Expanded(
            child: UsersList(
              userBloc: userBloc,
            ),
          ),
        ], 10),
      ),
    );
  }
}
