import 'package:ddd/widgets/feach.dart';
import 'package:ddd/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

import '../widgets/main_table.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Center(
            child: Text('Текущая фича'),
          ),
        ),
        drawer: const MainDrawer(),
        backgroundColor: Colors.blue,
        body: const Row(
          children: [
            SizedBox(
              width: 200,
              child: Fetch(),
            ),
            Expanded(
              child: MainTable(),
            ),
          ],
        ),
      ),
    );
  }
}
