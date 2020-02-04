import 'package:flutter/material.dart';
import 'router.dart' as router;
import 'recipes.dart';

final List<RecipeWidget> recipes = [
  RecipeWidget(
      "Loading PDF",
      "Loading PDF file from Firebase Storage",
      router.LOAD_PDF_FIR_STORAGE,
      "lib/pdf/load_pdf.dart",
      "https://github.com/ptyagicodecamp/flutter_cookbook/blob/widgets/flutter_widgets/lib/pdf/load_pdf.dart"),
  RecipeWidget(
      "Theme Caching (SharedPreferences)",
      "Save current theme using SharedPrefs",
      router.THEMES_DEMO_SHAREDPREFS,
      "",
      ""),
  RecipeWidget("Theme Caching (Moor)", "Save current theme in local database",
      router.THEMES_DEMO_DB, "", ""),
  RecipeWidget("Themes in Action ", "Toggle between Light & Dark themes",
      router.THEMES_DEMO, "", ""),
  RecipeWidget(
      "Text-To-Speech Plugin",
      "Code recipe to demonstrate usage of tts Flutter plugin",
      router.TTS_PLUGIN,
      "",
      ""),
  RecipeWidget("Loading Image", "Loading image from Firebase Storage",
      router.LOAD_IMAGE_FIR_STORAGE, "", ""),
  RecipeWidget(
      "Slider Demo", "Slider snd Range Slider", router.SLIDER_DEMO, "", ""),
  RecipeWidget("ColorFilter", "Blends two colors. Released in Flutter 1.9",
      router.COLOR_FILTER_DEMO, "", ""),
  RecipeWidget(
      "Login (Firebase / GoogleSignIn)",
      "Login functionality using two ways: 1. Google SignIn, 2. Email/password",
      router.FIREBASE_LOGIN,
      "",
      ""),
  RecipeWidget("Switch ListTile", "Clickable link to Privacy Policy",
      router.SWITCH_LISTTILE_1, "", ""),
  RecipeWidget(
      "Popup Menu Button (Stateful)", "", router.POP_UP_MENU_BUTTON_SF, "", ""),
  RecipeWidget("Popup Menu Button (Stateless)", "",
      router.POP_UP_MENU_BUTTON_SL, "", ""),
  RecipeWidget("Image in ListView", "Images loaded in list view",
      router.LIST_IMAGES, "", ""),
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
