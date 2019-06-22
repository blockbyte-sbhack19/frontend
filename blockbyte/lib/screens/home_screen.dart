import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:blockbyte/screens/lender_screen.dart';
import 'package:blockbyte/screens/leaser_screen.dart';
import 'package:blockbyte/screens/insurance_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
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
                                              fontSize: 14,
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
                                                  margin: EdgeInsets.only(right: 6),
                                                  child: Text(
                                                    "Risk Score",
                                                    style: TextStyle(
                                                      color: Color.fromARGB(255, 255, 255, 255),
                                                      fontSize: 14,
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
                                                  color: Color.fromARGB(255, 255, 151, 84),
                                                  borderRadius: BorderRadius.all(Radius.circular(2)),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      width: 14,
                                                      height: 12,
                                                      margin: EdgeInsets.only(left: 16),
                                                      child: TextField(
                                                        decoration: InputDecoration(
                                                          hintText: "66",
                                                          contentPadding: EdgeInsets.all(0),
                                                          border: InputBorder.none,
                                                        ),
                                                        style: TextStyle(
                                                          color: Color.fromARGB(255, 255, 255, 255),
                                                          fontSize: 10,
                                                          fontFamily: "SF Compact Text",
                                                          fontWeight: FontWeight.w600,
                                                        ),
                                                        maxLines: 1,
                                                        autocorrect: false,
                                                      ),
                                                    ),
                                                    Spacer(),
                                                    Container(
                                                      margin: EdgeInsets.only(right: 19),
                                                      child: Text(
                                                        "%",
                                                        style: TextStyle(
                                                          color: Color.fromARGB(255, 255, 255, 255),
                                                          fontSize: 10,
                                                          fontFamily: "SF Compact Text",
                                                          fontWeight: FontWeight.w600,
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
                                    borderRadius: BorderRadius.all(Radius.circular(6)),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 14),
                                        child: Text(
                                          "Size",
                                          style: TextStyle(
                                            color: Color.fromARGB(255, 92, 105, 121),
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
                                            color: Color.fromARGB(255, 37, 37, 37),
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
                                            color: Color.fromARGB(255, 37, 37, 37),
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
                                              margin: EdgeInsets.only(left: 20, top: 8),
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
                                              width: 74,
                                              height: 18,
                                              margin: EdgeInsets.only(left: 25, top: 5),
                                              child: TextField(
                                                decoration: InputDecoration(
                                                  hintText: "01/01/2020",
                                                  contentPadding: EdgeInsets.all(0),
                                                  border: InputBorder.none,
                                                ),
                                                style: TextStyle(
                                                  color: Color.fromARGB(255, 37, 37, 37),
                                                  fontSize: 14,
                                                  fontFamily: ".SF NS Text",
                                                ),
                                                maxLines: 1,
                                                autocorrect: false,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        width: 147,
                                        height: 58,
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
                                              margin: EdgeInsets.only(left: 28, top: 8),
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
                                            Align(
                                              alignment: Alignment.topCenter,
                                              child: Container(
                                                width: 73,
                                                height: 18,
                                                margin: EdgeInsets.only(top: 5),
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                    hintText: "31/12/2022",
                                                    contentPadding: EdgeInsets.all(0),
                                                    border: InputBorder.none,
                                                  ),
                                                  style: TextStyle(
                                                    color: Color.fromARGB(255, 37, 37, 37),
                                                    fontSize: 14,
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
                              borderRadius: BorderRadius.all(Radius.circular(6)),
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
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "ETH",
                                          style: TextStyle(
                                            color: Color.fromARGB(255, 37, 37, 37),
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
                                              color: Color.fromARGB(255, 37, 37, 37),
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
                              borderRadius: BorderRadius.all(Radius.circular(6)),
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
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "ETH",
                                          style: TextStyle(
                                            color: Color.fromARGB(255, 37, 37, 37),
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
                                              color: Color.fromARGB(255, 37, 37, 37),
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
                          margin: EdgeInsets.only(left: 41, right: 41, bottom: 23),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Container(
                                  width: 112,
                                  height: 40,
                                  child: FlatButton(
                                    onPressed: () => this.onBtnPaymentTwoPressed(context),
                                    color: Color.fromARGB(255, 61, 146, 86),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
                                    textColor: Color.fromARGB(255, 255, 255, 255),
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
                                    onPressed: () => this.onBtnPaymentPressed(context),
                                    color: Color.fromARGB(255, 255, 78, 78),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
                                    textColor: Color.fromARGB(255, 255, 255, 255),
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
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Container(
                                          width: 69,
                                          height: 28,
                                          child: FlatButton(
                                            onPressed: () => this.onOption2Pressed(context),
                                            color: Color.fromARGB(255, 255, 255, 255),
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                                            textColor: Color.fromARGB(255, 51, 59, 69),
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
                                            onPressed: () => this.onOptionPressed(context),
                                            color: Color.fromARGB(39, 168, 182, 200),
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                                            textColor: Color.fromARGB(255, 51, 59, 69),
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
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
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
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
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

  void onBtnPaymentPressed(BuildContext context) {
  
  }
  
  void onBtnPaymentTwoPressed(BuildContext context) {
  
  }
  
  void onOption2Pressed(BuildContext context) {
  
  }
  
  void onOptionPressed(BuildContext context) {
  
  }
  
  void onOption2TwoPressed(BuildContext context) {
  
  }
  
  void onOptionTwoPressed(BuildContext context) {
  
  }
}
