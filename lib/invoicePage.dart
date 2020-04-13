import 'dart:async';
import 'package:flutter/material.dart';

///發票頁面一個具有狀態管理的Widget
class InvoicePage extends StatefulWidget {
  InvoceState stateWidget;
  @override
  State<StatefulWidget> createState() {
    stateWidget = InvoceState();
    return stateWidget;
  }

  //主要是開放給對外來呼叫
  void pushInvoice() => stateWidget.pushInvoice();
}

///發票頁面狀態管理器
class InvoceState extends State<InvoicePage> {
  //發票清單狀態
  List<Widget> invoceList = [];
  //成立一個針對發票清單狀態更新UI的資料流
  final StreamController<List<Widget>> invoceListStream = StreamController();

  //相當於render
  @override
  Widget build(BuildContext context) {
    return getInvoceList(invoceListStream.stream, invoceList);
  }

  @override
  void dispose() {
    //關閉資料流
    invoceListStream.close();
    super.dispose();
  }

  //新增一筆發票動作
  void pushInvoice() {
    debugPrint('click');
    invoceList.add(getInvoiceItem(Icons.note, '1234567890'));
  }
}

/// get invoce list UI
Widget getInvoceList(Stream dataStream, List<Widget> data) {
  return StreamBuilder(
    stream: dataStream,
    initialData: data,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Center(
        child: ListView(
          shrinkWrap: true,
          children: data,
        ),
      );
    },
  );
}

/// get invoce item
Card getInvoiceItem(icon, text) {
  return Card(
    child: ListTile(
      leading: Icon(icon),
      title: Text(text, style: TextStyle(fontSize: 40)),
    ),
  );
}
