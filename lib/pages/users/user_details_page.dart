import 'package:corex_flutter_test/api/bloc/user/user_bloc.dart';
import 'package:corex_flutter_test/api/repos/user/abstract_user_repo.dart';
import 'package:corex_flutter_test/shared/models/user/user.dart';
import 'package:corex_flutter_test/shared/page_container.dart';
import 'package:corex_flutter_test/shared/ui/my_bordered_link.dart';
import 'package:corex_flutter_test/shared/ui/my_title.dart';
import 'package:corex_flutter_test/shared/ui/my_underlined_link.dart';
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

  @override
  void initState() {
    super.initState();

    userBloc.add(LoadUserById(userId: widget.userId));
  }

  @override
  Widget build(BuildContext context) {
    return PageContainer(
      child: BlocBuilder<UserBloc, UserState>(
        bloc: userBloc,
        builder: (context, state) {
          if (state is UserByIdLoadingError) {
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
                    onPressed: () => userBloc.add(LoadUsers()),
                  ),
                ],
              ),
            );
          }

          if (state is UserByIdLoaded) {
            final User user = state.user;

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: buildColumnWithGap([
                  MyUnderlinedLink(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xFF64B5F6),
                      size: 13,
                    ),
                    iconAlignment: IconAlignment.start,
                    text: 'On Home Page',
                    onPressed: () => context.go('/'),
                  ),
                  MyUnderlinedLink(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xFF64B5F6),
                      size: 13,
                    ),
                    iconAlignment: IconAlignment.start,
                    text: 'All Users',
                    onPressed: () => context.go('/all-users'),
                  ),
                  MyTitle(text: 'Name: ${user.name}'),
                  Text('Username: ${user.username}'),
                  Text('Email: ${user.email}'),
                  const Text('Adress: '),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: buildColumnWithGap(
                        user.address.entries.map((entry) {
                          final capitalizedKey = entry.key[0].toUpperCase() +
                              entry.key.substring(1);

                          return Padding(
                            padding: const EdgeInsets.only(left: 15),
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
                          final capitalizedKey = entry.key[0].toUpperCase() +
                              entry.key.substring(1);

                          return Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              '$capitalizedKey: ${entry.value}',
                            ),
                          );
                        }).toList(),
                        10),
                  ),
                ], 10),
              ),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
