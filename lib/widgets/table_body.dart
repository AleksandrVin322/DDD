import 'package:ddd/widgets/column_body.dart';
import 'package:flutter/material.dart';

class TableBody extends StatelessWidget {
  const TableBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        ColumnBody(
          text: 'text',
          flex: 1,
        ),
        ColumnBody(
          text: 'text',
          flex: 1,
        ),
        ColumnBody(
          text: 'text',
          flex: 1,
        ),
      ],
    );
  }
}
