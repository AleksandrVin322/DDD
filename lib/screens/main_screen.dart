import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

var featch1 =
    Featch(anal: 'Info Anal_1', dev: 'Info Dev_1', test: 'Info Test_1');
var featch2 =
    Featch(anal: 'Info Anal_2', dev: 'Info Dev_2', test: 'Info Test_2');
var featch3 =
    Featch(anal: 'Info Anal_3', dev: 'Info Dev_3', test: 'Info Test_3');
var featch4 =
    Featch(anal: 'Info Anal_4', dev: 'Info Dev_4', test: 'Info Test_4');
List<Featch> listFeatch = [featch1, featch2, featch3, featch4];

class _MainScreenState extends State<MainScreen> {
  int flexAnal = 1;
  int flexDev = 1;
  int flexTest = 1;
  int i = 0;
  String nameFeatch = 'Featch #1';

  void changeFeatch(int index) {
    i = index;
    nameFeatch = 'Featch #${index + 1}';
    setState(() {});
  }

  void changeFlexAnal() {
    if (flexAnal == 1) {
      flexAnal = 20;
      setState(() {});
    } else {
      flexAnal = 1;
      setState(() {});
    }
  }

  void changeFlexDev() {
    if (flexDev == 1) {
      flexDev = 20;
      setState(() {});
    } else {
      flexDev = 1;
      setState(() {});
    }
  }

  void changeFlexTest() {
    if (flexTest == 1) {
      flexTest = 20;
      setState(() {});
    } else {
      flexTest = 1;
      setState(() {});
    }
  }

  void deleteCurrentFeatch(int currentFeatch) {
    listFeatch.removeAt(currentFeatch);
    if (currentFeatch == listFeatch.length) {
      i = 0;
    }
    nameFeatch = 'Featch #${i + 1}';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Row(
          children: [
            /// Колонка слева с фичами
            Expanded(
              child: Column(
                children: [
                  Text(
                    nameFeatch,
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: listFeatch.length,
                      itemBuilder: (BuildContext context, int index) {
                        return TextButton(
                            onPressed: () {
                              changeFeatch(index);
                            },
                            child: Text('Featch #${index + 1}'));
                      },
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        deleteCurrentFeatch(i);
                      },
                      icon: Icon(Icons.delete)),
                ],
              ),
            ),
            Container(
              color: Colors.black,
              width: 1,
              height: double.infinity,
            ),

            /// Колонка справа с таблицей
            Expanded(
              flex: 15,
              child: Row(
                children: [
                  Expanded(
                    flex: flexAnal,
                    child: Column(
                      children: [
                        TextButton(
                            child: Text(
                              'Anal',
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 20),
                            ),
                            onPressed: changeFlexAnal),
                        Text('${listFeatch[i].anal}'),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.black,
                    width: 1,
                    height: double.infinity,
                  ),
                  Expanded(
                    flex: flexDev,
                    child: Column(
                      children: [
                        TextButton(
                            child: Text(
                              'Dev',
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 20),
                            ),
                            onPressed: changeFlexDev),
                        Text('${listFeatch[i].anal}'),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.black,
                    width: 1,
                    height: double.infinity,
                  ),
                  Expanded(
                    flex: flexTest,
                    child: Column(
                      children: [
                        TextButton(
                            child: Text(
                              'Test',
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 20),
                            ),
                            onPressed: changeFlexTest),
                        Text('${listFeatch[i].anal}'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Featch {
  late String anal;
  late String dev;
  late String test;

  Featch({
    required this.anal,
    required this.dev,
    required this.test,
  });
}
