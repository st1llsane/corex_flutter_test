import 'package:corex_flutter_test/api/bloc/user/user_bloc.dart';
import 'package:corex_flutter_test/api/repos/user/abstract_user_repo.dart';
import 'package:corex_flutter_test/shared/types/types.dart';
import 'package:corex_flutter_test/shared/ui/my_title.dart';
import 'package:corex_flutter_test/shared/ui/my_underlined_button.dart';
import 'package:corex_flutter_test/shared/users_list.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MyTitle(text: 'All Users'),
        Expanded(
          child: UsersList(
            userBloc: userBloc,
            itemsType: ListItemType.link,
          ),
        ),
        const SizedBox(height: 20),
        MyUnderlinedButton(
          onPressed: () => context.pop(),
          text: 'Home Page',
          icon: Icons.arrow_back_ios,
          iconAlignment: IconAlignment.start,
        ),
      ],
    );
  }
}
