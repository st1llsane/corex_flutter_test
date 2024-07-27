import 'package:corex_flutter_test/api/bloc/user/user_bloc.dart';
import 'package:corex_flutter_test/api/repos/user/abstract_user_repo.dart';
import 'package:corex_flutter_test/shared/container_with_scrollbar.dart';
import 'package:corex_flutter_test/shared/error_message.dart';
import 'package:corex_flutter_test/shared/models/user/user.dart';
import 'package:corex_flutter_test/shared/ui/my_circular_progress_indicator.dart';
import 'package:corex_flutter_test/shared/ui/my_title.dart';
import 'package:corex_flutter_test/shared/ui/my_underlined_button.dart';
import 'package:corex_flutter_test/shared/utils/build_column_with_dynamic_content.dart';
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
        const MyTitle(text: 'User Details'),
        Expanded(
          child: BlocBuilder<UserBloc, UserState>(
            bloc: userBloc,
            builder: (context, state) {
              if (state is UserByIdLoaded) {
                final User user = state.user;

                return ContainerWithScrollbar(
                  scrollController: scrollController,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: ListView(
                      controller: scrollController,
                      children: buildColumnWithDynamicContent({
                        'Name': user.name,
                        'Username': user.username,
                        'Email': user.email,
                        'Address': user.address,
                        'Phone': user.phone,
                        'Website': user.website,
                        'Company': user.company,
                      }),
                    ),
                  ),
                );
              }

              if (state is UserByIdLoadingError) {
                return ErrorMessage(
                  message: 'Error when loading users. Please, try again later.',
                  onPressed: () =>
                      userBloc.add(LoadUserById(userId: widget.userId)),
                );
              }

              return const MyCircularProgressIndicator();
            },
          ),
        ),
        const SizedBox(height: 20),
        MyUnderlinedButton(
          onPressed: () => context.pop(),
          text: 'All Users',
          icon: Icons.arrow_back_ios,
          iconAlignment: IconAlignment.start,
        ),
        const SizedBox(height: 20),
        MyUnderlinedButton(
          onPressed: () => context.go('/'),
          text: 'On Home Page',
          icon: Icons.arrow_back_ios,
          iconAlignment: IconAlignment.start,
        ),
      ],
    );
  }
}
