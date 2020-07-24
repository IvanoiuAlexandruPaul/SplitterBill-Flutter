import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 250.0,
            ),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 80.0,
                  ),
                  Text(
                    'BILL',
                    style: TextStyle(
                      fontFamily: 'BabesNeue',
                      fontSize: 90,
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'SPLITTER',
                    style: TextStyle(
                      fontFamily: 'BabesNeue',
                      fontSize: 80,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 200.0,
            ),
            Flexible(
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 340,
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/secondPage');
                    },
                    child: Text(
                      'GO',
                      style: TextStyle(
                        fontFamily: 'BabesNeue',
                        fontSize: 60,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
