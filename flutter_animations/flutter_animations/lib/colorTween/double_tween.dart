import 'dart:math';

import 'package:flutter/material.dart';

import 'items.dart';

class DoubleTweenAnimationDemo extends StatefulWidget {
  @override
  _DoubleTweenAnimationDemoState createState() =>
      new _DoubleTweenAnimationDemoState();
}

class _DoubleTweenAnimationDemoState extends State<DoubleTweenAnimationDemo>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> animation;
  Animation<Color> animationColor;

  static const FACE_LEFT_ANGLE = 0.1; //-3.14 / 4;
  static const FACE_RIGHT_ANGLE = -0.1; //3.14 / 4;
  static double _angle = FACE_RIGHT_ANGLE;

  @override
  void initState() {
    super.initState();

    _controller = new AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInCirc))
      ..addListener(() {
        setState(() {});
      });

//    Tween _tween = AlignmentTween(
//      begin: Alignment(0.0, 0.0),
//      end: Alignment(0.0, 0.0),
//    );
//
//    animation = _tween.animate(CurvedAnimation(parent: _controller, curve: Curves.easeInCirc))
//      ..addListener(() {
//        setState(() {});
//      });

    animationColor = ColorTween(
      begin: Colors.lightBlue,
      end: Colors.grey,
    ).animate(_controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
//          _controller.reverse();
//          _angle = FACE_LEFT_ANGLE;
        } else if (status == AnimationStatus.dismissed) {
//          _controller.forward();
//          _angle = FACE_RIGHT_ANGLE;
        }
      });

    //_controller.forward();
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
      appBar: AppBar(title: Text('Tween animation')),
      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            Positioned(
              bottom: 100.0,
              child: Transform.rotate(
//                alignment: animation.value,
                angle: _angle,
                child: Card(
                  color: Colors.transparent,
                  elevation: 4.0,
                  child: Container(
                    alignment: Alignment.center,
                    width: screenSize.width / 1.2,
                    height: screenSize.height / 1.7,
                    decoration: BoxDecoration(
                      color: animationColor.value,
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
                                  _controller.reverse();
                                  _angle = FACE_LEFT_ANGLE;
                                },
                                child: Container(
                                  height: 60.0,
                                  width: 130.0,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius:
                                          BorderRadius.circular(50.0)),
                                  child: Text(
                                    "Carnivorous",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              FlatButton(
                                padding: const EdgeInsets.all(0.0),
                                onPressed: () {
                                  _controller.forward();
                                  _angle = FACE_RIGHT_ANGLE;
                                },
                                child: Container(
                                  height: 60.0,
                                  width: 130.0,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius:
                                          BorderRadius.circular(50.0)),
                                  child: Text(
                                    "Herbivorous",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
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
