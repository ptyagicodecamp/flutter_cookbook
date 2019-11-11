import 'package:flutter/material.dart';
import 'router.dart' as router;
import 'recipes.dart';

final List<RecipeWidget> recipes = [
  RecipeWidget("AnimatedContainer widget", "Animating Container",
      router.ANIMATED_CONTAINER),
];

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Widgets'),
      ),
      body: ListView.builder(
          itemCount: recipes.length,
          itemBuilder: (BuildContext context, int index) {
            return recipes[index];
          }),
    );
  }
}
