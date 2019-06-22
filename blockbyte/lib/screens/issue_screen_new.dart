import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:blockbyte/helper/api.dart';
import 'package:blockbyte/model/land.dart';
import 'package:blockbyte/cells/cell_item_widget.dart';

class IssueScreen extends StatefulWidget {
  @override
  IssueScreenState createState() {
    return IssueScreenState();
  }
}

class IssueScreenState extends State<IssueScreen> {
  var _size = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 375,
              height: 800,
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) => CellItemWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // void _issueLand() async {
  //   var land = Land(location: _location.text, size: double.parse(_size.text));
  //   await Api().issueLand(land);
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) => new CupertinoAlertDialog(
  //       content: new Text("Offer has been sent successfully"),
  //     ),
  //   ).then((value) {
  //     Navigator.pop(context);
  //   });
  // }
}
