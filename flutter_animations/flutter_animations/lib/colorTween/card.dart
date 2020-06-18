import 'dart:math';

import 'package:flutter/material.dart';

import 'items.dart';

Positioned TopCard(
    BuildContext context,
    CardItem cardItem,
    double left,
    double right,
    double bottom,
    double top,
    double width,
    double rotation,
    double skew,
    Function imageSelected,
    Function imageDismissed,
    Function rightSwipe,
    Function leftSwipe) {
  return Positioned(
    bottom: 100.0 + bottom,
    right: isHerbivorous(cardItem) ? right != 0.0 ? right : null : null,
    left: isCarnivorous(cardItem) ? left != 0.0 ? left : null : null,
    child: Dismissible(
      key: Key(Random().toString()),
      crossAxisEndOffset: -0.3,
      onDismissed: (DismissDirection direction) {
        if (direction == DismissDirection.endToStart)
          imageDismissed(cardItem);
        else
          imageSelected(cardItem);
      },
      child: Transform(
        alignment: isHerbivorous(cardItem)
            ? Alignment.bottomRight
            : Alignment.bottomLeft,
        transform: Matrix4.skewX(skew),
        child: RotationTransition(
          turns: AlwaysStoppedAnimation(
              isHerbivorous(cardItem) == 0 ? rotation / 360 : -rotation / 360),
          child: ImmutableCard(context, cardItem, width, rightSwipe, leftSwipe),
//          child: Hero(
//            tag: 'card',
//            child: GestureDetector(
//              child: ImmutableCard(context, cardItem, width, rightSwipe, leftSwipe),
//            ),
//          ),
        ),
      ),
    ),
  );
}

Card ImmutableCard(BuildContext context, CardItem cardItem, double width,
    Function rightSwipe, Function leftSwipe) {
  Size screenSize = MediaQuery.of(context).size;
  DecorationImage decorationImage =
      DecorationImage(image: AssetImage(cardItem.image), fit: BoxFit.fill);

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
                  onPressed: () {
                    if (leftSwipe != null) leftSwipe(cardItem);
                  },
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
                  onPressed: () {
                    if (rightSwipe != null) rightSwipe(cardItem);
                  },
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

Positioned positionedImmutableCard(
    BuildContext context, CardItem cardItem, double cardWidth, double bottom) {
  return Positioned(
    bottom: 100.0 + bottom,
    child: ImmutableCard(context, cardItem, cardWidth, null, null),
  );
}
