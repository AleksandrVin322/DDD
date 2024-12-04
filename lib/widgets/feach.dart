import 'package:flutter/material.dart';

class Fetch extends StatelessWidget {
  const Fetch({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          style: const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.white),
          ),
          onPressed: () {},
          child: const Text('фича 1'),
        ),
        const SizedBox(height: 20),
        TextButton(
          style: const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.white),
          ),
          onPressed: () {},
          child: const Text('фича 2'),
        ),
        const SizedBox(height: 20),
        TextButton(
          style: const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.white),
          ),
          onPressed: () {},
          child: const Text('фича 3'),
        ),
      ],
    );
  }
}
