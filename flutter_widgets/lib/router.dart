import 'package:flutter/material.dart';
import 'home.dart';
import 'unknown.dart';
import 'menus/sf_popupmenubutton.dart';
import 'menus/sl_popupmenubutton.dart';
import 'lists/list_images.dart';

const String HOME = "/";
const String POP_UP_MENU_BUTTON_SL = 'popupMenuButton_sl';
const String POP_UP_MENU_BUTTON_SF = 'popupMenuButton_sf';
const String LIST_IMAGES = 'LIST_IMAGES';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  print(routeSettings.name);

  switch(routeSettings.name) {
    case HOME:
      return MaterialPageRoute(builder: (context) => Home());
      break;

    case POP_UP_MENU_BUTTON_SF:
      return MaterialPageRoute(builder: (context) => PopupMenuButtonWidgetStateFul());
      break;

    case POP_UP_MENU_BUTTON_SL:
      return MaterialPageRoute(builder: (context) => PopupMenuButtonWidgetStateLess());
      break;

    case LIST_IMAGES:
      return MaterialPageRoute(builder: (context) => ImageListView());
      break;

    default:
      return MaterialPageRoute(builder: (context) => UnknownView());

  }
}