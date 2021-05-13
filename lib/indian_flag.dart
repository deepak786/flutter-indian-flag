import 'package:flutter/material.dart';
import 'package:indian_flag/constants.dart';
import 'package:indian_flag/widget_arc.dart';

class IndianFlag extends StatefulWidget {
  @override
  _IndianFlagState createState() => _IndianFlagState();
}

class _IndianFlagState extends State<IndianFlag> {
  final poleWidth = 15.0;
  final poleHeight = 400.0;
  static final poleStairWidths = [50.0, 90.0, 130.0];
  final double poleStairHeight = 20.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: ((poleStairWidths.last / 2) - (poleWidth / 2))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // pole
                  pole(),
                  // flag
                  Container(
                    margin: EdgeInsets.only(top: poleWidth / 2),
                    child: flag(),
                  ),
                ],
              ),
            ),

            // pole stairs
            Column(
              mainAxisSize: MainAxisSize.min,
              children: poleStairWidths
                  .map(
                    (e) => poleStair(e, poleStairHeight),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  /// pole
  Widget pole() {
    return Stack(
      children: [
        Arc(diameter: poleWidth),
        Container(
          margin: EdgeInsets.only(top: poleWidth / 2),
          width: poleWidth,
          height: poleHeight,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
        ),
      ],
    );
  }

  /// flag
  Widget flag() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        flagPart(kColorSaffron!),
        Stack(
          alignment: Alignment.center,
          children: [
            flagPart(kColorWhite!),
            // AshokChakra
            Image.asset(
              "assets/images/ashoka_chakra.png",
              width: flagSize.ashokChakraSize,
              height: flagSize.ashokChakraSize,
            )
          ],
        ),
        flagPart(kColorGreen!),
      ],
    );
  }

  /// flat part
  Widget flagPart(Color color) {
    return Container(
      width: flagSize.width,
      height: flagSize.height / 3,
      color: color,
    );
  }

  /// flag pole stairs
  Widget poleStair(double width, double height) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
      ),
    );
  }
}
