import 'dart:math';

import 'package:flutter/material.dart';

import '../utils/items.dart';
import 'package:vector_math/vector_math_64.dart';
import '../utils/myColors.dart';

List images = [herb1];

class ShakeAnimationDemo extends StatefulWidget {
  @override
  _ShakeAnimationDemoState createState() => new _ShakeAnimationDemoState();
}

class _ShakeAnimationDemoState extends State<ShakeAnimationDemo>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> shakeAnimation;

  bool flag = true;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    shakeAnimation = Tween<double>(
      begin: 50.0,
      end: 100.0,
    ).animate(_controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          //_controller.reverse();
          //flag = true;
        } else if (status == AnimationStatus.dismissed) {
          //_controller.forward();
          //flag = false;
        }
      });
  }

  Vector3 _shake() {
    double progress = _controller.value;
    double offset = sin(progress * pi * 10.0);
    return Vector3(offset * 4, 0.0, 0.0);
  }

  @override
  dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    DecorationImage decorationImage = DecorationImage(
        image: AssetImage(cardItems[0].image), fit: BoxFit.fitWidth);

    return Scaffold(
      appBar: AppBar(title: Text('Shake Animation')),
      body: Container(
        color: myWhite,
        alignment: Alignment.center,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            Positioned(
              bottom: 100.0,
              child: Card(
                color: myBlue,
                elevation: 4.0,
                child: Container(
                  alignment: Alignment.center,
                  width: screenSize.width / 1.2,
                  height: screenSize.height / 1.7,
                  decoration: BoxDecoration(
                    color: myBlue,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: screenSize.width / 1.2,
                        height: screenSize.height / 2.2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8.0),
                              topRight: Radius.circular(8.0),
                            ),
                            image: decorationImage),
                      ),
                      Container(
                        width: screenSize.width / 1.2,
                        height:
                            screenSize.height / 1.7 - screenSize.height / 2.2,
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            FlatButton(
                              padding: const EdgeInsets.all(0.0),
                              onPressed: () {
                                //_controller.reverse();
                                flag = true;
                              },
                              child: Container(
                                height: 60.0,
                                width: 130.0,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: myRed,
                                    borderRadius: BorderRadius.circular(50.0)),
                                child: Text(
                                  "Carnivorous",
                                  style: TextStyle(color: myWhite),
                                ),
                              ),
                            ),
                            Transform(
                              transform: Matrix4.translation(_shake()),
                              child: FlatButton(
                                padding: const EdgeInsets.all(0.0),
                                onPressed: () {
                                  if (flag) {
                                    _controller.forward();
                                  } else {
                                    _controller.reverse();
                                  }

                                  flag = false;
                                },
                                child: Container(
                                  height: 60.0,
                                  width: 130.0,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: myGreen,
                                      borderRadius:
                                          BorderRadius.circular(50.0)),
                                  child: Text(
                                    "Herbivorous",
                                    style: TextStyle(color: myWhite),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
