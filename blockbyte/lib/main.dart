import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'helper/api.dart';
import 'package:blockbyte/model/soil.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _body = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
