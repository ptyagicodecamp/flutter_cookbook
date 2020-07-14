import 'package:flutter/material.dart';

import 'recipes.dart';
import 'router.dart' as router;

final List<RecipeWidget> recipes = [
  RecipeWidget("Custom Lottie Animation", "Modified Lottie animation (JSON)",
      router.CUSTOM_LOTTIE_ANIM),
  RecipeWidget(
      "Lottie Animation", "Lottie animation (JSON)", router.LOTTIE_ANIM),
  RecipeWidget(
      "ColorTween Animation",
      "Implement animation using ColorTween for Android, iOS and WebApp.",
      router.COLOR_TWEEN),
  RecipeWidget("AnimatedContainer widget",
      "Animating Container - Curves explorations", router.ANIMATED_CONTAINER),
  RecipeWidget("AnimatedPadding widget",
      "Animating Container - Curves explorations", router.ANIMATED_PADDING),
  RecipeWidget("AnimatedPositioned widget",
      "Animating Positioned - Curves explorations", router.ANIMATED_POSITIONED),
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
