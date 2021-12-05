import 'package:custom_radio_group_list/custom_radio_group_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Radio Group',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RadioGroupListView(title: 'Flutter Radio group list view'),
    );
  }
}

class RadioGroupListView extends StatefulWidget {
  const RadioGroupListView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<RadioGroupListView> createState() => _RadioGroupListViewState();
}

class _RadioGroupListViewState extends State<RadioGroupListView> {
  List<String> stringList = [
    'String 1',
    'String 2',
    'String 3',
    'String 4',
    'String 5',
    'String 7',
    'String 8'
  ];
  List<Map<dynamic, dynamic>> sampleList = [];

  @override
  void initState() {
    super.initState();
    sampleList.add(SampleData(data: 'Object1 ', id: '1').toJson());
    sampleList.add(SampleData(data: 'Object2 ', id: '2').toJson());
    sampleList.add(SampleData(data: 'Object3 ', id: '3').toJson());
    sampleList.add(SampleData(data: 'Object4 ', id: '4').toJson());
    sampleList.add(SampleData(data: 'Object5 ', id: '5').toJson());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'String based radio button',
            ),
            const SizedBox(
              height: 10,
            ),
            RadioGroup(
              radioList: stringList,
              onChanged: (value) {
                // print('Value : $value');
                final snackBar = SnackBar(content: Text("Data : $value"));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              selectedItem: 3,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Object based radio button',
            ),
            const SizedBox(
              height: 10,
            ),
            RadioGroup(
              radioListObject: sampleList,
              selectedItem: 1,
              textParameterName:
                  'data', // String parameter value is to be displayed in list
              onChanged: (value) {
                // print('Value : ${value}');
                SampleData selectedObject = SampleData.fromJson(value);

                final snackBar =
                    SnackBar(content: Text("Data : ${selectedObject.data}"));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Disabled selection of any button',
            ),
            const SizedBox(
              height: 10,
            ),
            RadioGroup(
              radioList: stringList,
              onChanged: (value) {
                print('Value : $value');
              },
              selectedItem: 3,
              disabled:
                  true, // set this to true to make list disabled for selection
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class SampleData {
  String? id;
  String? data;

  SampleData({required this.id, required this.data});

  SampleData.fromJson(Map<String, dynamic> json) {
    id = json['id']!;
    data = json['data'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['data'] = this.data;
    return data;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
