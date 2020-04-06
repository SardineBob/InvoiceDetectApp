import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///主頁面，會用一個Scaffold物件來包裝裡面的畫面構成
class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Padding(
        padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
        child: ListView(
          children: <Widget>[
            inputBox,
            getListItem(Icons.note, '1234567890'),
            getListItem(Icons.cloud, '4543674577'),
            getListItem(Icons.note, '7648574637'),
          ],
        ),
      ),
    );
  }
}

///APP Banner
final appBar = AppBar(
  title: Text('OOO年OO-OO月發票號碼總覽'),
  backgroundColor: Colors.grey[700],
);

///App TextBox
final inputBox = TextFormField(
  controller: TextEditingController(),
  //應該是for手機，要跳出鍵盤的種類，目前設定純數字
  keyboardType: TextInputType.number,
  //autofocus: true,
  //autovalidate: true,
  decoration: InputDecoration(
    //欄位為空時，後面透漏要輸入資訊提示
    hintText: '請輸入統一發票號碼',
    labelText: '發票號碼',
    //輸入資訊提示，這邊調整成有點透明白色
    hintStyle: TextStyle(color: Color.fromARGB(100, 255, 255, 255)),
    labelStyle: TextStyle(color: Colors.white.withAlpha(100)),
    //調整文字的位置
    contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
    //讓輸入邊框有圓角效果(適用於所有邊框樣式)
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
    //設定平常的邊框樣式
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.circular(20),
    ),
    //設定Focus時的邊框樣式
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 2),
      borderRadius: BorderRadius.circular(20),
    ),
  ),
  validator: (String value) {
    if (value == "") return "請輸入發票號碼";
    if (int.tryParse(value) == null) return "發票號碼為純數字";
    return null;
  },
);

///APP List
final invoiceList = Center(
    child: ListView(
  children: <Widget>[
    getListItem(Icons.note, '1234567890'),
    getListItem(Icons.cloud, '4543674577'),
    getListItem(Icons.note, '7648574637'),
  ],
));

/// APP List Item
Card getListItem(icon, text) {
  return Card(
    child: ListTile(
      leading: Icon(icon),
      title: Text(text, style: TextStyle(fontSize: 40)),
    ),
  );
}
