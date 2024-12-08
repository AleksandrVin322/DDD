import 'package:ddd/bloc/flex_anal/flex_anal_bloc.dart';
import 'package:ddd/bloc/flex_dev/flex_dev_bloc.dart';
import 'package:ddd/bloc/flex_test/flex_test_bloc.dart';
import 'package:ddd/widgets/feach.dart';
import 'package:ddd/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/main_table.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => FlexAnalBloc(),
          ),
          BlocProvider(
            create: (context) => FlexDevBloc(),
          ),
          BlocProvider(
            create: (context) => FlexTestBloc(),
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey,
            title: const Center(
              child: Text('хуй'),
            ),
          ),
          drawer: const MainDrawer(),
          backgroundColor: Colors.white,
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
      ),
    );
  }
}
