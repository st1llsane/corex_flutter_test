import 'package:corex_flutter_test/api/bloc/user_post/user_post_bloc.dart';
import 'package:corex_flutter_test/shared/models/post/post.dart';
import 'package:corex_flutter_test/shared/ui/my_bordered_link.dart';
import 'package:corex_flutter_test/shared/user_post_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersPostsList extends StatefulWidget {
  final UserPostBloc userPostBloc;
  final int? postCountToDisplay;

  const UsersPostsList({
    super.key,
    required this.userPostBloc,
    this.postCountToDisplay,
  });

  @override
  State<UsersPostsList> createState() => _UsersPostsListState();
}

class _UsersPostsListState extends State<UsersPostsList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserPostBloc, UserPostState>(
      bloc: widget.userPostBloc,
      builder: (context, state) {
        if (state is UserPostsLoaded) {
          List<UserPost> postsList = state.usersPosts;

          if (postsList.isEmpty) {
            return Center(
              child: Text(
                'Users were not found.',
                style: TextStyle(
                  color: Colors.grey.shade900,
                  fontSize: 16,
                ),
              ),
            );
          }

          return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: widget.postCountToDisplay ?? postsList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: UserPostListItem(
                  postTitle: postsList[index].title,
                  postId: postsList[index].id,
                ),
              );
            },
          );
        }

        if (state is UserPostsLoadingError) {
          return Center(
            child: Column(
              children: [
                Text(
                  'Error when loading users. Please, try again later.',
                  style: TextStyle(
                    color: Colors.red.shade900,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 15),
                MyBorderedLink(
                  text: 'Try again',
                  onPressed: () => widget.userPostBloc.add(LoadUsersPosts()),
                ),
              ],
            ),
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
