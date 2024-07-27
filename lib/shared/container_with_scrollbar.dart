import 'package:flutter/material.dart';

class ContainerWithScrollbar extends StatelessWidget {
  final ScrollController scrollController;
  final ScrollbarOrientation? scrollbarOrientation;
  final Widget child;

  const ContainerWithScrollbar({
    super.key,
    required this.scrollController,
    this.scrollbarOrientation = ScrollbarOrientation.left,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ScrollbarTheme(
      data: theme.scrollbarTheme,
      child: Scrollbar(
        controller: scrollController,
        scrollbarOrientation: scrollbarOrientation,
        thumbVisibility: true,
        trackVisibility: true,
        radius: const Radius.circular(4),
        child: child,
      ),
    );
  }
}
