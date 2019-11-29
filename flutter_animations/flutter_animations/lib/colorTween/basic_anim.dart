import 'dart:math';

import 'package:flutter/material.dart';

class BasicAnimationControllerDemo extends StatefulWidget {
  @override
  _BasicAnimationControllerDemoState createState() =>
      new _BasicAnimationControllerDemoState();
}

class _BasicAnimationControllerDemoState
    extends State<BasicAnimationControllerDemo>
    with SingleTickerProviderStateMixin {
  static const FACE_LEFT_ANGLE = -3.14 / 2;
  static const FACE_RIGHT_ANGLE = 3.14 / 2;

  AnimationController _controller;
  Animation _animation;

  double _angle = FACE_RIGHT_ANGLE;

  @override
  void initState() {
    super.initState();

    _controller =
        new AnimationController(duration: new Duration(seconds: 2), vsync: this)
          ..addListener(() {
            this.setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _controller.reverse();
              _angle = FACE_LEFT_ANGLE;
            } else if (status == AnimationStatus.dismissed) {
              _controller.forward();
              _angle = FACE_RIGHT_ANGLE;
            }
          });

    Tween _tween = AlignmentTween(
      begin: Alignment(0.0, -0.5),
      end: Alignment(0.0, 0.5),
    );

    _animation = _tween.animate(_controller);

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Basic Animation Demo (Snowflake)')),
      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            new FractionallySizedBox(
                heightFactor: 0.2,
                widthFactor: 0.2,
                alignment: _animation.value,
                child: Transform.rotate(
                  angle: _angle,
                  child: new Icon(
                    Icons.ac_unit,
                    size: 80.0,
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
