import 'package:flutter/material.dart';
import 'package:flutter_animations/colorTween/stack_swipe_rotate.dart';
import 'package:flutter_animations/lottie/lottie_demo.dart';

import 'animations/anim_container.dart';
import 'animations/anim_padding.dart';
import 'animations/anim_positioned.dart';
import 'colorTween/anim_shake.dart';
import 'colorTween/basic_anim.dart';
import 'colorTween/color_tween.dart';
import 'colorTween/double_tween.dart';
import 'colorTween/swipe_anim.dart';
import 'home.dart';
import 'lottie/lottie_demo2.dart';
import 'unknown.dart';

const String HOME = "/";
const String ANIMATED_CONTAINER = "ANIMATED_CONTAINER";
const String ANIMATED_PADDING = "ANIMATED_PADDING";
const String ANIMATED_POSITIONED = "ANIMATED_POSITIONED";
const String SWIPE_ANIM = 'SWIPE_ANIM';
const String SWIPE_ANIM_ROTATE = 'SWIPE_ANIM_ROTATE';
const String BASIC_ANIM = 'BASIC_ANIM';
const String COLOR_TWEEN = 'COLOR_TWEEN';
const String DOUBLE_TWEEN = 'DOUBLE_TWEEN';
const String SHAKE_ANIM = 'SHAKE_ANIM';
const String LOTTIE_ANIM = 'LOTTIE_ANIM';
const String CUSTOM_LOTTIE_ANIM = 'CUSTOM_LOTTIE_ANIM';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  print(routeSettings.name);

  switch (routeSettings.name) {
    case HOME:
      return MaterialPageRoute(builder: (context) => Home());
      break;

    case CUSTOM_LOTTIE_ANIM:
      return MaterialPageRoute(builder: (context) => CustomLottieDemoPage());
      break;

    case LOTTIE_ANIM:
      return MaterialPageRoute(builder: (context) => LottieDemoPage());
      break;

    case SWIPE_ANIM:
      return MaterialPageRoute(builder: (context) => SwipeAnimationDemo());
      break;

    case SWIPE_ANIM_ROTATE:
      return MaterialPageRoute(builder: (context) => SwipeAnimRotateDemo());
      break;

    case BASIC_ANIM:
      return MaterialPageRoute(
          builder: (context) => BasicAnimationControllerDemo());
      break;

    case COLOR_TWEEN:
      return MaterialPageRoute(builder: (context) => ColorTweenAnimationDemo());
      break;

    case DOUBLE_TWEEN:
      return MaterialPageRoute(
          builder: (context) => DoubleTweenAnimationDemo());
      break;

    case SHAKE_ANIM:
      return MaterialPageRoute(builder: (context) => ShakeAnimationDemo());
      break;

    case ANIMATED_CONTAINER:
      return MaterialPageRoute(builder: (context) => AnimatedContainerDemo());
      break;

    case ANIMATED_PADDING:
      return MaterialPageRoute(builder: (context) => AnimatedPaddingDemo());
      break;

    case ANIMATED_POSITIONED:
      return MaterialPageRoute(builder: (context) => AnimatedPositionedDemo());
      break;

    default:
      return MaterialPageRoute(builder: (context) => UnknownView());
  }
}
