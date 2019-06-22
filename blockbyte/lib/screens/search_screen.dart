import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:blockbyte/screens/search_result_screen.dart';

import 'package:blockbyte/helper/api.dart';
import 'package:blockbyte/model/land.dart';

class SearchScreen extends StatefulWidget {
  @override
  SearchScreenState createState() {
    return SearchScreenState();
  }
}

class SearchScreenState extends State<SearchScreen> {
  var _location = TextEditingController();
  var _size = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Search Land"),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(children: <Widget>[
          Expanded(
            child: ListView(children: <Widget>[
              Card(
                child: Column(children: <Widget>[
                  Text("Location"),
                        ListTile(
                          leading: Text("ZIP Code"),
                          title: CupertinoTextField(
                            controller: _location,
                            placeholder: "8000",
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        ListTile(
                          leading: Text("Size"),
                          title: CupertinoTextField(
                            controller: _size,
                            placeholder: "1000",
                            keyboardType: TextInputType.number,
                          ),
                        )
                ]),
              )
            ]),
          ),
          CupertinoButton(
              onPressed: () {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => SearchResultScreen()));
              },
              child: Text("Search"),
            )
        ]),
      ),
    );
  }
}
