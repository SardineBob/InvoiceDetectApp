import 'package:flutter/material.dart';
import 'package:invoice_detect_app/page.dart';

/// 這是進入點
void main() => runApp(App());

/// 主要APP本體框架，回傳MaterialApp widget
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '發票保險箱',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
