import 'package:corex_flutter_test/api/bloc/user_post/user_post_bloc.dart';
import 'package:corex_flutter_test/api/repos/user_post/abstract_user_repo.dart';
import 'package:corex_flutter_test/shared/models/post/post.dart';
import 'package:corex_flutter_test/shared/ui/my_circular_progress_indicator.dart';
import 'package:corex_flutter_test/shared/ui/my_outlined_button.dart';
import 'package:corex_flutter_test/shared/ui/my_underlined_button.dart';
import 'package:corex_flutter_test/shared/utils/build_column_with_gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class UserPostDetailsPage extends StatefulWidget {
  final String postId;

  const UserPostDetailsPage({
    super.key,
    required this.postId,
  });

  @override
  State<UserPostDetailsPage> createState() => _UserPostDetailsPageState();
}

class _UserPostDetailsPageState extends State<UserPostDetailsPage> {
  final userPostBloc = UserPostBloc(GetIt.I<AbstractUserPostRepo>());
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();

    scrollController = ScrollController();
    userPostBloc.add(LoadUserPostById(postId: widget.postId));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyUnderlinedButton(
          onPressed: () => context.go('/all-users-posts'),
          text: 'All Posts',
          icon: Icons.arrow_back_ios,
          iconAlignment: IconAlignment.start,
        ),
        const SizedBox(height: 20),
        Expanded(
          child: BlocBuilder<UserPostBloc, UserPostState>(
            bloc: userPostBloc,
            builder: (context, state) {
              final ThemeData theme = Theme.of(context);

              if (state is UserPostByIdLoaded) {
                final UserPost post = state.userPost;

                return ScrollbarTheme(
                  data: theme.scrollbarTheme,
                  child: Scrollbar(
                    controller: scrollController,
                    scrollbarOrientation: ScrollbarOrientation.left,
                    thumbVisibility: true,
                    trackVisibility: true,
                    radius: const Radius.circular(4),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: ListView(
                        controller: scrollController,
                        children: buildColumnWithGap([
                          Text('Title: ${post.title}'),
                          Text('Body: ${post.body}'),
                        ], 12),
                      ),
                    ),
                  ),
                );
              }

              if (state is UserPostByIdLoadingError) {
                return Center(
                  child: Column(
                    children: [
                      Text(
                        'Error when loading users. Please, try again later.',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: Colors.red.shade600,
                        ),
                      ),
                      const SizedBox(height: 20),
                      MyOutlinedButton(
                        onPressed: () => userPostBloc
                            .add(LoadUserPostById(postId: widget.postId)),
                        text: 'Try again',
                      ),
                    ],
                  ),
                );
              }

              return const MyCircularProgressIndicator();
            },
          ),
        ),
        const SizedBox(height: 20),
        MyUnderlinedButton(
          onPressed: () => context.go('/'),
          text: 'On Home Page',
          icon: Icons.arrow_back_ios,
          iconAlignment: IconAlignment.start,
        ),
      ],
    );
  }
}
