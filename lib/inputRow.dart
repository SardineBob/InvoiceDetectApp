import 'package:flutter/material.dart';

///APP InputRow
final inputRow = Row(
  children: <Widget>[
    Expanded(child: inputBox, flex: 8),
    Expanded(child: inputButton, flex: 1),
  ],
);

///APP TextBox
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

///Done Button
final inputButton = Ink(
  decoration: ShapeDecoration(
    shape: CircleBorder(),
    color: Colors.grey[700],
  ),
  child: IconButton(
    icon: Icon(Icons.done),
    color: Colors.white,
    onPressed: () => {debugPrint('erwer')},
  ),
);
