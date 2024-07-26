import 'package:corex_flutter_test/api/bloc/user_post/user_post_bloc.dart';
import 'package:corex_flutter_test/api/repos/user_post/abstract_user_repo.dart';
import 'package:corex_flutter_test/shared/types/types.dart';
import 'package:corex_flutter_test/shared/ui/my_underlined_button.dart';
import 'package:corex_flutter_test/shared/users_posts_list.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class AllUsersPostsPage extends StatefulWidget {
  const AllUsersPostsPage({super.key});

  @override
  State<AllUsersPostsPage> createState() => _AllUsersPostsPageState();
}

class _AllUsersPostsPageState extends State<AllUsersPostsPage> {
  final userPostBloc = UserPostBloc(GetIt.I<AbstractUserPostRepo>());

  @override
  void initState() {
    super.initState();

    userPostBloc.add(LoadUsersPosts());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'All Posts',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 20),
        Expanded(
          child: UsersPostsList(
            userPostBloc: userPostBloc,
            itemsType: ItemType.link,
          ),
        ),
        const SizedBox(height: 20),
        MyUnderlinedButton(
          onPressed: () => context.pop(),
          text: 'On Home Page',
          icon: Icons.arrow_back_ios,
          iconAlignment: IconAlignment.start,
        ),
      ],
    );
  }
}
