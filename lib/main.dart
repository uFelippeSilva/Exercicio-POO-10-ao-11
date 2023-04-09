import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _rows = [
    ['La Fin Du Monde', 'Bock', '65'],
    ['Sapporo Premium', 'Sour Ale', '54'],
    ['Duvel', 'Pilsner', '82'],
    ['Kronenbourg 1664:', 'Lager', '25'],
    ['Leffe Blonde', 'Belgian Pilsner', '25'],
    ['Fischer Tradition', 'Pale Lager', '22'],
    ['Bellerose Bière Blonde Extra', 'Belgian Strong Pale Ale', '30'],
    ['Meteor Lager', 'Lager', '22'],
    ['Jenlain Bière de Garde', 'Belgian Strong Ale', '25'],
  ];

  List<bool> _selected = List<bool>.generate(9, (index) => false);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cervejas',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Cervejas'),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: DataTable(
            columns: [
              DataColumn(label: Text('Nome')),
              DataColumn(label: Text('Estilo')),
              DataColumn(label: Text('IBU')),
            ],
            rows: _rows
                .map((rowData) => DataRow(
                      selected: _selected[_rows.indexOf(rowData)],
                      onSelectChanged: (isSelected) {
                        setState(() {
                          _selected[_rows.indexOf(rowData)] = isSelected!;
                        });
                      },
                      cells: [
                        DataCell(Container(child: Text(rowData[0]))),
                        DataCell(Container(child: Text(rowData[1]))),
                        DataCell(Container(child: Text(rowData[2]))),
                      ],
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
