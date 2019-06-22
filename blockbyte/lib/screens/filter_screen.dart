
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class LenderWidget extends StatelessWidget {
  
  void onControlsSliderRegularLightNoGlyphsValueChanged(BuildContext context) {
  
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.only(left: 25, top: 19),
                child: Text(
                  "Lender",
                  style: TextStyle(
                    color: Color.fromARGB(255, 51, 51, 51),
                    fontSize: 18,
                    fontFamily: "Lato",
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.only(left: 25, top: 10),
                child: Text(
                  "Location",
                  style: TextStyle(
                    color: Color.fromARGB(255, 99, 107, 128),
                    fontSize: 20,
                    fontFamily: "Lato",
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Container(
              height: 22,
              margin: EdgeInsets.only(left: 25, top: 10, right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Size",
                      style: TextStyle(
                        color: Color.fromARGB(255, 51, 51, 51),
                        fontSize: 18,
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
                      width: 119,
                      height: 20,
                      margin: EdgeInsets.only(right: 14),
                      child: CupertinoTextField(
                        // decoration: InputDecoration(
                        //   hintText: "1000",
                        //   contentPadding: EdgeInsets.all(0),
                        //   border: InputBorder.none,
                        // ),
                        // style: TextStyle(
                        //   color: Color.fromARGB(77, 60, 60, 67),
                        //   fontSize: 17,
                        //   fontFamily: "SF Pro Text",
                        // ),
                        maxLines: 1,
                        autocorrect: false,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "hectar",
                      style: TextStyle(
                        color: Color.fromARGB(255, 51, 51, 51),
                        fontSize: 15,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.only(left: 25, top: 78),
                child: Text(
                  "Price",
                  style: TextStyle(
                    color: Color.fromARGB(255, 99, 107, 128),
                    fontSize: 20,
                    fontFamily: "Lato",
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Container(
              height: 23,
              margin: EdgeInsets.only(left: 25, top: 13, right: 24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Suggested Price",
                      style: TextStyle(
                        color: Color.fromARGB(255, 51, 51, 51),
                        fontSize: 18,
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
                      width: 130,
                      height: 21,
                      margin: EdgeInsets.only(top: 2, right: 13),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "in CHF",
                          contentPadding: EdgeInsets.all(0),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                          color: Color.fromARGB(77, 60, 60, 67),
                          fontSize: 17,
                          fontFamily: "SF Pro Text",
                        ),
                        maxLines: 1,
                        autocorrect: false,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(top: 2),
                      child: Text(
                        "CHF",
                        style: TextStyle(
                          color: Color.fromARGB(255, 51, 51, 51),
                          fontSize: 15,
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
            Container(
              height: 32,
              margin: EdgeInsets.only(left: 25, top: 31, right: 42),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(top: 9),
                      child: Text(
                        "Premium",
                        style: TextStyle(
                          color: Color.fromARGB(255, 51, 51, 51),
                          fontSize: 18,
                          fontFamily: "Lato",
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 198,
                      height: 32,
                      child: Slider(
                        inactiveColor: Color.fromARGB(255, 0, 128, 255),
                        activeColor: Color.fromARGB(255, 184, 184, 184),
                        min: 0,
                        max: 1000,
                        value: 500, 
                        onChanged: (double value) => print(value),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 18,
              margin: EdgeInsets.only(left: 127, top: 6, right: 22),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "0 %",
                      style: TextStyle(
                        color: Color.fromARGB(255, 51, 51, 51),
                        fontSize: 15,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "100 %",
                      style: TextStyle(
                        color: Color.fromARGB(255, 51, 51, 51),
                        fontSize: 15,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 28,
              margin: EdgeInsets.only(left: 25, top: 20, right: 24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Offer Price",
                      style: TextStyle(
                        color: Color.fromARGB(255, 51, 51, 51),
                        fontSize: 18,
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
                      width: 124,
                      height: 25,
                      margin: EdgeInsets.only(top: 3, right: 19),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "in CHF",
                          contentPadding: EdgeInsets.all(0),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                          color: Color.fromARGB(77, 60, 60, 67),
                          fontSize: 17,
                          fontFamily: "SF Pro Text",
                        ),
                        maxLines: 1,
                        autocorrect: false,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(top: 3),
                      child: Text(
                        "CHF",
                        style: TextStyle(
                          color: Color.fromARGB(255, 51, 51, 51),
                          fontSize: 15,
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
          ],
        ),
      ),
    );
  }
}