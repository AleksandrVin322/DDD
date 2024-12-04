import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blueAccent),
            child: Text('Опции с фичами'),
          ),
          Center(
            child: TextButton(
              onPressed: () {},
              child: const Text('add'),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {},
              child: const Text('delete'),
            ),
          ),
        ],
      ),
    );
  }
}
