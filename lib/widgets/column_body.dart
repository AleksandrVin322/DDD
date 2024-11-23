import 'package:flutter/material.dart';

class ColumnBody extends StatelessWidget {
  final int flex;
  final String text;
  const ColumnBody({
    super.key,
    required this.flex,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(text),
          )
        ],
      ),
    );
  }
}
