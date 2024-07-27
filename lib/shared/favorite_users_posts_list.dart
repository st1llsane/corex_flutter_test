import 'package:corex_flutter_test/api/bloc/user_post/favorite/favorite_user_post_bloc.dart';
import 'package:corex_flutter_test/shared/models/post/post.dart';
import 'package:corex_flutter_test/shared/ui/my_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FavoriteUsersPostsList extends StatefulWidget {
  final FavoriteUserPostBloc favoriteUserPostBloc;

  const FavoriteUsersPostsList({
    super.key,
    required this.favoriteUserPostBloc,
  });

  @override
  State<FavoriteUsersPostsList> createState() => _FavoriteUsersPostsListState();
}

class _FavoriteUsersPostsListState extends State<FavoriteUsersPostsList> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();

    scrollController = ScrollController();
  }

  void removePostFromFavorite(UserPost post) {
    context
        .read<FavoriteUserPostBloc>()
        .add(RemoveUserPostFromFavorite(post: post));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteUserPostBloc, FavoriteUserPostState>(
      builder: (context, state) {
        final favoritePosts = state.favoritePosts;
        final ThemeData theme = Theme.of(context);

        if (favoritePosts.isEmpty) {
          return Center(
            child: Text(
              'Favorite posts were not found.',
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
                itemCount: favoritePosts.length,
                itemBuilder: (context, index) {
                  final bool isLastItem = index < (favoritePosts.length - 1);
                  final UserPost post = favoritePosts[index];

                  return Padding(
                    padding: !isLastItem
                        ? const EdgeInsets.only(bottom: 0)
                        : const EdgeInsets.only(bottom: 15),
                    child: Row(
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          child: MyOutlinedButton(
                            onPressed: () => context
                                .go('/user-post-details?postId=${post.id}'),
                            text: '${index + 1}. ${post.title}',
                          ),
                        ),
                        const SizedBox(width: 5),
                        IconButton(
                          onPressed: () => removePostFromFavorite(post),
                          icon: const Icon(Icons.delete_outline),
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
      },
    );
  }
}
