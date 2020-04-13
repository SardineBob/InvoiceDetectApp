import 'dart:async';
import 'package:flutter/material.dart';

final StreamController ctrl = StreamController();

class InvoicePage extends StatefulWidget {
  Test obj;
  @override
  State<StatefulWidget> createState() {
    obj = new Test();
    return obj;
  }

  void add1() {
    obj.s
  }
}

class Test extends State<InvoicePage> {
  int cnt = 0;
  final StreamController<int> streamC = StreamController<int>();

  @override
  void dispose() {
    debugPrint('close');
    streamC.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
        stream: streamC.stream,
        initialData: cnt,
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          debugPrint(context.toString());
          return ListView(
            shrinkWrap: true,
            children: <Widget>[
              getListItem(Icons.note, cnt.toString()),
            ],
          );
        });
  }

/*ListView(
        shrinkWrap: true,
        children: <Widget>[
          //getListItem(Icons.note, cnt.toString()),
        ],
      ),*/

  void add() {
    /*setState(() {
      cnt++;
    });*/
    //streamC.sink.add(cnt++);
    cnt++;
  }
}

///APP List
final invoiceList = Center(
  child: ListView(
    shrinkWrap: true,
    children: <Widget>[
      getListItem(Icons.note, '1234567890'),
      getListItem(Icons.cloud, '4543674577'),
      getListItem(Icons.note, '7648574637'),
    ],
  ),
);

/// APP List Item
Card getListItem(icon, text) {
  return Card(
    child: ListTile(
      leading: Icon(icon),
      title: Text(text, style: TextStyle(fontSize: 40)),
    ),
  );
}
