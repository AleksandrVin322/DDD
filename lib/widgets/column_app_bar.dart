import 'package:ddd/bloc/flex_anal/flex_anal_bloc.dart';
import 'package:ddd/bloc/flex_dev/flex_dev_bloc.dart';
import 'package:ddd/bloc/flex_test/flex_test_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColumnAppBar extends StatelessWidget {
  final String text;
  final Color color;
  final int flex;

  const ColumnAppBar({
    super.key,
    required this.text,
    required this.color,
    required this.flex,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        color: color,
        child: Center(
          child: TextButton(
            onPressed: () {
              if (text == 'Аналитика') {
                BlocProvider.of<FlexAnalBloc>(context)
                    .add(FlexAnalSwitchEvent());
              }
              if (text == 'Разработка') {
                BlocProvider.of<FlexDevBloc>(context).add(FlexDevSwitchEvent());
              }
              if (text == 'Тестирование') {
                BlocProvider.of<FlexTestBloc>(context)
                    .add(FlexTestSwitchEvent());
              }
            },
            child: Text(text),
          ),
        ),
      ),
    );
  }
}
