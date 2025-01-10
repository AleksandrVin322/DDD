import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

var featch1 = Featch(
    anal: 'Info Anal_1', dev: 'Info Dev_1', test: 'Info Test_1', name: '1');
var featch2 = Featch(
    anal: 'Info Anal_2', dev: 'Info Dev_2', test: 'Info Test_2', name: '2');
var featch3 = Featch(
    anal: 'Info Anal_3', dev: 'Info Dev_3', test: 'Info Test_3', name: '3');
var featch4 = Featch(
    anal: 'Info Anal_4', dev: 'Info Dev_4', test: 'Info Test_4', name: '4');
List<Featch> listFeatch = [featch1, featch2, featch3, featch4];

class _MainScreenState extends State<MainScreen> {
  int flexAnal = 1;
  int flexDev = 1;
  int flexTest = 1;
  int i = 0;
  String nameFeatch = 'Featch #1';

  void changeFeatch(int index) {
    i = index;
    nameFeatch = 'Featch #${listFeatch[index].name}';
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

  final controllerAnal = TextEditingController();
  final controllerDev = TextEditingController();
  final controllerTest = TextEditingController();
  final controllerName = TextEditingController();

  void saveFeatch() {
    var textAnal = controllerAnal.text;
    var textDev = controllerDev.text;
    var textTest = controllerTest.text;
    var textName = controllerName.text;
    var featch =
        Featch(anal: textAnal, dev: textDev, test: textTest, name: textName);
    listFeatch.add(featch);
    setState(() {});
    controllerAnal.text = '';
    controllerDev.text = '';
    controllerTest.text = '';
    controllerName.text = '';
    Navigator.of(context).pop();
  }

  alert(context) => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Center(
            child: Text('Create new featch'),
          ),
          content: Column(
            children: [
              SizedBox(height: 20),
              Text('Name featch'),
              TextField(controller: controllerName),
              SizedBox(height: 20),
              Text('Anal'),
              Row(
                children: [
                  Expanded(child: TextField(controller: controllerAnal)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.add))
                ],
              ),
              SizedBox(height: 20),
              Text('Dev'),
              Row(
                children: [
                  Expanded(child: TextField(controller: controllerDev)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.add))
                ],
              ),
              SizedBox(height: 20),
              Text('Test'),
              Row(
                children: [
                  Expanded(child: TextField(controller: controllerTest)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.add))
                ],
              ),
            ],
          ),
          actions: [
            TextButton(onPressed: saveFeatch, child: Text('Save')),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancel'))
          ],
        ),
      );

  void replaceFlexAll() {
    flexAnal = flexDev = flexTest = 1;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          IconButton(onPressed: replaceFlexAll, icon: Icon(Icons.replay)),
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
                          child: Text('Featch #${listFeatch[index].name}'));
                    },
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        deleteCurrentFeatch(i);
                      },
                      icon: Icon(Icons.delete),
                    ),
                    IconButton(
                      onPressed: () {
                        alert(context);
                      },
                      icon: Icon(Icons.plus_one),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.recycling),
                    ),
                  ],
                ),
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
            flex: 14,
            child: Row(
              children: [
                Expanded(
                  flex: flexAnal,
                  child: Column(
                    children: [
                      flexAnal == 1 && flexDev == 20 && flexTest == 20
                          ? IconButton(
                              onPressed: changeFlexAnal,
                              icon: Icon(Icons.analytics))
                          : TextButton(
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
                      flexAnal == 20 && flexDev == 1 && flexTest == 20
                          ? IconButton(
                              onPressed: changeFlexDev,
                              icon: Icon(Icons.developer_board))
                          : TextButton(
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
                      flexAnal == 20 && flexDev == 20 && flexTest == 1
                          ? IconButton(
                              onPressed: changeFlexDev,
                              icon: Icon(Icons.article))
                          : TextButton(
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
    );
  }
}

class Featch {
  late String anal;
  late String dev;
  late String test;
  late String name;

  Featch({
    required this.anal,
    required this.dev,
    required this.test,
    required this.name,
  });
}
