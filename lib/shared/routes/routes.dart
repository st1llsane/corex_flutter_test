part of '../../main.dart';

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: 'home',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'all-users',
          name: 'all-users-page',
          builder: (BuildContext context, GoRouterState state) {
            return const AllUsersPage();
          },
        ),
      ],
    ),
    GoRoute(
      path: '/user-details',
      name: 'user-details-page',
      builder: (BuildContext context, GoRouterState state) {
        final userId = state.uri.queryParameters['userId']!;

        return UserDetailsPage(userId: userId);
      },
    ),
  ],
  errorBuilder: (context, state) {
    return const Scaffold(
      body: Center(
        child: Text('Page was not found'),
      ),
    );
  },
  // debugLogDiagnostics: true,
);
