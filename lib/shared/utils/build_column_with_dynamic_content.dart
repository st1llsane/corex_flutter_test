import 'package:corex_flutter_test/shared/utils/build_column_with_gap.dart';
import 'package:flutter/material.dart';

List<Widget> buildColumnWithDynamicContent(Map<String, dynamic> data,
    {double nestedGap = 20}) {
  List<Widget> widgets = [];

  data.forEach((key, value) {
    final capitalizedKey = key[0].toUpperCase() + key.substring(1);

    if (value is String || value is num || value is bool) {
      widgets.add(Text('$capitalizedKey: $value'));
    } else if (value is Map<String, dynamic>) {
      widgets.add(Text('$capitalizedKey:'));
      widgets.add(
        Padding(
          padding: EdgeInsets.only(left: nestedGap),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: buildColumnWithDynamicContent(value),
          ),
        ),
      );
    }
  });

  return buildColumnWithGap(widgets);
}
