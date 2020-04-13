import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invoice_detect_app/inputRow.dart';

///主頁面，會用一個Scaffold物件來包裝裡面的畫面構成
class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Padding(
        padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
        child: appPanel,
      ),
    );
  }
}

///APP Banner
final appBar = AppBar(
  title: Text('OOO年OO-OO月發票號碼總覽'),
  backgroundColor: Colors.grey[700],
);

///APP Panel
final appPanel = ListView(
  children: <Widget>[
    inputRow,
    invoiceList,
  ],
);

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
