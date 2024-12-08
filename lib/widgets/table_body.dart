import 'package:ddd/bloc/flex_anal/flex_anal_bloc.dart';
import 'package:ddd/bloc/flex_dev/flex_dev_bloc.dart';
import 'package:ddd/bloc/flex_test/flex_test_bloc.dart';
import 'package:ddd/database/database.dart';
import 'package:ddd/widgets/column_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        BlocBuilder<FlexAnalBloc, int>(
          builder: (context, state) {
            return ColumnBody(
              text: listFetch.listFetch[0].anal,
              flex: state,
            );
          },
        ),
        BlocBuilder<FlexDevBloc, int>(
          builder: (context, state) {
            return ColumnBody(
              text: listFetch.listFetch[0].dev,
              flex: state,
            );
          },
        ),
        BlocBuilder<FlexTestBloc, int>(
          builder: (context, state) {
            return ColumnBody(
              text: listFetch.listFetch[0].test,
              flex: state,
            );
          },
        ),
      ],
    );
  }
}
