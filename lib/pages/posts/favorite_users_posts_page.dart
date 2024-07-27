import 'package:corex_flutter_test/api/bloc/user_post/favorite_user_post_bloc.dart';
import 'package:corex_flutter_test/shared/favorite_users_posts_list.dart';
import 'package:corex_flutter_test/shared/ui/my_underlined_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FavoriteUsersPostsPage extends StatefulWidget {
  const FavoriteUsersPostsPage({super.key});

  @override
  State<FavoriteUsersPostsPage> createState() => _UsersPostsFavoritePageState();
}

class _UsersPostsFavoritePageState extends State<FavoriteUsersPostsPage> {
  final favoriteUserPostBloc = FavoriteUserPostBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Favorite Posts',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 20),
        Expanded(
          child: FavoriteUsersPostsList(
            favoriteUserPostBloc: favoriteUserPostBloc,
          ),
        ),
        const SizedBox(height: 20),
        MyUnderlinedButton(
          onPressed: () => context.pop(),
          text: 'Go Back',
          icon: Icons.arrow_back_ios,
          iconAlignment: IconAlignment.start,
        ),
      ],
    );
  }
}
