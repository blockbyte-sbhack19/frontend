import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InsuranceScreen extends StatefulWidget {
  @override
  InsuranceScreenState createState() {
    return InsuranceScreenState();
  }
}

class InsuranceScreenState extends State<InsuranceScreen> {
  final String _dateFormat = "dd/MM/yyyy";
  final double _kPickerSheetHeight = 216.0;
  var _beforeDate = DateTime.parse("2020-01-01");
  var _afterDate = DateTime.parse("2022-01-01");

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

  Widget _cellItemWidget() {
    return Container(
      constraints: BoxConstraints.expand(height: 812),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 284,
              height: 47,
              margin: EdgeInsets.only(top: 11),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Insurance",
                      style: TextStyle(
                        color: Color.fromARGB(255, 92, 105, 121),
                        fontSize: 20,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Spacer(),
                  Opacity(
                    opacity: 0.5,
                    child: Text(
                      "Insure your lease with our insurances",
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
            height: 489,
            margin: EdgeInsets.only(left: 11, top: 15, right: 13),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  right: 0,
                  child: Container(
                    height: 489,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 49, 101, 236),
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
                          alignment: Alignment.topCenter,
                          child: Container(
                            width: 303,
                            height: 169,
                            margin: EdgeInsets.only(top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  height: 46,
                                  margin: EdgeInsets.only(left: 17, right: 1),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
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
                                          margin: EdgeInsets.only(
                                              left: 12, top: 12),
                                          child: TextField(
                                            decoration: InputDecoration(
                                              hintText: "B. Haller\n",
                                              contentPadding: EdgeInsets.all(0),
                                              border: InputBorder.none,
                                            ),
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
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
                                                  margin:
                                                      EdgeInsets.only(right: 6),
                                                  child: Text(
                                                    "Risk Score",
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
                                                  color: Color.fromARGB(
                                                      255, 255, 151, 84),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(2)),
                                                ),
                                                child: Container(
                                                  margin:
                                                      EdgeInsets.only(top: 3),
                                                  child: Text(
                                                    "66%",
                                                    style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 255, 255, 255),
                                                      fontSize: 10,
                                                      fontFamily:
                                                          "SF Compact Text",
                                                      fontWeight:
                                                          FontWeight.w600,
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
                                  height: 44,
                                  margin: EdgeInsets.only(top: 11),
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
                                            fontSize: 18,
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
                                            fontSize: 18,
                                            fontFamily: "Open Sans",
                                            fontWeight: FontWeight.w700,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  height: 58,
                                  margin: EdgeInsets.symmetric(horizontal: 1),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 147,
                                        height: 58,
                                        decoration: BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Color.fromARGB(19, 0, 0, 0),
                                              offset: Offset(0, 2),
                                              blurRadius: 38,
                                            ),
                                          ],
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(6)),
                                        ),
                                        child: Container(
                                          child: _buildDatePickerBeforeDate(
                                              context),
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        width: 147,
                                        height: 58,
                                        decoration: BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Color.fromARGB(19, 0, 0, 0),
                                              offset: Offset(0, 2),
                                              blurRadius: 38,
                                            ),
                                          ],
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(6)),
                                        ),
                                        child: Container(
                                          child: _buildDatePickerAfterDate(
                                              context),
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
                            width: 304,
                            height: 66,
                            margin: EdgeInsets.only(top: 76),
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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 14, top: 11),
                                  child: Text(
                                    "Premium  p.A.",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 156, 155, 156),
                                      fontSize: 13,
                                      fontFamily: "Lato",
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Container(
                                  width: 57,
                                  height: 24,
                                  margin: EdgeInsets.only(left: 14, top: 6),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "ETH",
                                          style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 37, 37, 37),
                                            fontSize: 18,
                                            fontFamily: "Open Sans",
                                            fontWeight: FontWeight.w700,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Container(
                                          width: 12,
                                          height: 24,
                                          margin: EdgeInsets.only(left: 6),
                                          child: TextField(
                                            decoration: InputDecoration(
                                              hintText: "1",
                                              contentPadding: EdgeInsets.all(0),
                                              border: InputBorder.none,
                                            ),
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 37, 37, 37),
                                              fontSize: 18,
                                              fontFamily: "Open Sans",
                                              fontWeight: FontWeight.w700,
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
                        ),
                        Spacer(),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            width: 304,
                            height: 66,
                            margin: EdgeInsets.only(bottom: 17),
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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 14, top: 11),
                                  child: Text(
                                    "Insured Premium  p.A.",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 156, 155, 156),
                                      fontSize: 13,
                                      fontFamily: "Lato",
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Container(
                                  width: 57,
                                  height: 24,
                                  margin: EdgeInsets.only(left: 14, top: 6),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "ETH",
                                          style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 37, 37, 37),
                                            fontSize: 18,
                                            fontFamily: "Open Sans",
                                            fontWeight: FontWeight.w700,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Container(
                                          width: 12,
                                          height: 24,
                                          margin: EdgeInsets.only(left: 6),
                                          child: TextField(
                                            decoration: InputDecoration(
                                              hintText: "2",
                                              contentPadding: EdgeInsets.all(0),
                                              border: InputBorder.none,
                                            ),
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 37, 37, 37),
                                              fontSize: 18,
                                              fontFamily: "Open Sans",
                                              fontWeight: FontWeight.w700,
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
                        ),
                        Container(
                          height: 40,
                          margin:
                              EdgeInsets.only(left: 41, right: 41, bottom: 23),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Container(
                                  width: 112,
                                  height: 40,
                                  child: FlatButton(
                                    onPressed: () =>
                                        this._getInsurance(context),
                                    color: Color.fromARGB(255, 61, 146, 86),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4))),
                                    textColor:
                                        Color.fromARGB(255, 255, 255, 255),
                                    padding: EdgeInsets.all(0),
                                    child: Text(
                                      "Get Insurance",
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
                              Spacer(),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Container(
                                  width: 112,
                                  height: 40,
                                  child: FlatButton(
                                    onPressed: () =>
                                        this.onBtnPaymentPressed(context),
                                    color: Color.fromARGB(255, 255, 78, 78),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4))),
                                    textColor:
                                        Color.fromARGB(255, 255, 255, 255),
                                    padding: EdgeInsets.all(0),
                                    child: Text(
                                      "No Insurance",
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
                  ),
                ),
                Positioned(
                  top: 199,
                  child: Container(
                    width: 301,
                    height: 51,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 147,
                          height: 51,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Text(
                                  "Insurance Type\n",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 14,
                                    fontFamily: "Lato",
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Positioned(
                                left: 1,
                                top: 23,
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
                                            onPressed: () =>
                                                this.onOption2Pressed(context),
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8))),
                                            textColor:
                                                Color.fromARGB(255, 51, 59, 69),
                                            padding: EdgeInsets.all(0),
                                            child: Text(
                                              "Drought",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: "Lato",
                                                fontWeight: FontWeight.w700,
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
                                          margin: EdgeInsets.only(left: 8),
                                          child: FlatButton(
                                            onPressed: () =>
                                                this.onOptionPressed(context),
                                            color: Color.fromARGB(
                                                39, 168, 182, 200),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8))),
                                            textColor:
                                                Color.fromARGB(255, 51, 59, 69),
                                            padding: EdgeInsets.all(0),
                                            child: Text(
                                              "Hail",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: "Lato",
                                                fontWeight: FontWeight.w700,
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
                          margin: EdgeInsets.only(top: 23, right: 8),
                          child: FlatButton(
                            onPressed: () => this.onOption2TwoPressed(context),
                            color: Color.fromARGB(39, 168, 182, 200),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            textColor: Color.fromARGB(255, 51, 59, 69),
                            padding: EdgeInsets.all(0),
                            child: Text(
                              "Flood",
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
                          margin: EdgeInsets.only(top: 23),
                          child: FlatButton(
                            onPressed: () => this.onOptionTwoPressed(context),
                            color: Color.fromARGB(39, 168, 182, 200),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            textColor: Color.fromARGB(255, 51, 59, 69),
                            padding: EdgeInsets.all(0),
                            child: Text(
                              "Frost",
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onBtnPaymentPressed(BuildContext context) {}

  void _getInsurance(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) => new CupertinoAlertDialog(
        title: Text("Waiting for approval"),
        content: CupertinoActivityIndicator(),
      ),
    );
    Future.delayed(const Duration(seconds: 2), () => "2").then((value) {
      Navigator.pop(context);
      showDialog(
        context: context,
        builder: (BuildContext context) => new CupertinoAlertDialog(
          content: new Text("Insurance has been approved"),
        ),
      ).then((value) {
        Navigator.pop(context);
      });
    });
  }

  void onOption2Pressed(BuildContext context) {}

  void onOptionPressed(BuildContext context) {}

  void onOption2TwoPressed(BuildContext context) {}

  void onOptionTwoPressed(BuildContext context) {}
}
