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
  void pushInvoice(IconData icon, String number) =>
      stateWidget.pushInvoice(icon, number);
}

///發票頁面狀態管理器
class InvoceState extends State<InvoicePage> {
  //發票清單狀態
  List<Widget> invoceList = [];
  //成立一個針對發票清單狀態更新UI的資料流
  final StreamController<List<Widget>> invoiceListStream = StreamController();

  //相當於render
  @override
  Widget build(BuildContext context) {
    return getInvoceList(invoiceListStream.stream, invoceList);
  }

  @override
  void dispose() {
    //關閉資料流
    invoiceListStream.close();
    super.dispose();
  }

  //新增一筆發票動作
  void pushInvoice(IconData icon, String number) {
    //針對陣列觸發render的時候，要做一個陣列記憶體位置異動機制，render才會觸發
    invoceList.add(getInvoiceItem(icon, number));
    invoceList = List.from(invoceList);
    //新值更新，通知render
    invoiceListStream.sink.add(invoceList);
  }
}

/// get invoce list UI
Widget getInvoceList(Stream dataStream, List<Widget> data) {
  return StreamBuilder(
    stream: dataStream,
    initialData: data, //初始資料
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Center(
        child: ListView(
          shrinkWrap: true,
          children: snapshot.data, //綁定StreamController到時候sink進來的新資料來源
        ),
      );
    },
  );
}

/// get invoce item
Card getInvoiceItem(IconData icon, String text) {
  return Card(
    child: ListTile(
      leading: Icon(icon),
      title: Text(text, style: TextStyle(fontSize: 40)),
    ),
  );
}
