import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'items.dart';
import 'card.dart';

//reference code
//List images = [herb1, carn1, herb2, carn2];

class SwipeAnimationDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SwipeAnimationDemo();
}

class _SwipeAnimationDemo extends State with TickerProviderStateMixin {
  AnimationController _animationController;

  // int flag = 0;

  Animation<double> left;
  Animation<double> right;
  Animation<double> bottom;
  Animation<double> width;
  Animation<double> rotate;

  List<CardItem> items = cardItems;

  void initState() {
    super.initState();

    _animationController =
        AnimationController(duration: Duration(milliseconds: 100), vsync: this);

    rotate = Tween<double>(
      begin: -0.0,
      end: -40.0,
    ).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.ease));

    rotate.addListener(() {
      setState(() {
        if (rotate.isCompleted) {
          var lastRemoved = items.removeLast();
          //add item back in list to keep going for demo purposes
          items.insert(0, lastRemoved);

          _animationController.reset();
        }
      });
    });

    right = Tween<double>(
      begin: 0.0,
      end: 400.0,
    ).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.ease));

    left = Tween<double>(
      begin: 0.0,
      end: -400.0,
    ).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.ease));

    bottom = Tween<double>(
      begin: 15.0,
      end: 100.0,
    ).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.ease));

    width = Tween<double>(
      begin: 20.0,
      end: 25.0,
    ).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.bounceOut));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<Null> _swipeAnimation() async {
    try {
      await _animationController.forward();
    } on TickerCanceled {}
  }

  dismissItem(CardItem cardItem) {
    setState(() {
      items.remove(cardItem);
    });
  }

  selectItem(CardItem cardItem) {
    setState(() {
      items.remove(cardItem);
    });
  }

  swipeRight(CardItem cardItem) {
    if (isHerbivorous(cardItem)) _swipeAnimation();
  }

  swipeLeft(CardItem cardItem) async {
    if (isCarnivorous(cardItem)) {
      try {
        await _animationController.reverse();
      } on TickerCanceled {}
    }
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 1;

    int itemsCount = items.length;

    double initalBottom = 25.0;
    double posCardInBack = initalBottom + (items.length - 1) * 10 + 10;
    double widhtCardInBack = -10.0;

    return Scaffold(
      appBar: AppBar(
        title: Text('Swipe Animation'),
      ),
      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: itemsCount > 0
            ? Stack(
                alignment: AlignmentDirectional.center,
                children: items.map((item) {
                  //last card
                  if (items.indexOf(item) == itemsCount - 1) {
                    return TopCard(
                        context,
                        item,
                        left.value,
                        right.value,
                        bottom.value,
                        0,
                        widhtCardInBack + 10,
                        rotate.value,
                        rotate.value < -10 ? 0.1 : 0.0,
                        selectItem,
                        dismissItem,
                        swipeRight,
                        swipeLeft);
                  } else {
                    posCardInBack = posCardInBack - 10;
                    widhtCardInBack = widhtCardInBack + 10;
                    return positionedImmutableCard(
                        context, item, widhtCardInBack, posCardInBack);
                  }
                }).toList(),
              )
            : Text(
                "All Done !",
                style: TextStyle(color: Colors.white, fontSize: 35),
              ),
      ),
    );
  }
}
