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
  var _coordinate = TextEditingController(text: "");
  var _landSize = TextEditingController(text: "");

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
                          leading: Text("ZIP Code"),
                          title: CupertinoTextField(
                            controller: _coordinate,
                            placeholder: "8000",
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        ListTile(
                          leading: Text("Size"),
                          title: CupertinoTextField(
                            controller: _landSize,
                            placeholder: "1000",
                            keyboardType: TextInputType.number,
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
    var land = Land(coordinate: _coordinate.text, landSize: double.parse(_landSize.text));
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
