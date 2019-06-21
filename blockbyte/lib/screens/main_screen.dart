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
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CupertinoButton(
              child: Text("Issue Soil"),
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => IssueScreen()),
                );
              },
            ),
            CupertinoButton(
              child: Text("Search Soil"),
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => SearchScreen()),
                );
              },),
          ],
        ),
      ),
    );
  }
}
