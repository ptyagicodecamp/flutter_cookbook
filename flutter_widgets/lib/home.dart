import 'package:flutter/material.dart';

import 'recipes.dart';
import 'router.dart' as router;

final List<RecipeWidget> recipes = [
  RecipeWidget(
      "Navigation & Routing",
      "Navigation and Routing in Flutter App",
      router.NAV_APP,
      "lib/navigation/page_list_1.dart",
      "https://github.com/ptyagicodecamp/flutter_cookbook/blob/widgets/flutter_widgets/lib/navigation/page_list_1.dart"),
  RecipeWidget(
      "Persisting Products in Local DB",
      "Persisting Data in Local DB using sqflite plugin",
      router.LOCAL_DB,
      "lib/persistence/ecom.dart",
      "https://github.com/ptyagicodecamp/flutter_cookbook/blob/widgets/flutter_widgets/lib/persistence/ecom.dart"),
  RecipeWidget(
      "Paint Canvas",
      "Drawing and Painting using CustomPainter",
      router.CANVAS_PAINTING,
      "lib/canvas/painting.dart",
      "https://github.com/ptyagicodecamp/flutter_cookbook/blob/widgets/flutter_widgets/lib/canvas/painting.dart"),
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
      "lib/themes/sharedPrefs/themes_sharedPrefs.dart",
      "https://github.com/ptyagicodecamp/flutter_cookbook/tree/widgets/flutter_widgets/lib/themes/sharedPrefs/themes_sharedPrefs.dart"),
  RecipeWidget(
      "Theme Caching (Moor)",
      "Save current theme in local database",
      router.THEMES_DEMO_DB,
      "lib/themes/db/themes_db.dart",
      "https://github.com/ptyagicodecamp/flutter_cookbook/tree/widgets/flutter_widgets/lib/themes/db/themes_db.dart"),
  RecipeWidget(
      "Themes in Action ",
      "Toggle between Light & Dark themes",
      router.THEMES_DEMO,
      "lib/themes/themes_demo.dart",
      "https://github.com/ptyagicodecamp/flutter_cookbook/tree/widgets-web/flutter_widgets/lib/themes/themes_demo.dart"),
  RecipeWidget(
      "Text-To-Speech Plugin",
      "Code recipe to demonstrate usage of tts Flutter plugin",
      router.TTS_PLUGIN,
      "lib/tts/tts_sample.dart",
      "https://github.com/ptyagicodecamp/flutter_cookbook/tree/widgets/flutter_widgets/lib/tts/tts_sample.dart"),
  RecipeWidget(
      "Loading Image",
      "Loading image from Firebase Storage",
      router.LOAD_IMAGE_FIR_STORAGE,
      "lib/images/load_image.dart",
      "https://github.com/ptyagicodecamp/flutter_cookbook/tree/widgets/flutter_widgets/lib/images/load_image.dart"),
  RecipeWidget(
      "Slider Demo",
      "Slider snd Range Slider",
      router.SLIDER_DEMO,
      "lib/sliders/slider_demo.dart",
      "https://github.com/ptyagicodecamp/flutter_cookbook/tree/widgets/flutter_widgets/lib/sliders/slider_demo.dart"),
  RecipeWidget(
      "ColorFilter",
      "Blends two colors. Released in Flutter 1.9",
      router.COLOR_FILTER_DEMO,
      "lib/quizzie/quizze_demo.dart",
      "https://github.com/ptyagicodecamp/flutter_cookbook/tree/widgets-web/flutter_widgets/lib/quizzie/quizze_demo.dart"),
  RecipeWidget(
      "Login (Firebase / GoogleSignIn)",
      "Login functionality using two ways: 1. Google SignIn, 2. Email/password",
      router.FIREBASE_LOGIN,
      "lib/login/firebase_login.dart",
      "https://github.com/ptyagicodecamp/flutter_cookbook/tree/widgets-web/flutter_widgets/lib/login/firebase_login.dart"),
  RecipeWidget(
      "Switch ListTile",
      "Clickable link to Privacy Policy",
      router.SWITCH_LISTTILE_1,
      "lib/swtch/switch_list_tile1.dart",
      "https://github.com/ptyagicodecamp/flutter_cookbook/tree/widgets/flutter_widgets/lib/swtch/switch_list_tile1.dart"),
  RecipeWidget(
      "Popup Menu Button (Stateful)",
      "",
      router.POP_UP_MENU_BUTTON_SF,
      "lib/menus/sf_popupmenubutton.dart",
      "https://github.com/ptyagicodecamp/flutter_cookbook/tree/popupmenubutton-web/flutter_widgets/lib/menus/sf_popupmenubutton.dart"),
  RecipeWidget(
      "Popup Menu Button (Stateless)",
      "",
      router.POP_UP_MENU_BUTTON_SL,
      "lib/menus/sl_popupmenubutton.dart",
      "https://github.com/ptyagicodecamp/flutter_cookbook/tree/popupmenubutton-web/flutter_widgets/lib/menus/sl_popupmenubutton.dart"),
  RecipeWidget(
      "Image in ListView",
      "Images loaded in list view",
      router.LIST_IMAGES,
      "lib/lists/list_images.dart",
      "https://github.com/ptyagicodecamp/flutter_cookbook/tree/widgets/flutter_widgets/lib/lists/list_images.dart"),
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
        title: Text('Flutter Cookbook'),
      ),
      body: ListView.builder(
          itemCount: recipes.length,
          itemBuilder: (BuildContext context, int index) {
            return recipes[index];
          }),
    );
  }
}
