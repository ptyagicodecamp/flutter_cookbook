import 'package:flutter_web/material.dart';
import '../utils/images.dart';
import 'card.dart';

List images = [herb1, carn1, herb2, carn2];

class SwipeAnimationDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SwipeAnimationDemo();
}

class _SwipeAnimationDemo extends State with TickerProviderStateMixin {
  AnimationController _animationController;

  int flag = 0;

  Animation<double> right;
  Animation<double> bottom;
  Animation<double> width;
  Animation<double> rotate;

  List items = images;
  List selectedImages = [];

  void initState() {
    super.initState();

    _animationController = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);

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

  dismissItem(DecorationImage image) {
    setState(() {
      items.remove(image);
    });
  }

  selectItem(DecorationImage image) {
    setState(() {
      items.remove(image);
      selectedImages.add(image);
    });
  }

  swipeRight() {
    if (flag == 0) {
      setState(() {
        flag = 1;
      });

      _swipeAnimation();
    }
  }

  swipeLeft() {
    if (flag == 1) {
      setState(() {
        flag = 0;
      });

      _swipeAnimation();
    }
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 0.4;

    double initalBottom = 25.0;
    double posCardInBack = initalBottom + (items.length - 1) * 10 + 10;
    double widhtCardInBack = -10.0;

    return Scaffold(
      appBar: AppBar(
        title: Text('Swipe Animation'),
      ),
      body: Container(
        color: Colors.blue,
        alignment: Alignment.center,
        child: items.length > 0 ? Stack(
          alignment: AlignmentDirectional.center,
          children: items.map((item) {
            //last card
            if (items.indexOf(item) == items.length - 1) {
              double skew = rotate.value < -10 ? 0.1 : 0.0;
              return TopCard(context, item, 0, right.value, bottom.value, 0, width.value, rotate.value, skew, flag, selectItem, dismissItem, swipeRight, swipeLeft);
            } else {
              posCardInBack = posCardInBack - 10;
              widhtCardInBack = widhtCardInBack + 10;
              return ImmutableCard(context, item, width.value, null, null);
            }
          }).toList(),

        ) : Text("All Done !", style: TextStyle(color: Colors.white, fontSize: 35),),
      ),
    );
  }
}
