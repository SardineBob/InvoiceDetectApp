import 'package:flutter/material.dart';
import 'package:invoice_detect_app/inputRow.dart';
import 'package:invoice_detect_app/invoicePage.dart';
//import 'package:invoice_detect_app/invoiceList.dart';

///主頁面，會用一個Scaffold物件來包裝裡面的畫面構成
class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Padding(
        padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
        //child: appPanel,
        child: appP(),
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
    //invoiceList,
    InvoicePage(),
  ],
);

Widget appP() {
  var invoicePage = InvoicePage();
  return ListView(
    children: <Widget>[
      Input(pressFunc: invoicePage.pushInvoice),
      invoicePage,
    ],
  );
}
