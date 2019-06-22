import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:blockbyte/helper/api.dart';
import 'package:blockbyte/model/land.dart';

class IssueScreen extends StatefulWidget {
  @override
  IssueScreenState createState() {
    return IssueScreenState();
  }
}

class IssueScreenState extends State<IssueScreen> {
  var _location = TextEditingController(text: "");
  var _size = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Issue Land"),
      ),
      child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  children: <Widget>[
                    Card(
                        child: Column(
                      children: <Widget>[
                        Text("Location"),
                        ListTile(
                          leading: Text("GPS"),
                          title: CupertinoTextField(
                            controller: _location,
                            placeholder: "Location",
                          ),
                        ),
                        ListTile(
                          leading: Text("Size"),
                          title: CupertinoTextField(
                            controller: _size,
                            placeholder: "Size",
                          ),
                        )
                      ],
                    ))
                  ],
                ),
              ),
              CupertinoButton(
                child: Text("Send offer"),
                onPressed: _issueLand,
              )
            ],
          )),
    );
  }

  void _issueLand() async {
    var land = Land(location: _location.text, size: double.parse(_size.text));
    await Api().issueLand(land);
    showDialog(
      context: context,
      builder: (BuildContext context) => new CupertinoAlertDialog(
        content: new Text("Offer has been sent successfully"),
      ),
    ).then((value) {
      Navigator.pop(context);
    });
  }
}
