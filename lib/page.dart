import 'package:flutter/material.dart';
import 'package:invoice_detect_app/inputRow.dart';
import 'package:invoice_detect_app/invoicePage.dart';

///主頁面，會用一個Scaffold物件來包裝裡面的畫面構成
class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Padding(
        padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
        child: appPanel(),
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
Widget appPanel() {
  var invoicePage = InvoicePage();
  return ListView(
    children: <Widget>[
      InputRow(pressFunc: invoicePage.pushInvoice),
      invoicePage,
    ],
  );
}
