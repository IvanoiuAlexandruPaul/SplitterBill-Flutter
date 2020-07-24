import 'package:flutter/material.dart';
import 'package:splitthebill/FirstPage.dart';
import 'package:splitthebill/SecondPage.dart';

void main() {
  runApp(BillSplitter());
}

class BillSplitter extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        primaryColor: Color(0XFFFAFAFA),
      ),
      routes: {
        '/': (BuildContext context) => MainPage(),
        '/secondPage': (BuildContext context) => SecondPage(),
      },
    );
  }
}
