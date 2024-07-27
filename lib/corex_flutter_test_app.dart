import 'package:corex_flutter_test/api/bloc/user_post/favorite/favorite_user_post_bloc.dart';
import 'package:corex_flutter_test/api/bloc/user_post/hidden/hidden_user_post_bloc.dart';
import 'package:corex_flutter_test/shared/routes/routes.dart';
import 'package:corex_flutter_test/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CorexFlutterTestApp extends StatelessWidget {
  const CorexFlutterTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FavoriteUserPostBloc>(
          create: (BuildContext context) => FavoriteUserPostBloc(),
        ),
        BlocProvider<HiddenUserPostBloc>(
          create: (BuildContext context) => HiddenUserPostBloc(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Corex Flutter Test',
        debugShowCheckedModeBanner: false,
        theme: darkTheme,
        routerConfig: routes,
      ),
    );

    // return BlocProvider<FavoriteUserPostBloc>(
    //   create: (context) => FavoriteUserPostBloc(),
    //   child: MaterialApp.router(
    //     title: 'Corex Flutter Test',
    //     debugShowCheckedModeBanner: false,
    //     theme: darkTheme,
    //     routerConfig: routes,
    //   ),
    // );
  }
}
