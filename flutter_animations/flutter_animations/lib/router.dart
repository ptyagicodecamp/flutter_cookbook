import 'package:flutter/material.dart';
import 'home.dart';
import 'unknown.dart';
import 'animations/anim_container.dart';
import 'animations/anim_padding.dart';
import 'animations/anim_positioned.dart';

const String HOME = "/";
const String ANIMATED_CONTAINER = "ANIMATED_CONTAINER";
const String ANIMATED_PADDING = "ANIMATED_PADDING";
const String ANIMATED_POSITIONED = "ANIMATED_POSITIONED";

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  print(routeSettings.name);

  switch (routeSettings.name) {
    case HOME:
      return MaterialPageRoute(builder: (context) => Home());
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
