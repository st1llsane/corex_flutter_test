import 'package:corex_flutter_test/api/bloc/user_post/user_post_bloc.dart';
import 'package:corex_flutter_test/api/repos/user_post/abstract_user_post_repo.dart';
import 'package:corex_flutter_test/shared/types/types.dart';
import 'package:corex_flutter_test/shared/ui/my_title.dart';
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
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MyTitle(text: 'All Posts'),
        Expanded(
          child: UsersPostsList(
            userPostBloc: userPostBloc,
            itemsType: ListItemType.link,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyUnderlinedButton(
              onPressed: () => context.pop(),
              text: 'Home Page',
              icon: Icons.arrow_back_ios,
              iconAlignment: IconAlignment.start,
            ),
            MyUnderlinedButton(
              onPressed: () =>
                  context.push('/all-users-posts/favorite-users-posts'),
              text: 'Favorite Posts Page',
              icon: Icons.arrow_forward_ios,
              iconAlignment: IconAlignment.end,
            )
          ],
        ),
      ],
    );
  }
}
