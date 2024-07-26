import 'package:corex_flutter_test/api/bloc/user_post/user_post_bloc.dart';
import 'package:corex_flutter_test/api/repos/user_post/abstract_user_repo.dart';
import 'package:corex_flutter_test/shared/page_container.dart';
import 'package:corex_flutter_test/shared/ui/my_underlined_link.dart';
import 'package:corex_flutter_test/shared/ui/my_title.dart';
import 'package:corex_flutter_test/shared/users_posts_list.dart';
import 'package:corex_flutter_test/shared/utils/build_column_with_gap.dart';
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
    return PageContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: buildColumnWithGap([
          const MyTitle(text: 'All Posts'),
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
            child: UsersPostsList(
              userPostBloc: userPostBloc,
            ),
          ),
        ], 10),
      ),
    );
  }
}
