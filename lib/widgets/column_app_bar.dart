import 'package:ddd/bloc/app_bloc.dart';
import 'package:flutter/material.dart';

class ColumnAppBar extends StatelessWidget {
  final _appBloc = AppBloc();
  final String text;
  final Color color;
  final int flex;
  ColumnAppBar({
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
              _appBloc.add(AppEvent());
            },
            child: Text(text),
          ),
        ),
      ),
    );
  }
}
