import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IssueScreen extends StatefulWidget {
  @override
  IssueScreenState createState() {
    return IssueScreenState();
  }
}

class IssueScreenState extends State<IssueScreen> {
  // final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Issue Soil"),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CupertinoTextField(
              controller: TextEditingController(text: "test"),
            ),
            CupertinoButton(
              child: Text("test"),
            )
          ],
        ),
      ),
    );
  }
}
