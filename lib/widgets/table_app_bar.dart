import 'package:ddd/widgets/column_app_bar.dart';
import 'package:flutter/material.dart';

class TableAppBar extends StatelessWidget {
  const TableAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        ColumnAppBar(
          text: 'Аналитика',
          color: Colors.white,
          flex: 1,
        ),
        ColumnAppBar(
          text: 'Разработка',
          color: Colors.white,
          flex: 1,
        ),
        ColumnAppBar(
          text: 'Тестирование',
          color: Colors.white,
          flex: 1,
        ),
      ],
    );
  }
}
