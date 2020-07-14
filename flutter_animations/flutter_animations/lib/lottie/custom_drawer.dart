import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomDrawer extends StatelessWidget {
  final LottieComposition composition;

  const CustomDrawer(this.composition, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _Painter(composition),
      size: Size(400, 400),
    );
  }
}

class _Painter extends CustomPainter {
  final LottieDrawable drawable;

  _Painter(LottieComposition composition)
      : drawable = LottieDrawable(composition);

  @override
  void paint(Canvas canvas, Size size) {
    var frameCount = 40;
    var columns = 10;
    for (var i = 0; i < frameCount; i++) {
      var destRect = Offset(i % columns * 100.0, i ~/ 10 * 80.0) & (size / 5);
      drawable
        ..setProgress(i / frameCount)
        ..draw(canvas, destRect);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
