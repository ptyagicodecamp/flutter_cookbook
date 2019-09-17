import 'package:flutter/material.dart';
import 'router.dart' as router;
import 'recipes.dart';

final List<RecipeWidget> recipes = [
  RecipeWidget("ColorFilter", "Blends two colors. Released in Flutter 1.9",
      router.COLOR_FILTER_DEMO),
  RecipeWidget("Themes in Action ", "Toggle between Light & Dark themes",
      router.THEMES_DEMO),
  RecipeWidget(
      "Login (Firebase / GoogleSignIn)",
      "Login functionality using two ways: 1. Google SignIn, 2. Email/password",
      router.FIREBASE_LOGIN),
  RecipeWidget("Switch ListTile", "Clickable link to Privacy Policy",
      router.SWITCH_LISTTILE_1),
  RecipeWidget(
      "Popup Menu Button (Stateful)", "", router.POP_UP_MENU_BUTTON_SF),
  RecipeWidget(
      "Popup Menu Button (Stateless)", "", router.POP_UP_MENU_BUTTON_SL),
  RecipeWidget(
      "Image in ListView", "Images loaded in list view", router.LIST_IMAGES),
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
