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
  bool readTest = true;
  bool readDev = true;
  bool readAnal = true;

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
  final controllerTestUpdate = TextEditingController();
  final controllerDevUpdate = TextEditingController();
  final controllerAnalUpdate = TextEditingController();

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

  void updateInfoTest() {
    controllerTestUpdate.text = '${listFeatch[i].test}';
    readTest = false;
    setState(() {});
  }

  void updateInfoDev() {
    controllerDevUpdate.text = '${listFeatch[i].dev}';
    readDev = false;
    setState(() {});
  }

  void updateInfoAnal() {
    controllerAnalUpdate.text = '${listFeatch[i].anal}';
    readAnal = false;
    setState(() {});
  }

  void saveInfoTest() {
    String text = controllerTestUpdate.text;
    listFeatch[i].test = text;
    readTest = true;
    setState(() {});
  }

  void saveInfoDev() {
    String text = controllerDevUpdate.text;
    listFeatch[i].dev = text;
    readDev = true;
    setState(() {});
  }

  void saveInfoAnal() {
    String text = controllerAnalUpdate.text;
    listFeatch[i].anal = text;
    readAnal = true;
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
                  style: TextStyle(fontSize: 28),
                ),
                Container(
                  height: 1,
                  color: Colors.black,
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        alert(context);
                      },
                      icon: Icon(Icons.add_box),
                    ),
                    IconButton(
                      onPressed: () {
                        deleteCurrentFeatch(i);
                      },
                      icon: Icon(Icons.delete),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                          IconButton(
                              onPressed: updateInfoAnal,
                              icon: Icon(Icons.replay))
                        ],
                      ),
                      Container(
                        height: 1,
                        color: Colors.black,
                      ),
                      readAnal
                          ? Expanded(
                              child: ListView(
                                children: [
                                  Center(
                                    child: Text('${listFeatch[i].anal}'),
                                  )
                                ],
                              ),
                            )
                          : Column(
                              children: [
                                TextField(
                                  controller: controllerAnalUpdate,
                                  maxLines: 35,
                                ),
                                IconButton(
                                    onPressed: saveInfoAnal,
                                    icon: Icon(Icons.save))
                              ],
                            )
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                          IconButton(
                              onPressed: updateInfoDev,
                              icon: Icon(Icons.replay))
                        ],
                      ),
                      Container(
                        height: 1,
                        color: Colors.black,
                      ),
                      readDev
                          ? Expanded(
                              child: ListView(
                                children: [
                                  Center(
                                    child: Text('${listFeatch[i].dev}'),
                                  )
                                ],
                              ),
                            )
                          : Column(
                              children: [
                                TextField(
                                  controller: controllerDevUpdate,
                                  maxLines: 35,
                                ),
                                IconButton(
                                    onPressed: saveInfoDev,
                                    icon: Icon(Icons.save))
                              ],
                            )
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                          IconButton(
                            onPressed: updateInfoTest,
                            icon: Icon(Icons.replay),
                          )
                        ],
                      ),
                      Container(
                        height: 1,
                        color: Colors.black,
                      ),
                      readTest
                          ? Expanded(
                              child: ListView(
                                children: [
                                  Center(
                                    child: Text('${listFeatch[i].test}'),
                                  )
                                ],
                              ),
                            )
                          : Column(
                              children: [
                                TextField(
                                  controller: controllerTestUpdate,
                                  maxLines: 35,
                                ),
                                IconButton(
                                    onPressed: saveInfoTest,
                                    icon: Icon(Icons.save))
                              ],
                            )
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
