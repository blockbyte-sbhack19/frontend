import 'package:blockbyte/screens/issue_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:blockbyte/helper/api.dart';
import 'package:blockbyte/model/soil.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  String _body = "";

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
            Text(
              _body,
            ),
            CupertinoButton(
              onPressed: _getSoil,
              child: Text("Get Soil"),
            ),
          ],
        ),
      ),
    );
  }

  void _getSoil() async {
    List<Soil> soil = await Api().getSoil();
    setState(() {
      _body = soil[0].location;
    });
  }
}
