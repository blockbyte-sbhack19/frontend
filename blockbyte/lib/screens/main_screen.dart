import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:blockbyte/screens/lender_screen.dart';
import 'package:blockbyte/screens/leaser_screen.dart';
import 'package:blockbyte/screens/result_screen.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          new GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => LenderScreen()),
              );
            },
            child: SizedBox(
              height: 100,
              child: Card(
                child: Center(
                    child: Text(
                  "Lender",
                  style: TextStyle(fontSize: 64.0),
                )),
              ),
            ),
          ),
          new GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => LeaserScreen()),
              );
            },
            child: SizedBox(
              height: 100,
              child: Card(
                child: Center(
                    child: Text(
                  "Leaser",
                  style: TextStyle(fontSize: 64.0),
                )),
              ),
            ),
          ),
          new GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => ResultScreen()),
              );
            },
            child: SizedBox(
              height: 100,
              child: Card(
                child: Center(
                    child: Text(
                  "Result",
                  style: TextStyle(fontSize: 64.0),
                )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
