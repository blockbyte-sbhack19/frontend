import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:blockbyte/screens/issue_screen.dart';
import 'package:blockbyte/screens/search_screen.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Home"),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          new GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => IssueScreen()),
              );
            },
            child: SizedBox(
              height: 300,
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
                CupertinoPageRoute(builder: (context) => SearchScreen()),
              );
            },
            child: SizedBox(
              height: 300,
              child: Card(
                child: Center(
                    child: Text(
                  "Borrower",
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
