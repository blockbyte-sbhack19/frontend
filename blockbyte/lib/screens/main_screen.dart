import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:blockbyte/screens/issue_screen_new.dart';
import 'package:blockbyte/screens/leaser_screen.dart';

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
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 61, 146, 86),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(19, 0, 0, 0),
                      offset: Offset(0, 2),
                      blurRadius: 38,
                    ),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
                child: Card(
                  child: Center(
                      child: Text(
                    "Lender",
                    style: TextStyle(fontSize: 64.0),
                  )),
                ),
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
              height: 300,
              child: Card(
                child: Center(
                    child: Text(
                  "Leaser",
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
