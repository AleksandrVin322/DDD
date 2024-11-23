import 'package:ddd/widgets/table_app_bar.dart';
import 'package:ddd/widgets/table_body.dart';
import 'package:flutter/material.dart';

class MainTable extends StatelessWidget {
  const MainTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(
          child: TableAppBar(),
        ),
        Expanded(
          flex: 20,
          child: TableBody(),
        ),
      ],
    );
  }
}
