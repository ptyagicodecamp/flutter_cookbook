import 'package:flutter/material.dart';
import 'home.dart';
import 'unknown.dart';
import 'anims/swipe_anim.dart';

const String HOME = "/";
const String SWIPE_ANIM = 'SWIPE_ANIM';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  print(routeSettings.name);

  switch(routeSettings.name) {
    case HOME:
      return MaterialPageRoute(builder: (context) => Home());
      break;

    case SWIPE_ANIM:
      return MaterialPageRoute(builder: (context) => SwipeAnimationDemo());
      break;

    default:
      return MaterialPageRoute(builder: (context) => UnknownView());

  }
}