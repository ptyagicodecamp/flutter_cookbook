import 'package:flutter/material.dart';
import 'dialogflow/flutter_facts.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch(routeSettings.name) {
    case '/':
      return MaterialPageRoute(builder: (context) => FlutterFacts());
  }
}