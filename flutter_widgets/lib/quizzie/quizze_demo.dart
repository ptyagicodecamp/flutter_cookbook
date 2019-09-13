import 'package:flutter/material.dart';
import 'package:flutter_widgets/quizzie/quizze_page.dart';

void main() => runApp(QuizzieDemo());

class QuizzieDemo extends StatefulWidget {
  @override
  _QuizzieDemoState createState() => _QuizzieDemoState();
}

class _QuizzieDemoState extends State<QuizzieDemo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizPage(),
    );
  }
}
