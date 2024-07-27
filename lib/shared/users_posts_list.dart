import 'package:corex_flutter_test/api/bloc/user_post/user_post_bloc.dart';
import 'package:corex_flutter_test/shared/models/post/post.dart';
import 'package:corex_flutter_test/shared/types/types.dart';
import 'package:corex_flutter_test/shared/ui/my_circular_progress_indicator.dart';
import 'package:corex_flutter_test/shared/ui/my_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class UsersPostsList extends StatefulWidget {
  final UserPostBloc userPostBloc;
  final int? postCountToDisplay;
  final ItemType? itemsType;

  const UsersPostsList({
    super.key,
    required this.userPostBloc,
    this.postCountToDisplay,
    this.itemsType = ItemType.text,
  });

  @override
  State<UsersPostsList> createState() => _UsersPostsListState();
}

class _UsersPostsListState extends State<UsersPostsList> {
  List<UserPost> postsList = [];
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();

    scrollController = ScrollController();
    widget.userPostBloc.stream.listen((state) {
      if (state is UserPostsLoaded) {
        setState(() {
          postsList = state.usersPosts;
        });
      }
    });
  }

  void hidePost(UserPost post) {
    setState(() {
      postsList.remove(post);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserPostBloc, UserPostState>(
      bloc: widget.userPostBloc,
      builder: (context, state) {
        final ThemeData theme = Theme.of(context);

        if (state is UserPostsLoaded) {
          if (postsList.isEmpty) {
            return Center(
              child: Text(
                'Posts were not found.',
                style: theme.textTheme.bodyLarge,
              ),
            );
          }

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
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: widget.postCountToDisplay ?? postsList.length,
                  itemBuilder: (context, index) {
                    final bool isLastItem = index <
                        ((widget.postCountToDisplay ?? postsList.length) - 1);
                    final UserPost post = postsList[index];

                    return Padding(
                      padding: !isLastItem
                          ? const EdgeInsets.only(bottom: 0)
                          : const EdgeInsets.only(bottom: 15),
                      child: widget.itemsType == ItemType.text
                          ? Text(
                              '${index + 1}. ${post.title}',
                              style: theme.textTheme.bodyMedium,
                            )
                          : Row(
                              children: [
                                Flexible(
                                  fit: FlexFit.tight,
                                  child: MyOutlinedButton(
                                    onPressed: () => context.go(
                                        '/user-post-details?postId=${post.id}'),
                                    text: '${index + 1}. ${post.title}',
                                  ),
                                ),
                                const SizedBox(width: 5),
                                IconButton(
                                  onPressed: () => hidePost(post),
                                  icon:
                                      const Icon(Icons.remove_red_eye_outlined),
                                  highlightColor: Colors.pink.shade100,
                                ),
                                IconButton(
                                  onPressed: () => {},
                                  icon: const Icon(
                                      Icons.favorite_border_outlined),
                                  highlightColor: Colors.pink.shade100,
                                ),
                              ],
                            ),
                    );
                  },
                ),
              ),
            ),
          );
        }

        if (state is UserPostsLoadingError) {
          return Center(
            child: Column(
              children: [
                Text(
                  'Error when loading posts. Please, try again later.',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: Colors.red.shade600,
                  ),
                ),
                const SizedBox(height: 15),
                MyOutlinedButton(
                  text: 'Try again',
                  onPressed: () => widget.userPostBloc.add(LoadUsersPosts()),
                ),
              ],
            ),
          );
        }

        return const MyCircularProgressIndicator();
      },
    );
  }
}
