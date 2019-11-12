import 'package:flutter/material.dart';
import 'home.dart';
import 'unknown.dart';
import 'animations/anim_container.dart';

const String HOME = "/";
const String ANIMATED_CONTAINER = "ANIMATED_CONTAINER";

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  print(routeSettings.name);

  switch (routeSettings.name) {
    case HOME:
      return MaterialPageRoute(builder: (context) => Home());
      break;

    case ANIMATED_CONTAINER:
      return MaterialPageRoute(builder: (context) => AnimatedContainerDemo());
      break;

    default:
      return MaterialPageRoute(builder: (context) => UnknownView());
  }
}
