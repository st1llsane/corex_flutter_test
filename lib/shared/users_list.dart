import 'package:corex_flutter_test/api/bloc/user/user_bloc.dart';
import 'package:corex_flutter_test/shared/models/user/user.dart';
import 'package:corex_flutter_test/shared/types/types.dart';
import 'package:corex_flutter_test/shared/ui/my_circular_progress_indicator.dart';
import 'package:corex_flutter_test/shared/ui/my_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class UsersList extends StatefulWidget {
  final UserBloc userBloc;
  final int? userCountToDisplay;
  final Axis? direction;
  final ItemType? itemsType;

  const UsersList({
    super.key,
    required this.userBloc,
    this.userCountToDisplay,
    this.direction = Axis.vertical,
    this.itemsType = ItemType.text,
  });

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      bloc: widget.userBloc,
      builder: (context, state) {
        final ThemeData theme = Theme.of(context);

        if (state is UsersLoaded) {
          List<User> usersList = state.users;

          if (usersList.isEmpty) {
            return Center(
              child: Text(
                'Users were not found.',
                style: theme.textTheme.bodyLarge,
              ),
            );
          }

          if (widget.direction == Axis.vertical) {
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
                    itemCount: widget.userCountToDisplay ?? usersList.length,
                    itemBuilder: (context, index) {
                      final bool isLastItem = index <
                          ((widget.userCountToDisplay ?? usersList.length) - 1);

                      return Padding(
                        padding: !isLastItem
                            ? const EdgeInsets.only(bottom: 0)
                            : const EdgeInsets.only(bottom: 10),
                        child: widget.itemsType == ItemType.text
                            ? Text(
                                '${index + 1}. ${usersList[index].name}',
                                style: theme.textTheme.bodyMedium,
                              )
                            : MyOutlinedButton(
                                onPressed: () => context.go(
                                    '/user-details?userId=${usersList[index].id}'),
                                text: '${index + 1}. ${usersList[index].name}',
                              ),
                      );
                    },
                  ),
                ),
              ),
            );
          } else {
            return ScrollbarTheme(
              data: theme.scrollbarTheme,
              child: Scrollbar(
                controller: scrollController,
                scrollbarOrientation: ScrollbarOrientation.bottom,
                thumbVisibility: true,
                trackVisibility: true,
                radius: const Radius.circular(4),
                child: SingleChildScrollView(
                  controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: List.generate(
                        widget.userCountToDisplay ?? usersList.length,
                        (index) {
                          final bool isLastItem = index <
                              ((widget.userCountToDisplay ?? usersList.length) -
                                  1);

                          return Padding(
                            padding: isLastItem
                                ? const EdgeInsets.only(right: 15)
                                : const EdgeInsets.only(right: 2),
                            child: widget.itemsType == ItemType.text
                                ? Text(
                                    '${index + 1}. ${usersList[index].name}',
                                    style: theme.textTheme.bodyMedium,
                                  )
                                : MyOutlinedButton(
                                    onPressed: () => context.go(
                                        '/user-details?userId=${usersList[index].id}'),
                                    text:
                                        '${index + 1}. ${usersList[index].name}',
                                  ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
        }

        if (state is UsersLoadingError) {
          return Center(
            child: Column(
              children: [
                Text(
                  'Error when loading users. Please, try again later.',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: Colors.red.shade600,
                  ),
                ),
                const SizedBox(height: 15),
                MyOutlinedButton(
                  text: 'Try again',
                  onPressed: () => widget.userBloc.add(LoadUsers()),
                ),
              ],
            ),
          );
        }

        return const MyCircularProgressIndicator();
      },
    );
  }
}
