import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:blockbyte/helper/api.dart';

import 'package:blockbyte/model/result/result.dart';
import 'package:blockbyte/model/result/result_land_all.dart';
import 'package:blockbyte/model/result/result_land.dart';
import 'package:blockbyte/model/result/result_lease.dart';
import 'package:blockbyte/model/result/result_details.dart';

class ResultScreen extends StatefulWidget {
  final Result result;

  const ResultScreen({
    @required this.result,
  }) : assert(result != null);

  @override
  ResultScreenState createState() {
    return ResultScreenState();
  }
}

class ResultScreenState extends State<ResultScreen> {
  Result _result = Result();
  final String _dateFormat = "dd/MM/yyyy";
  var _coordinate = TextEditingController(text: "47,8");
  var _landSize = TextEditingController(text: "12.52");
  var _beforeDate = DateTime.parse("2020-01-01");
  var _afterDate = DateTime.parse("2022-01-01");

  @override
  void initState() {
    super.initState();
    _result = widget.result;
  }

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
                itemBuilder: (context, index) => _cellItemWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cellItemWidget() {
    return Container(
      constraints: BoxConstraints.expand(height: 874),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 296,
              height: 47,
              margin: EdgeInsets.only(top: 11),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(left: 68),
                      child: Text(
                        "Search Results",
                        style: TextStyle(
                          color: Color.fromARGB(255, 92, 105, 121),
                          fontSize: 20,
                          fontFamily: "Lato",
                          fontWeight: FontWeight.w900,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Spacer(),
                  Opacity(
                    opacity: 0.5,
                    child: Text(
                      "See the leases which fit to your criteria.",
                      style: TextStyle(
                        color: Color.fromARGB(255, 95, 95, 95),
                        fontSize: 14,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 778,
            margin: EdgeInsets.only(left: 11, top: 15, right: 13),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 151, 84),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(40, 0, 0, 0),
                  offset: Offset(0, 2),
                  blurRadius: 38,
                ),
              ],
              borderRadius: BorderRadius.all(Radius.circular(6)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 304,
                    height: 351,
                    margin: EdgeInsets.only(top: 20, right: 21),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          height: 46,
                          margin: EdgeInsets.only(left: 16, right: 3),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  width: 44,
                                  height: 44,
                                  child: Image.asset(
                                    "assets/images/avatar.png",
                                    fit: BoxFit.none,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  width: 54,
                                  height: 34,
                                  margin: EdgeInsets.only(left: 12, top: 12),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: "B. Haller\n",
                                      contentPadding: EdgeInsets.all(0),
                                      border: InputBorder.none,
                                    ),
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontSize: 12,
                                      fontFamily: "Lato",
                                      fontWeight: FontWeight.w700,
                                    ),
                                    maxLines: 1,
                                    autocorrect: false,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  width: 128,
                                  height: 20,
                                  margin: EdgeInsets.only(top: 11),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          margin: EdgeInsets.only(right: 5),
                                          child: Text(
                                            "Overall Fit",
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              fontSize: 12,
                                              fontFamily: "Lato",
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 58,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 61, 146, 86),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(2)),
                                        ),
                                        child: Container(
                                          margin: EdgeInsets.only(top: 3),
                                          child: Text(
                                            "93%",
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              fontSize: 10,
                                              fontFamily: "SF Compact Text",
                                              fontWeight: FontWeight.w600,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 166,
                          margin: EdgeInsets.only(top: 7),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                right: 1,
                                child: Container(
                                  height: 166,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Container(
                                        height: 44,
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Positioned(
                                              left: 0,
                                              top: 0,
                                              right: 0,
                                              child: Container(
                                                height: 44,
                                                decoration: BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 255, 255, 255),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color.fromARGB(
                                                          19, 0, 0, 0),
                                                      offset: Offset(0, 2),
                                                      blurRadius: 38,
                                                    ),
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(6)),
                                                ),
                                                child: Container(),
                                              ),
                                            ),
                                            Positioned(
                                              left: 14,
                                              top: 11,
                                              right: 13,
                                              child: Container(
                                                height: 22,
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Container(
                                                        margin: EdgeInsets.only(
                                                            top: 3),
                                                        child: Text(
                                                          "Distance",
                                                          style: TextStyle(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    92,
                                                                    105,
                                                                    121),
                                                            fontSize: 14,
                                                            fontFamily: "Lato",
                                                          ),
                                                          textAlign:
                                                              TextAlign.left,
                                                        ),
                                                      ),
                                                    ),
                                                    Spacer(),
                                                    Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Container(
                                                        width: 57,
                                                        height: 22,
                                                        margin: EdgeInsets.only(
                                                            right: 9),
                                                        child: TextField(
                                                          decoration:
                                                              InputDecoration(
                                                            hintText: "20.000",
                                                            contentPadding:
                                                                EdgeInsets.all(
                                                                    0),
                                                            border: InputBorder
                                                                .none,
                                                          ),
                                                          style: TextStyle(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    37,
                                                                    37,
                                                                    37),
                                                            fontSize: 16,
                                                            fontFamily:
                                                                "Open Sans",
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                          maxLines: 1,
                                                          autocorrect: false,
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Text(
                                                        "km",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 37, 37, 37),
                                                          fontSize: 16,
                                                          fontFamily:
                                                              "Open Sans",
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        height: 58,
                                        margin: EdgeInsets.only(left: 2),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Container(
                                                width: 147,
                                                height: 58,
                                                decoration: BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 255, 255, 255),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color.fromARGB(
                                                          19, 0, 0, 0),
                                                      offset: Offset(0, 2),
                                                      blurRadius: 38,
                                                    ),
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(6)),
                                                ),
                                                child: Container(
                                                  child:
                                                      Column(children: <Widget>[Container(
          margin: EdgeInsets.only(left: 15, top: 10),
          child: Text(
            "Lease Start Date",
            style: TextStyle(
              color: Color.fromARGB(255, 156, 155, 156),
              fontSize: 12,
              fontFamily: "Lato",
            ),
            textAlign: TextAlign.left,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, top: 8),
          child: Text(
            DateFormat(_dateFormat).format(_beforeDate),
            style: TextStyle(
              color: Color.fromARGB(255, 37, 37, 37),
              fontSize: 14,
              fontFamily: "",
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.left,
          ),
        ),],)
                                                ),
                                              ),
                                            ),
                                            Spacer(),
                                            Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Container(
                                                width: 147,
                                                height: 58,
                                                decoration: BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 255, 255, 255),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color.fromARGB(
                                                          19, 0, 0, 0),
                                                      offset: Offset(0, 2),
                                                      blurRadius: 38,
                                                    ),
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(6)),
                                                ),
                                                child: Container(
                                                  child:
                                                      Column(children: <Widget>[Container(
          margin: EdgeInsets.only(left: 15, top: 10),
          child: Text(
            "Lease End Date",
            style: TextStyle(
              color: Color.fromARGB(255, 156, 155, 156),
              fontSize: 12,
              fontFamily: "Lato",
            ),
            textAlign: TextAlign.left,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, top: 8),
          child: Text(
            DateFormat(_dateFormat).format(_afterDate),
            style: TextStyle(
              color: Color.fromARGB(255, 37, 37, 37),
              fontSize: 14,
              fontFamily: "",
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.left,
          ),
        ),],)
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 1,
                                top: 54,
                                right: 0,
                                child: Container(
                                  height: 44,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromARGB(19, 0, 0, 0),
                                        offset: Offset(0, 2),
                                        blurRadius: 38,
                                      ),
                                    ],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6)),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 14),
                                        child: Text(
                                          "Size",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 92, 105, 121),
                                            fontSize: 14,
                                            fontFamily: "Lato",
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        width: 57,
                                        height: 22,
                                        margin: EdgeInsets.only(right: 3),
                                        child: TextField(
                                          decoration: InputDecoration(
                                            hintText: "20.000",
                                            contentPadding: EdgeInsets.all(0),
                                            border: InputBorder.none,
                                          ),
                                          style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 37, 37, 37),
                                            fontSize: 16,
                                            fontFamily: "Open Sans",
                                            fontWeight: FontWeight.w700,
                                          ),
                                          maxLines: 1,
                                          autocorrect: false,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(right: 8),
                                        child: Text(
                                          "hectar",
                                          style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 37, 37, 37),
                                            fontSize: 16,
                                            fontFamily: "Open Sans",
                                            fontWeight: FontWeight.w700,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 48,
                          margin: EdgeInsets.only(left: 2, top: 17, right: 1),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 147,
                                height: 48,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Text(
                                        "Preferred Crop Type\n",
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 51, 59, 69),
                                          fontSize: 14,
                                          fontFamily: "Lato",
                                          fontWeight: FontWeight.w700,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Positioned(
                                      left: 1,
                                      top: 20,
                                      child: Container(
                                        width: 146,
                                        height: 28,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: Container(
                                                width: 69,
                                                height: 28,
                                                child: FlatButton(
                                                  onPressed: () => this
                                                      .onOption2ThreePressed(
                                                          context),
                                                  color: Color.fromARGB(
                                                      255, 255, 255, 255),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  8))),
                                                  textColor: Color.fromARGB(
                                                      255, 51, 59, 69),
                                                  padding: EdgeInsets.all(0),
                                                  child: Text(
                                                    "Potato",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily: "Lato",
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: Container(
                                                width: 69,
                                                height: 28,
                                                margin:
                                                    EdgeInsets.only(left: 8),
                                                child: FlatButton(
                                                  onPressed: () => this
                                                      .onOptionThreePressed(
                                                          context),
                                                  color: Color.fromARGB(
                                                      255, 255, 255, 255),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  8))),
                                                  textColor: Color.fromARGB(
                                                      255, 51, 59, 69),
                                                  padding: EdgeInsets.all(0),
                                                  child: Text(
                                                    "Cereal",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily: "Lato",
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: 69,
                                height: 28,
                                margin: EdgeInsets.only(top: 20, right: 8),
                                child: FlatButton(
                                  onPressed: () =>
                                      this.onOption2FourPressed(context),
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                  textColor: Color.fromARGB(255, 51, 59, 69),
                                  padding: EdgeInsets.all(0),
                                  child: Text(
                                    "Corn",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "Lato",
                                      fontWeight: FontWeight.w700,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Container(
                                width: 69,
                                height: 28,
                                margin: EdgeInsets.only(top: 20),
                                child: FlatButton(
                                  onPressed: () =>
                                      this.onOptionFourPressed(context),
                                  color: Color.fromARGB(39, 168, 182, 200),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                  textColor: Color.fromARGB(255, 51, 59, 69),
                                  padding: EdgeInsets.all(0),
                                  child: Text(
                                    "Anything",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "Lato",
                                      fontWeight: FontWeight.w700,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          height: 48,
                          margin: EdgeInsets.only(left: 2, right: 1),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 147,
                                height: 48,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Text(
                                        "Cultivation Standard\n",
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 51, 59, 69),
                                          fontSize: 14,
                                          fontFamily: "Lato",
                                          fontWeight: FontWeight.w700,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Positioned(
                                      left: 1,
                                      top: 20,
                                      child: Container(
                                        width: 146,
                                        height: 28,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: Container(
                                                width: 69,
                                                height: 28,
                                                child: FlatButton(
                                                  onPressed: () => this
                                                      .onOption2Pressed(
                                                          context),
                                                  color: Color.fromARGB(
                                                      39, 168, 182, 200),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  8))),
                                                  textColor: Color.fromARGB(
                                                      255, 51, 59, 69),
                                                  padding: EdgeInsets.all(0),
                                                  child: Text(
                                                    "Bio-Knospe",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily: "Lato",
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: Container(
                                                width: 69,
                                                height: 28,
                                                margin:
                                                    EdgeInsets.only(left: 8),
                                                child: FlatButton(
                                                  onPressed: () => this
                                                      .onOptionPressed(context),
                                                  color: Color.fromARGB(
                                                      39, 168, 182, 200),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  8))),
                                                  textColor: Color.fromARGB(
                                                      255, 51, 59, 69),
                                                  padding: EdgeInsets.all(0),
                                                  child: Text(
                                                    "Demeter",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily: "Lato",
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: 69,
                                height: 28,
                                margin: EdgeInsets.only(top: 20, right: 8),
                                child: FlatButton(
                                  onPressed: () =>
                                      this.onOption2TwoPressed(context),
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                  textColor: Color.fromARGB(255, 51, 59, 69),
                                  padding: EdgeInsets.all(0),
                                  child: Text(
                                    "Naturaplan",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "Lato",
                                      fontWeight: FontWeight.w700,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Container(
                                width: 69,
                                height: 28,
                                margin: EdgeInsets.only(top: 20),
                                child: FlatButton(
                                  onPressed: () =>
                                      this.onOptionTwoPressed(context),
                                  color: Color.fromARGB(39, 168, 182, 200),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                  textColor: Color.fromARGB(255, 51, 59, 69),
                                  padding: EdgeInsets.all(0),
                                  child: Text(
                                    "Bio-Siegel",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "Lato",
                                      fontWeight: FontWeight.w700,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 304,
                    height: 66,
                    margin: EdgeInsets.only(top: 15, right: 21),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(19, 0, 0, 0),
                          offset: Offset(0, 2),
                          blurRadius: 38,
                        ),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 14, top: 11),
                          child: Text(
                            "Offered Lease Price  p.A.",
                            style: TextStyle(
                              color: Color.fromARGB(255, 156, 155, 156),
                              fontSize: 13,
                              fontFamily: "Lato",
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          width: 95,
                          height: 24,
                          margin: EdgeInsets.only(left: 14, top: 6),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Fr.",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 37, 37, 37),
                                    fontSize: 16,
                                    fontFamily: "Open Sans",
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  margin: EdgeInsets.only(left: 9),
                                  child: Text(
                                    _result.lands[0].lease.landPrice.toString(),
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 37, 37, 37),
                                      fontSize: 16,
                                      fontFamily: "Open Sans",
                                      fontWeight: FontWeight.w700,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  height: 228,
                  margin: EdgeInsets.only(left: 19, right: 16, bottom: 20),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(20, 0, 0, 0),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 8,
                        top: 6,
                        child: Text(
                          "Land History\n",
                          style: TextStyle(
                            color: Color.fromARGB(255, 51, 59, 69),
                            fontSize: 14,
                            fontFamily: "Lato",
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Positioned(
                        left: 9,
                        top: 35,
                        right: 8,
                        child: Container(
                          height: 177,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(19, 0, 0, 0),
                                offset: Offset(0, 2),
                                blurRadius: 38,
                              ),
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 139,
                                  margin: EdgeInsets.only(left: 7, top: 14),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Container(
                                          margin: EdgeInsets.only(left: 1),
                                          child: Text(
                                            "Period",
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 51, 59, 69),
                                              fontSize: 12,
                                              fontFamily: "Lato",
                                              fontWeight: FontWeight.w700,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 48,
                                        margin: EdgeInsets.only(top: 9),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 138,
                                              height: 48,
                                              child: Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  Positioned(
                                                    left: 0,
                                                    top: 0,
                                                    child: Text(
                                                      "Preferred Crop Type\n",
                                                      style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 51, 59, 69),
                                                        fontSize: 12,
                                                        fontFamily: "Lato",
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                      textAlign: TextAlign.left,
                                                    ),
                                                  ),
                                                  
                                                ],
                                              ),
                                            ),
                                            Spacer(),
                                            Container(
                                              width: 64,
                                              height: 28,
                                              margin: EdgeInsets.only(
                                                  top: 20, right: 9),
                                              decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255),
                                                border: Border.all(
                                                  color: Color.fromARGB(
                                                      255, 255, 151, 84),
                                                  width: 2,
                                                ),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8)),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: [
                                                  Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 19),
                                                    child: Text(
                                                      "Corn",
                                                      style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 51, 59, 69),
                                                        fontSize: 11,
                                                        fontFamily: "Lato",
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        margin: EdgeInsets.only(top: 15),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 138,
                                              height: 50,
                                              child: Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  Positioned(
                                                    left: 0,
                                                    top: 0,
                                                    child: Text(
                                                      "Cultivation Standard\n",
                                                      style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 51, 59, 69),
                                                        fontSize: 14,
                                                        fontFamily: "Lato",
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                      textAlign: TextAlign.left,
                                                    ),
                                                  ),
                                                  
                                                ],
                                              ),
                                            ),
                                            Spacer(),
                                            Container(
                                              width: 64,
                                              height: 28,
                                              margin: EdgeInsets.only(
                                                  top: 22, right: 9),
                                              decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255),
                                                border: Border.all(
                                                  color: Color.fromARGB(
                                                      255, 255, 151, 84),
                                                  width: 2,
                                                ),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8)),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: [
                                                  Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 4),
                                                    child: Text(
                                                      "Naturaplan",
                                                      style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 51, 59, 69),
                                                        fontSize: 11,
                                                        fontFamily: "Lato",
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: 64,
                                              height: 28,
                                              margin: EdgeInsets.only(top: 22),
                                              decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                    39, 168, 182, 200),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8)),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: [
                                                  Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 7),
                                                    child: Text(
                                                      "Bio-Siegel",
                                                      style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 51, 59, 69),
                                                        fontSize: 11,
                                                        fontFamily: "Lato",
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: 72,
                                height: 18,
                                margin: EdgeInsets.only(top: 12),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "01/01/2016",
                                    contentPadding: EdgeInsets.all(0),
                                    border: InputBorder.none,
                                  ),
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 37, 37, 37),
                                    fontSize: 12,
                                    fontFamily: ".SF NS Text",
                                  ),
                                  maxLines: 1,
                                  autocorrect: false,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 12, right: 5),
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 37, 37, 37),
                                    fontSize: 12,
                                    fontFamily: "",
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Container(
                                width: 74,
                                height: 18,
                                margin: EdgeInsets.only(top: 12, right: 5),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "15/06/2019",
                                    contentPadding: EdgeInsets.all(0),
                                    border: InputBorder.none,
                                  ),
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 37, 37, 37),
                                    fontSize: 12,
                                    fontFamily: ".SF NS Text",
                                  ),
                                  maxLines: 1,
                                  autocorrect: false,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: 158,
                    height: 40,
                    margin: EdgeInsets.only(bottom: 18),
                    child: FlatButton(
                      onPressed: () => this.onBtnPaymentPressed(context),
                      color: Color.fromARGB(255, 255, 255, 255),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4))),
                      textColor: Color.fromARGB(255, 1, 48, 94),
                      padding: EdgeInsets.all(0),
                      child: Text(
                        "Select this Lease",
                        style: TextStyle(
                          fontSize: 11,
                          fontFamily: "SF Pro Text",
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onOption2Pressed(BuildContext context) {}

  void onOptionPressed(BuildContext context) {}

  void onOption2TwoPressed(BuildContext context) {}

  void onOptionTwoPressed(BuildContext context) {}

  void onOption2ThreePressed(BuildContext context) {}

  void onOptionThreePressed(BuildContext context) {}

  void onOption2FourPressed(BuildContext context) {}

  void onOptionFourPressed(BuildContext context) {}

  void onOption2FivePressed(BuildContext context) {}

  void onOptionFivePressed(BuildContext context) {}

  void onOption2SixPressed(BuildContext context) {}

  void onOptionSixPressed(BuildContext context) {}

  void onOption2SevenPressed(BuildContext context) {}

  void onOptionSevenPressed(BuildContext context) {}

  void onOption2EightPressed(BuildContext context) {}

  void onOptionEightPressed(BuildContext context) {}

  void onBtnPaymentPressed(BuildContext context) {}
}
