import 'package:corex_flutter_test/api/bloc/user/user_bloc.dart';
import 'package:corex_flutter_test/api/repos/user/abstract_user_repo.dart';
import 'package:corex_flutter_test/shared/models/user/user.dart';
import 'package:corex_flutter_test/shared/ui/my_circular_progress_indicator.dart';
import 'package:corex_flutter_test/shared/ui/my_outlined_button.dart';
import 'package:corex_flutter_test/shared/ui/my_underlined_button.dart';
import 'package:corex_flutter_test/shared/utils/build_column_with_gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class UserDetailsPage extends StatefulWidget {
  final String userId;

  const UserDetailsPage({
    super.key,
    required this.userId,
  });

  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  final userBloc = UserBloc(GetIt.I<AbstractUserRepo>());
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();

    scrollController = ScrollController();
    userBloc.add(LoadUserById(userId: widget.userId));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyUnderlinedButton(
          icon: Icons.arrow_back_ios,
          iconAlignment: IconAlignment.start,
          text: 'All Users',
          onPressed: () => context.go('/all-users'),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: BlocBuilder<UserBloc, UserState>(
            bloc: userBloc,
            builder: (context, state) {
              final ThemeData theme = Theme.of(context);

              if (state is UserByIdLoaded) {
                final User user = state.user;

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
                      child: ListView(
                        controller: scrollController,
                        children: buildColumnWithGap([
                          Text('ID: ${user.id}'),
                          Text('Name: ${user.name}'),
                          Text('Username: ${user.username}'),
                          Text('Email: ${user.email}'),
                          const Text('Adress: '),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: buildColumnWithGap(
                                user.address.entries.map((entry) {
                                  final capitalizedKey =
                                      entry.key[0].toUpperCase() +
                                          entry.key.substring(1);

                                  return Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text(
                                      '$capitalizedKey: ${entry.value}',
                                    ),
                                  );
                                }).toList(),
                                10),
                          ),
                          Text('Adress: ${user.address.length}'),
                          Text('Phone: ${user.phone}'),
                          Text('Website: ${user.website}'),
                          const Text('Company: '),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: buildColumnWithGap(
                                user.company.entries.map((entry) {
                                  final capitalizedKey =
                                      entry.key[0].toUpperCase() +
                                          entry.key.substring(1);

                                  return Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text(
                                      '$capitalizedKey: ${entry.value}',
                                    ),
                                  );
                                }).toList(),
                                10),
                          ),
                        ], 12),
                      ),
                    ),
                  ),
                );
              }

              if (state is UserByIdLoadingError) {
                return Center(
                  child: Column(
                    children: [
                      Text(
                        'Error when loading users. Please, try again later.',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: Colors.red.shade600,
                        ),
                      ),
                      const SizedBox(height: 20),
                      MyOutlinedButton(
                        text: 'Try again',
                        onPressed: () =>
                            userBloc.add(LoadUserById(userId: widget.userId)),
                      ),
                    ],
                  ),
                );
              }

              return const MyCircularProgressIndicator();
            },
          ),
        ),
        const SizedBox(height: 20),
        MyUnderlinedButton(
          icon: Icons.arrow_back_ios,
          iconAlignment: IconAlignment.start,
          text: 'On Home Page',
          onPressed: () => context.go('/'),
        ),
      ],
    );
  }
}
