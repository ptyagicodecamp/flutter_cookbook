import 'package:flutter/material.dart';
import 'home.dart';
import 'unknown.dart';
import 'anims/swipe_anim.dart';
import 'anims/stack_swipe_rotate.dart';
import 'anims/basic_anim.dart';
import 'anims/color_tween.dart';
import 'anims/double_tween.dart';
import 'anims/anim_shake.dart';

const String HOME = "/";
const String SWIPE_ANIM = 'SWIPE_ANIM';
const String SWIPE_ANIM_ROTATE = 'SWIPE_ANIM_ROTATE';
const String BASIC_ANIM = 'BASIC_ANIM';
const String COLOR_TWEEN = 'COLOR_TWEEN';
const String DOUBLE_TWEEN = 'DOUBLE_TWEEN';
const String SHAKE_ANIM = 'SHAKE_ANIM';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  print(routeSettings.name);

  switch(routeSettings.name) {
    case HOME:
      return MaterialPageRoute(builder: (context) => Home());
      break;

    case SWIPE_ANIM:
      return MaterialPageRoute(builder: (context) => SwipeAnimationDemo());
      break;

    case SWIPE_ANIM_ROTATE:
      return MaterialPageRoute(builder: (context) => SwipeAnimRotateDemo());
      break;

    case BASIC_ANIM:
      return MaterialPageRoute(builder: (context) => BasicAnimationControllerDemo());
      break;

    case COLOR_TWEEN:
      return MaterialPageRoute(builder: (context) => ColorTweenAnimationDemo());
      break;

    case DOUBLE_TWEEN:
      return MaterialPageRoute(builder: (context) => DoubleTweenAnimationDemo());
      break;

    case SHAKE_ANIM:
      return MaterialPageRoute(builder: (context) => ShakeAnimationDemo());
      break;

    default:
      return MaterialPageRoute(builder: (context) => UnknownView());

  }
}