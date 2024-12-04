import 'package:ddd/database/database.dart';
import 'package:ddd/widgets/column_body.dart';
import 'package:flutter/material.dart';

class TableBody extends StatelessWidget {
  const TableBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final listFetch = ListFetch([
      Fetch('anal 1', 'dev 1', 'test 1'),
      Fetch('anal 2', 'dev 2', 'test 2'),
      Fetch('anal 3', 'dev 3', 'test 3'),
    ]);
    return Row(
      children: [
        ColumnBody(
          text: listFetch.listFetch[0].anal,
          flex: 1,
        ),
        ColumnBody(
          text: listFetch.listFetch[0].dev,
          flex: 1,
        ),
        ColumnBody(
          text: listFetch.listFetch[0].test,
          flex: 1,
        ),
      ],
    );
  }
}
