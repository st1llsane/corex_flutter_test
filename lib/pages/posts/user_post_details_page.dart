import 'package:corex_flutter_test/api/bloc/user_post/user_post_bloc.dart';
import 'package:corex_flutter_test/api/repos/user_post/abstract_user_post_repo.dart';
import 'package:corex_flutter_test/shared/container_with_scrollbar.dart';
import 'package:corex_flutter_test/shared/error_message.dart';
import 'package:corex_flutter_test/shared/models/user_post/user_post.dart';
import 'package:corex_flutter_test/shared/ui/my_circular_progress_indicator.dart';
import 'package:corex_flutter_test/shared/ui/my_title.dart';
import 'package:corex_flutter_test/shared/ui/my_underlined_button.dart';
import 'package:corex_flutter_test/shared/utils/build_column_with_dynamic_content.dart';
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
        const MyTitle(text: 'Post Details'),
        Expanded(
          child: BlocBuilder<UserPostBloc, UserPostState>(
            bloc: userPostBloc,
            builder: (context, state) {
              if (state is UserPostByIdLoaded) {
                final UserPost post = state.userPost;

                return ContainerWithScrollbar(
                  scrollController: scrollController,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: ListView(
                      controller: scrollController,
                      children: buildColumnWithDynamicContent({
                        'Title': post.title,
                        'Body': post.body,
                      }),
                    ),
                  ),
                );
              }

              if (state is UserPostByIdLoadingError) {
                return ErrorMessage(
                    message:
                        'Error when loading users. Please, try again later.',
                    onPressed: () => userPostBloc
                        .add(LoadUserPostById(postId: widget.postId)));
              }

              return const MyCircularProgressIndicator();
            },
          ),
        ),
        const SizedBox(height: 20),
        MyUnderlinedButton(
          onPressed: () => context.pop(),
          text: 'Go Back',
          icon: Icons.arrow_back_ios,
          iconAlignment: IconAlignment.start,
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
