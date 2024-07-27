import 'package:flutter/material.dart';

List<Widget> buildColumnWithGap(List<Widget> children, {double gap = 12}) {
  List<Widget> spacedChildren = [];

  for (int i = 0; i < children.length; i++) {
    spacedChildren.add(children[i]);

    if (i < children.length - 1) {
      spacedChildren.add(
        SizedBox(height: gap),
      );
    }
  }

  return spacedChildren;
}
