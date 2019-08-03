import 'dart:math';

import 'package:flutter_web/material.dart';

Positioned TopCard(
    BuildContext context,
    DecorationImage decorationImage,
    double left,
    double right,
    double bottom,
    double top,
    double width,
    double rotation,
    double skew,
    int flag,
    Function imageSelected,
    Function imageDismissed,
    Function rightSwipe,
    Function leftSwipe) {

  return Positioned(
    bottom: 100.0 + bottom,
    left: flag == 1 ? right != 0.0 ? right : null : null,
    right: flag == 0 ? right != 0.0 ? right : null : null,
    child: Dismissible(
      key: Key(Random().toString()),
      crossAxisEndOffset: -0.3,
      onDismissed: (DismissDirection direction) {
        if (direction == DismissDirection.endToStart)
          imageDismissed(decorationImage);
        else
          imageSelected(decorationImage);
      },
      child: Transform(
        alignment: flag == 0 ? Alignment.bottomRight : Alignment.bottomLeft,
        transform: Matrix4.skewX(skew),
        child: RotationTransition(
          turns: AlwaysStoppedAnimation(
              flag == 0 ? rotation / 360 : -rotation / 360),
          child: Hero(
            tag: 'card-' + Random().toString(),
            child: GestureDetector(
              child: ImmutableCard(context, decorationImage, width, rightSwipe, leftSwipe),
            ),
          ),
        ),
      ),
    ),
  );
}

Card ImmutableCard(BuildContext context, DecorationImage decorationImage,
    double width, Function rightSwipe, Function leftSwipe) {
  Size screenSize = MediaQuery.of(context).size;

  return Card(
    color: Colors.transparent,
    elevation: 4.0,
    child: Container(
      alignment: Alignment.center,
      width: screenSize.width / 1.2 + width,
      height: screenSize.height / 1.7,
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(8.0)),
      child: Column(
        children: <Widget>[
          Container(
            width: screenSize.width / 1.2 + width,
            height: screenSize.height / 2.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
              ),
              image: decorationImage,
            ),
          ),
          Container(
            width: screenSize.width / 1.2 + width,
            height: screenSize.height / 1.7 - screenSize.height / 2.2,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                  padding: const EdgeInsets.all(0.0),
                  onPressed: () => leftSwipe(),
                  child: Container(
                    height: 60.0,
                    width: 130.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: Text(
                      "Carnivorous",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                FlatButton(
                  padding: const EdgeInsets.all(0.0),
                  onPressed: () => rightSwipe(),
                  child: Container(
                    height: 60.0,
                    width: 130.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(50.0),
                    ),
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
  );
}
