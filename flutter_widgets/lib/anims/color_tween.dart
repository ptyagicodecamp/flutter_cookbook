import 'package:flutter/material.dart';
import '../utils/items.dart';

class ColorTweenAnimationDemo extends StatefulWidget {
  @override
  _ColorTweenAnimationDemoState createState() =>
      new _ColorTweenAnimationDemoState();
}

class _ColorTweenAnimationDemoState extends State<ColorTweenAnimationDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Color> animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    animation = ColorTween(
      begin: Colors.grey,
      end: Colors.blue,
    ).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
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
      appBar: AppBar(title: Text('ColorTween Animation')),
      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            Positioned(
              bottom: 100.0,
              child: Card(
                color: Colors.transparent,
                elevation: 4.0,
                child: Container(
                  alignment: Alignment.center,
                  width: screenSize.width / 1.2,
                  height: screenSize.height / 1.7,
                  decoration: BoxDecoration(
                    color: animation.value,
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
                              onPressed: () => {_controller.forward()},
                              child: Container(
                                height: 60.0,
                                width: 130.0,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(50.0)),
                                child: Text(
                                  "Carnivorous",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            FlatButton(
                              padding: const EdgeInsets.all(0.0),
                              onPressed: () => {_controller.reverse()},
                              child: Container(
                                height: 60.0,
                                width: 130.0,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(50.0)),
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
          ],
        ),
      ),
    );
  }
}
