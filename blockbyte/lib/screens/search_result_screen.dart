import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:blockbyte/helper/api.dart';
import 'package:blockbyte/model/land.dart';

class SearchResultScreen extends StatefulWidget {
  @override
  SearchResultScreenState createState() {
    return SearchResultScreenState();
  }
}

class SearchResultScreenState extends State<SearchResultScreen> {
  var _location = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("Search Results"),
        ),
        child: ListView(children: <Widget>[
          Card(
            child: ListTile(
              title: Text("Test"),
            ),
          )
        ]));
  }

  void _getLand() async {
    List<Land> land = await Api().getLand();
    setState(() {
      _location.text = land[0].coordinate;
    });
  }
}
