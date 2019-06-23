import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:blockbyte/helper/api.dart';
import 'package:blockbyte/model/land.dart';

class LenderScreen extends StatefulWidget {
  @override
  LenderScreenState createState() {
    return LenderScreenState();
  }
}

class LenderScreenState extends State<LenderScreen> {
  final String _dateFormat = "dd/MM/yyyy";
  final double _kPickerSheetHeight = 216.0;
  var _coordinate = TextEditingController(text: "47,8");
  var _landSize = TextEditingController(text: "12.52");
  var _landPrice = "20000";
  var _beforeDate = DateTime.parse("2020-01-01");
  var _afterDate = DateTime.parse("2022-01-01");

  Widget _buildBottomPicker(Widget picker) {
    return Container(
      height: _kPickerSheetHeight,
      padding: const EdgeInsets.only(top: 6.0),
      color: CupertinoColors.white,
      child: DefaultTextStyle(
        style: const TextStyle(
          color: CupertinoColors.black,
          fontSize: 22.0,
        ),
        child: GestureDetector(
          // Blocks taps from propagating to the modal sheet and popping.
          onTap: () {},
          child: SafeArea(
            top: false,
            child: picker,
          ),
        ),
      ),
    );
  }

  Widget _buildMenu(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: CupertinoTheme.of(context).scaffoldBackgroundColor,
        border: const Border(
          top: BorderSide(color: Color(0xFFBCBBC1), width: 0.0),
          bottom: BorderSide(color: Color(0xFFBCBBC1), width: 0.0),
        ),
      ),
      height: 24.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SafeArea(
          left: false,
          right: false,
          child: Column(
            children: children,
          ),
        ),
      ),
    );
  }

  Widget _buildDatePickerBeforeDate(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showCupertinoModalPopup<void>(
          context: context,
          builder: (BuildContext context) {
            return _buildBottomPicker(
              CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: _beforeDate,
                onDateTimeChanged: (DateTime newDateTime) {
                  setState(() => _beforeDate = newDateTime);
                },
              ),
            );
          },
        );
      },
      child: _buildMenu(<Widget>[
        Container(
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
        ),
      ]),
    );
  }

  Widget _buildDatePickerAfterDate(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showCupertinoModalPopup<void>(
          context: context,
          builder: (BuildContext context) {
            return _buildBottomPicker(
              CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: _afterDate,
                onDateTimeChanged: (DateTime newDateTime) {
                  setState(() => _afterDate = newDateTime);
                },
              ),
            );
          },
        );
      },
      child: _buildMenu(<Widget>[
        Container(
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
        ),
      ]),
    );
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

  void _issueLand() async {
    // showDialog(
    //   context: context,
    //   builder: (BuildContext context) => new CupertinoAlertDialog(
    //     content: CupertinoActivityIndicator(),
    //   ),
    // );
    var land = Land(
        latitude: int.parse(_coordinate.text.split(',')[0]),
        longitude: int.parse(_coordinate.text.split(',')[1]),
        landPrice: int.parse(_landPrice),
        landSize: double.parse(_landSize.text),
        feeForStandard: {},
        feeForCrop: {},
        beforeDate: _beforeDate,
        afterDate: _afterDate);
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

  Widget _cellItemWidget() {
    return Container(
      constraints: BoxConstraints.expand(height: 800),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 234,
              height: 47,
              margin: EdgeInsets.only(top: 11),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(left: 37),
                      child: Text(
                        "Offer your land",
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
                      "Create a new listing your land. ",
                      style: TextStyle(
                        color: Color.fromARGB(255, 95, 95, 95),
                        fontSize: 16,
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
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 325,
              height: 58,
              margin: EdgeInsets.only(top: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 173,
                    height: 58,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          left: 0,
                          child: Container(
                            width: 173,
                            height: 55,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(78, 169, 183, 200),
                                  offset: Offset(0, 1),
                                  blurRadius: 0,
                                ),
                              ],
                            ),
                            child: Container(),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 169,
                            height: 56,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Location (GPS Coordinates)",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 92, 105, 121),
                                      fontSize: 12,
                                      fontFamily: "Lato",
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    child: TextField(
                                      controller: _coordinate,
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 51, 59, 69),
                                        fontSize: 14,
                                        fontFamily: "Lato",
                                        fontWeight: FontWeight.w700,
                                      ),
                                      textAlign: TextAlign.left,
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
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 30,
                      margin: EdgeInsets.only(left: 5, top: 21),
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Get Coordinates",
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 12,
                              fontFamily: "Open Sans",
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 325,
              height: 58,
              margin: EdgeInsets.only(top: 14),
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 55,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(78, 169, 183, 200),
                            offset: Offset(0, 1),
                            blurRadius: 0,
                          ),
                        ],
                      ),
                      child: Container(),
                    ),
                  ),
                  Positioned(
                    left: 1,
                    top: 0,
                    child: Container(
                      width: 76,
                      height: 56,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Size (hectar)",
                              style: TextStyle(
                                color: Color.fromARGB(255, 92, 105, 121),
                                fontSize: 12,
                                fontFamily: "Lato",
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              child: TextField(
                                controller: _landSize,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 51, 59, 69),
                                  fontSize: 14,
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.left,
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
          ),
          Container(
            height: 67,
            margin: EdgeInsets.only(left: 23, top: 19, right: 24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 159,
                    height: 67,
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
                    child: Container(
                      child: _buildDatePickerBeforeDate(context),
                    ),
                  ),
                ),
                Spacer(),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 159,
                    height: 67,
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
                    child: Container(
                      child: _buildDatePickerAfterDate(context),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 327,
              height: 48,
              margin: EdgeInsets.only(top: 14),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 159,
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
                              color: Color.fromARGB(255, 51, 59, 69),
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
                            width: 158,
                            height: 28,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    width: 74,
                                    height: 28,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      border: Border.all(
                                        color: Color.fromARGB(255, 61, 146, 86),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(8)),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.symmetric(horizontal: 15),
                                          child: Text(
                                            "Potato",
                                            style: TextStyle(
                                              color: Color.fromARGB(255, 51, 59, 69),
                                              fontSize: 10,
                                              fontFamily: "Lato",
                                              fontWeight: FontWeight.w700,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    width: 74,
                                    height: 28,
                                    margin: EdgeInsets.only(left: 10),
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      border: Border.all(
                                        color: Color.fromARGB(255, 61, 146, 86),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(8)),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.symmetric(horizontal: 19),
                                          child: Text(
                                            "Cereal",
                                            style: TextStyle(
                                              color: Color.fromARGB(255, 51, 59, 69),
                                              fontSize: 10,
                                              fontFamily: "Lato",
                                              fontWeight: FontWeight.w700,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
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
                    width: 74,
                    height: 28,
                    margin: EdgeInsets.only(top: 20, right: 10),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(39, 168, 182, 200),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 23),
                          child: Text(
                            "Corn",
                            style: TextStyle(
                              color: Color.fromARGB(255, 51, 59, 69),
                              fontSize: 10,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 74,
                    height: 28,
                    margin: EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      border: Border.all(
                        color: Color.fromARGB(255, 61, 146, 86),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            "Anything",
                            style: TextStyle(
                              color: Color.fromARGB(255, 51, 59, 69),
                              fontSize: 10,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
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
            alignment: Alignment.topCenter,
            child: Container(
              width: 327,
              height: 48,
              margin: EdgeInsets.only(top: 14),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 159,
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
                              color: Color.fromARGB(255, 51, 59, 69),
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
                            width: 158,
                            height: 28,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    width: 74,
                                    height: 28,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      border: Border.all(
                                        color: Color.fromARGB(255, 61, 146, 86),
                                        width: 2,
                                      ),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: Text(
                                            "Bio-Knospe",
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 51, 59, 69),
                                              fontSize: 10,
                                              fontFamily: "Lato",
                                              fontWeight: FontWeight.w700,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    width: 74,
                                    height: 28,
                                    margin: EdgeInsets.only(left: 10),
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(39, 168, 182, 200),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 13),
                                          child: Text(
                                            "Demeter",
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 51, 59, 69),
                                              fontSize: 10,
                                              fontFamily: "Lato",
                                              fontWeight: FontWeight.w700,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
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
                    width: 74,
                    height: 28,
                    margin: EdgeInsets.only(top: 20, right: 10),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      border: Border.all(
                        color: Color.fromARGB(255, 61, 146, 86),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 6),
                          child: Text(
                            "Naturaplan",
                            style: TextStyle(
                              color: Color.fromARGB(255, 51, 59, 69),
                              fontSize: 10,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 74,
                    height: 28,
                    margin: EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(39, 168, 182, 200),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 9),
                          child: Text(
                            "Bio-Siegel",
                            style: TextStyle(
                              color: Color.fromARGB(255, 51, 59, 69),
                              fontSize: 10,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
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
            alignment: Alignment.topCenter,
            child: Container(
              width: 325,
              height: 103,
              margin: EdgeInsets.only(top: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Revenue, Risk Split",
                      style: TextStyle(
                        color: Color.fromARGB(255, 51, 59, 69),
                        fontSize: 14,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    height: 17,
                    margin: EdgeInsets.only(top: 13),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "0 %",
                            style: TextStyle(
                              color: Color.fromARGB(255, 169, 183, 200),
                              fontSize: 12,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Spacer(),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            margin: EdgeInsets.only(top: 2, right: 108),
                            child: Text(
                              "50 %",
                              style: TextStyle(
                                color: Color.fromARGB(255, 50, 59, 69),
                                fontSize: 12,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "100 %",
                            style: TextStyle(
                              color: Color.fromARGB(255, 169, 183, 200),
                              fontSize: 12,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 35,
                    margin: EdgeInsets.only(left: 1),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Positioned(
                          left: 0,
                          top: 21,
                          right: 0,
                          bottom: 0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                height: 1,
                                margin: EdgeInsets.symmetric(horizontal: 16),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(51, 120, 120, 128),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(0.5)),
                                ),
                                child: Container(),
                              ),
                              Spacer(),
                              Container(
                                height: 1,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(74, 60, 60, 67),
                                ),
                                child: Container(),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 20,
                          child: Container(
                            width: 150,
                            height: 2,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 0, 122, 255),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(0.8)),
                            ),
                            child: Container(),
                          ),
                        ),
                        Positioned(
                          right: 146,
                          child: Container(
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              border: Border.all(
                                color: Color.fromARGB(11, 0, 0, 0),
                                width: 0.5,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(26, 0, 0, 0),
                                  offset: Offset(0, 3),
                                  blurRadius: 1,
                                ),
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(14)),
                            ),
                            child: Container(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Set your risk - yield participation percentage",
                      style: TextStyle(
                        color: Color.fromARGB(255, 51, 59, 69),
                        fontSize: 12,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 326,
              height: 212,
              margin: EdgeInsets.only(bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 67,
                    margin: EdgeInsets.symmetric(horizontal: 1),
                    child: Row(
                      children: [
                        Container(
                          width: 159,
                          height: 67,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(38, 168, 182, 200),
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
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    left: 15, top: 15, right: 10),
                                child: Text(
                                  "Suggested Lease Price p.A.",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 156, 155, 156),
                                    fontSize: 10,
                                    fontFamily: "Lato",
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  width: 66,
                                  height: 18,
                                  margin: EdgeInsets.only(left: 16, top: 6),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Fr.",
                                          style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 37, 37, 37),
                                            fontSize: 12,
                                            fontFamily: "",
                                            fontWeight: FontWeight.w600,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Container(
                                          margin: EdgeInsets.only(left: 4),
                                          child: Text(
                                            "15’000",
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 37, 37, 37),
                                              fontSize: 12,
                                              fontFamily: "",
                                              fontWeight: FontWeight.w600,
                                            ),
                                            textAlign: TextAlign.left,
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
                          width: 159,
                          height: 67,
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
                                margin: EdgeInsets.only(left: 15, top: 14),
                                child: Text(
                                  "Custom Premium p.A.",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 156, 155, 156),
                                    fontSize: 10,
                                    fontFamily: "Lato",
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Container(
                                width: 57,
                                height: 18,
                                margin: EdgeInsets.only(left: 15, top: 7),
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "Fr.",
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 37, 37, 37),
                                          fontSize: 12,
                                          fontFamily: "",
                                          fontWeight: FontWeight.w600,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        width: 36,
                                        height: 18,
                                        margin: EdgeInsets.only(left: 5),
                                        child: TextField(
                                          decoration: InputDecoration(
                                            hintText: "5’000",
                                            contentPadding: EdgeInsets.all(0),
                                            border: InputBorder.none,
                                          ),
                                          style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 37, 37, 37),
                                            fontSize: 12,
                                            fontFamily: ".SF NS Text",
                                          ),
                                          maxLines: 1,
                                          autocorrect: false,
                                        ),
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
                  Container(
                    height: 80,
                    margin: EdgeInsets.only(top: 10, right: 1),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(38, 168, 182, 200),
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
                          margin: EdgeInsets.only(left: 15, top: 11),
                          child: Text(
                            "Calculated Lease Price  p.A.",
                            style: TextStyle(
                              color: Color.fromARGB(255, 156, 155, 156),
                              fontSize: 13,
                              fontFamily: "Lato",
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          width: 97,
                          height: 24,
                          margin: EdgeInsets.only(left: 15, top: 10),
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
                                    _landPrice,
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
                  Spacer(),
                  GestureDetector(
                            onTap: _issueLand,
                            child: 
                  Container(
                    height: 45,
                    margin: EdgeInsets.only(left: 1),
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 97),
                          child: Text(
                              "Submit Lease Offer",
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 12,
                                fontFamily: "Open Sans",
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        
                      ],
                    ),
                  ),),
                ],
              ),
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
}
