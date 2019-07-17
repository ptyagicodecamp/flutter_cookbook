import 'package:flutter/material.dart';
import 'router.dart' as router;

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Example Dialogflow Flutter',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: router.generateRoute,
      initialRoute: '/',
    );
  }
}