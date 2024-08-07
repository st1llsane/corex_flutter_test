import 'package:corex_flutter_test/api/bloc/user_post/favorite/favorite_user_post_bloc.dart';
import 'package:corex_flutter_test/api/bloc/user_post/hidden/hidden_user_post_bloc.dart';
import 'package:corex_flutter_test/api/bloc/user_post/user_post_bloc.dart';
import 'package:corex_flutter_test/shared/container_with_scrollbar.dart';
import 'package:corex_flutter_test/shared/error_message.dart';
import 'package:corex_flutter_test/shared/models/user_post/user_post.dart';
import 'package:corex_flutter_test/shared/types/types.dart';
import 'package:corex_flutter_test/shared/ui/my_circular_progress_indicator.dart';
import 'package:corex_flutter_test/shared/ui/my_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class UsersPostsList extends StatefulWidget {
  final UserPostBloc userPostBloc;
  final int? postCountToDisplay;
  final ListItemType? itemsType;

  const UsersPostsList({
    super.key,
    required this.userPostBloc,
    this.postCountToDisplay,
    this.itemsType = ListItemType.text,
  });

  @override
  State<UsersPostsList> createState() => _UsersPostsListState();
}

class _UsersPostsListState extends State<UsersPostsList> {
  late ScrollController scrollController;
  late List<UserPost> postsList;
  late List<UserPost> favoritePosts;
  late List<UserPost> hiddenPosts;

  @override
  void initState() {
    super.initState();

    scrollController = ScrollController();
    widget.userPostBloc.add(LoadUsersPosts());

    favoritePosts = context.read<FavoriteUserPostBloc>().state.favoritePosts;
    hiddenPosts = context.read<HiddenUserPostBloc>().state.hiddenPosts;
  }

  bool isPostHidden(UserPost post) {
    final hiddenPosts = context.read<HiddenUserPostBloc>().state.hiddenPosts;

    return hiddenPosts.any((hiddenPost) => hiddenPost.id == post.id);
  }

  void hidePost(UserPost post) {
    context.read<HiddenUserPostBloc>().add(HideUserPost(post: post));
  }

  bool isPostInFavorite(UserPost post) {
    final favoritePosts =
        context.read<FavoriteUserPostBloc>().state.favoritePosts;

    return favoritePosts.any((favoritePost) => favoritePost.id == post.id);
  }

  void setIsPostInFavorite(UserPost post) {
    if (isPostInFavorite(post)) {
      context
          .read<FavoriteUserPostBloc>()
          .add(RemoveUserPostFromFavorite(post: post));
    } else {
      context
          .read<FavoriteUserPostBloc>()
          .add(AddUserPostToFavorite(post: post));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<FavoriteUserPostBloc, FavoriteUserPostState>(
          listener: (context, state) {
            setState(() {});
          },
        ),
        BlocListener<HiddenUserPostBloc, HiddenUserPostState>(
          listener: (context, state) {
            setState(() {});
          },
        ),
      ],
      child: BlocBuilder<UserPostBloc, UserPostState>(
        bloc: widget.userPostBloc,
        builder: (context, state) {
          final ThemeData theme = Theme.of(context);
          late List<UserPost> postsList;

          if (state is UserPostsLoaded) {
            postsList =
                state.usersPosts.where((post) => !isPostHidden(post)).toList();

            if (postsList.isEmpty) {
              return Center(
                child: Text(
                  'Posts were not found.',
                  style: theme.textTheme.bodyLarge,
                ),
              );
            }

            return ContainerWithScrollbar(
              scrollController: scrollController,
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
                          : const EdgeInsets.only(bottom: 10),
                      child: widget.itemsType == ListItemType.text
                          ? Text(
                              '${index + 1}. ${post.title}',
                              style: theme.textTheme.bodyMedium,
                            )
                          : Row(
                              children: [
                                Flexible(
                                  fit: FlexFit.tight,
                                  child: MyOutlinedButton(
                                    onPressed: () => context.push(
                                        '/all-users-posts/user-post-details?postId=${post.id}'),
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
                                  onPressed: () => setIsPostInFavorite(post),
                                  icon: Icon(
                                    isPostInFavorite(post)
                                        ? Icons.favorite
                                        : Icons.favorite_border_outlined,
                                  ),
                                  highlightColor: Colors.pink.shade100,
                                ),
                              ],
                            ),
                    );
                  },
                ),
              ),
            );
          }

          if (state is UserPostsLoaded) {
            ErrorMessage(
              message: 'Error when loading posts. Please, try again later.',
              onPressed: () => widget.userPostBloc.add(LoadUsersPosts()),
            );
          }

          return const MyCircularProgressIndicator();
        },
      ),
    );
  }
}
