import 'package:corex_flutter_test/pages/home_page.dart';
import 'package:corex_flutter_test/pages/posts/all_users_posts_page.dart';
import 'package:corex_flutter_test/pages/posts/user_post_details_page.dart';
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
        ),
        GoRoute(
          path: 'all-users-posts',
          name: 'all-users-posts-page',
          builder: (BuildContext context, GoRouterState state) {
            return const PageContainer(child: AllUsersPostsPage());
          },
        ),
      ],
    ),
    GoRoute(
      path: '/user-details',
      name: 'user-details-page',
      builder: (BuildContext context, GoRouterState state) {
        final userId = state.uri.queryParameters['userId']!;

        return PageContainer(child: UserDetailsPage(userId: userId));
      },
    ),
    GoRoute(
      path: '/user-post-details',
      name: 'user-post-details-page',
      builder: (BuildContext context, GoRouterState state) {
        final postId = state.uri.queryParameters['postId']!;

        return PageContainer(child: UserPostDetailsPage(postId: postId));
      },
    ),
  ],
  errorBuilder: (context, state) {
    return const Scaffold(
      body: Center(
        child: PageContainer(child: Text('Page was not found')),
      ),
    );
  },
  // debugLogDiagnostics: true,
);
