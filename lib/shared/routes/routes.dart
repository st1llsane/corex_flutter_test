import 'package:corex_flutter_test/pages/home_page.dart';
import 'package:corex_flutter_test/pages/not_found_page.dart';
import 'package:corex_flutter_test/pages/posts/all_users_posts_page.dart';
import 'package:corex_flutter_test/pages/posts/user_post_details_page.dart';
import 'package:corex_flutter_test/pages/posts/favorite_users_posts_page.dart';
import 'package:corex_flutter_test/pages/users/all_users_page.dart';
import 'package:corex_flutter_test/pages/users/user_details_page.dart';
import 'package:corex_flutter_test/shared/page_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final routes = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: 'home',
      builder: (BuildContext context, GoRouterState state) {
        return const PageContainer(child: HomePage());
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'all-users',
          name: 'all-users-page',
          builder: (BuildContext context, GoRouterState state) {
            return const PageContainer(child: AllUsersPage());
          },
          routes: <RouteBase>[
            GoRoute(
              path: 'user-details',
              name: 'user-details-page',
              builder: (BuildContext context, GoRouterState state) {
                final userId = state.uri.queryParameters['userId']!;

                return PageContainer(child: UserDetailsPage(userId: userId));
              },
            ),
          ],
        ),
        GoRoute(
          path: 'all-users-posts',
          name: 'all-users-posts-page',
          builder: (BuildContext context, GoRouterState state) {
            return const PageContainer(child: AllUsersPostsPage());
          },
          routes: <RouteBase>[
            GoRoute(
              path: 'user-post-details',
              name: 'user-post-details-page',
              builder: (BuildContext context, GoRouterState state) {
                final postId = state.uri.queryParameters['postId']!;

                return PageContainer(
                    child: UserPostDetailsPage(postId: postId));
              },
            ),
            GoRoute(
              path: 'favorite-users-posts',
              name: 'favorite-users-posts-page',
              builder: (BuildContext context, GoRouterState state) {
                return const PageContainer(child: FavoriteUsersPostsPage());
              },
            )
          ],
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) {
    return const NotFoundPage();
  },
  // debugLogDiagnostics: true,
);
