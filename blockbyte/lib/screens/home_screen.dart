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
      constraints: BoxConstraints.expand(height: 802),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 47,
            margin: EdgeInsets.only(left: 20, top: 11, right: 19),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "Offer or lease your land ",
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
                    "Choose if you want to offer a land or lease it.",
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
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 325,
              height: 583,
              margin: EdgeInsets.only(top: 43),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 0,
                    child: Container(
                      width: 325,
                      height: 583,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => LenderScreen()),
                              );
                            },
                            child: Container(
                              height: 140,
                              child: Stack(
                                alignment: Alignment.centerLeft,
                                children: [
                                  Positioned(
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      height: 140,
                                      child: Image.asset(
                                        "assets/images/mask-3.png",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 26,
                                    top: 96,
                                    child: Text(
                                      "Offer your land",
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 13,
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
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => LeaserScreen()),
                              );
                            },
                            child: Container(
                              height: 140,
                              margin: EdgeInsets.only(top: 29),
                              child: Stack(
                                alignment: Alignment.centerLeft,
                                children: [
                                  Positioned(
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      height: 140,
                                      child: Image.asset(
                                        "assets/images/mask.png",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 26,
                                    top: 96,
                                    child: Text(
                                      "Lease a land",
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 13,
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
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => InsuranceScreen()),
                              );
                            },
                            child: Container(
                              height: 140,
                              child: Stack(
                                alignment: Alignment.centerLeft,
                                children: [
                                  Positioned(
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      height: 140,
                                      child: Image.asset(
                                        "assets/images/mask-2.png",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 26,
                                    top: 96,
                                    child: Text(
                                      "Insure your existing lease",
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 13,
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
                  ),
                  Positioned(
                    top: 362,
                    child: Container(
                      width: 194,
                      height: 51,
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
                              "Insure your existing lease",
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
                ],
              ),
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
