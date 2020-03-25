import 'package:flutter/material.dart';
import 'package:flutter_widgets/canvas/painting.dart';
import 'package:flutter_widgets/codefile.dart';
import 'package:flutter_widgets/images/load_image.dart';
import 'package:flutter_widgets/login/login_page.dart';
import 'package:flutter_widgets/pdf/load_pdf.dart';
import 'package:flutter_widgets/plugins/db/shared.dart';
import 'package:flutter_widgets/screen_args.dart';
import 'package:flutter_widgets/themes/db/theme_prefs.dart';
import 'package:flutter_widgets/plugins/firetop/change_notifier.dart';
import 'package:flutter_widgets/themes/db/themes_db.dart';
import 'package:flutter_widgets/themes/db/themes_notifier_db.dart';
import 'package:flutter_widgets/themes/sharedPrefs/themes_notifier_sp.dart';
import 'package:flutter_widgets/themes/sharedPrefs/themes_sharedPrefs.dart';
import 'package:flutter_widgets/themes/themes_demo.dart';
import 'package:flutter_widgets/themes/themes_notifier.dart';
import 'package:flutter_widgets/tts/tts_sample.dart';
import 'package:provider/provider.dart';
import 'home.dart';
import 'lists/list_images.dart';
import 'login/user_profile.dart';
import 'swtch/switch_list_tile1.dart';
import 'unknown.dart';
import 'menus/sf_popupmenubutton.dart';
import 'menus/sl_popupmenubutton.dart';
import 'menus/webview.dart';
import 'login/firebase_login.dart';
import 'plugins/firetop/fire_auth_service.dart';
import 'sliders/slider_demo.dart';
import 'quizzie/quizze_demo.dart';

const String HOME = "/";
const String POP_UP_MENU_BUTTON_SL = '/popupMenuButton_sl';
const String POP_UP_MENU_BUTTON_SF = '/popupMenuButton_sf';
const String LIST_IMAGES = '/LIST_IMAGES';
const String WEBVIEW = '/webview';
const String SWITCH_LISTTILE_1 = 'SWITCH_LISTTILE_1';
const String FIREBASE_LOGIN = 'FIREBASE_LOGIN';
const String USER_PROFILE = 'USER_PROFILE';
const String LOGIN_PAGE = 'LOGIN_PAGE';
const String THEMES_DEMO = 'THEMES_DEMO';
const String THEMES_DEMO_DB = 'THEMES_DEMO_DB';
const String THEMES_DEMO_SHAREDPREFS = 'THEMES_DEMO_SHAREDPREFS';
const String SLIDER_DEMO = 'SLIDER_DEMO';
const String LOAD_IMAGE_FIR_STORAGE = 'LOAD_IMAGE_FIR_STORAGE';
const String TTS_PLUGIN = 'TTS_PLUGIN';
const String COLOR_FILTER_DEMO = 'COLOR_FILTER_DEMO';
const String LOAD_PDF_FIR_STORAGE = 'LOAD_PDF_FIR_STORAGE';
const String SHOW_CODE_FILE = 'SHOW_CODE_FILE';
const String CANVAS_PAINTING = 'CANVAS_PAINTING';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  print(routeSettings.name);

  switch (routeSettings.name) {
    case HOME:
      return MaterialPageRoute(builder: (context) => Home());
      break;

    case CANVAS_PAINTING:
      return MaterialPageRoute(builder: (context) => CanvasPainting());
      break;

    case SHOW_CODE_FILE:
      final ScreenArguments screenArgs = routeSettings.arguments;

      return MaterialPageRoute(
          builder: (context) => CodeFileWidget(
                pageName: screenArgs.pageName,
                recipeName: screenArgs.recipeName,
                codeFilePath: screenArgs.codeFilePath,
                codeGithubPath: screenArgs.codeGithubPath,
              ));
      break;

    case LOAD_PDF_FIR_STORAGE:
      final ScreenArguments screenArgs = routeSettings.arguments;
      return MaterialPageRoute(
          builder: (context) => LoadFirbaseStoragePdf(
                pageName: screenArgs.pageName,
                recipeName: screenArgs.recipeName,
                codeFilePath: screenArgs.codeFilePath,
                codeGithubPath: screenArgs.codeGithubPath,
              ));
      break;

    case THEMES_DEMO_SHAREDPREFS:
      return MaterialPageRoute(builder: (context) {
        return ChangeNotifierProvider<ThemesNotifierSharedPrefs>(
          child: ThemesSharedPrefsCaching(),
          builder: (BuildContext context) {
            return ThemesNotifierSharedPrefs();
          },
        );
      });
      break;

    case THEMES_DEMO_DB:
      return MaterialPageRoute(builder: (context) {
        return MultiProvider(
          providers: [
            Provider<MyDatabase>(
              builder: (_) => constructDb(logStatements: true),
              dispose: (context, db) => db.close(),
            ),
            ChangeNotifierProvider<ThemesNotifierDB>(
              builder: (_) {
                return ThemesNotifierDB();
              },
            )
          ],
          child: ThemesDBCaching(),
        );
      });
      break;

    case LIST_IMAGES:
      return MaterialPageRoute(builder: (context) => ImageListView());
      break;

    case TTS_PLUGIN:
      return MaterialPageRoute(builder: (context) => TTSPluginRecipe());
      break;

    case LOAD_IMAGE_FIR_STORAGE:
      return MaterialPageRoute(builder: (context) => LoadFirbaseStorageImage());
      break;

    case SLIDER_DEMO:
      return MaterialPageRoute(builder: (context) => SliderDemo());
    case COLOR_FILTER_DEMO:
      return MaterialPageRoute(builder: (context) => QuizzieDemo());
      break;

    case THEMES_DEMO:
      return MaterialPageRoute(builder: (context) {
        return ChangeNotifierProvider<ThemesNotifier>(
          child: ThemesDemo(),
          builder: (BuildContext context) {
            return ThemesNotifier();
          },
        );
      });
      break;

    case USER_PROFILE:
      return MaterialPageRoute(builder: (context) {
        final MyAuthUser firebaseUser = routeSettings.arguments;
        return ChangeNotifierProvider<FireAuthService>(
          child: UserProfilePage(
              currentUser: firebaseUser,
              onSignOut: () {
                Navigator.pushNamed(context, LOGIN_PAGE);
              }),
          builder: (BuildContext context) {
            return FireAuthService();
          },
        );
      });
      break;

    case LOGIN_PAGE:
      return MaterialPageRoute(builder: (context) {
        return ChangeNotifierProvider<FireAuthService>(
          child: LogInPage(
            title: 'Login',
            onSignIn: (user) => Navigator.popAndPushNamed(context, USER_PROFILE,
                arguments: user),
          ),
          builder: (BuildContext context) {
            return FireAuthService();
          },
        );
      });
      break;

    case FIREBASE_LOGIN:
      return MaterialPageRoute(builder: (context) {
        return ChangeNotifierProvider<FireAuthService>(
          child: FirebaseAuthLogin(),
          builder: (BuildContext context) {
            return FireAuthService();
          },
        );
      });
      break;

    case SWITCH_LISTTILE_1:
      return MaterialPageRoute(builder: (context) => SwitchListTile1());
      break;

    case POP_UP_MENU_BUTTON_SF:
      return MaterialPageRoute(
          builder: (context) => PopupMenuButtonWidgetStateFul());
      break;

    case POP_UP_MENU_BUTTON_SL:
      return MaterialPageRoute(
          builder: (context) => PopupMenuButtonWidgetStateLess());
      break;

    case WEBVIEW:
      return MaterialPageRoute(builder: (context) {
        final WebViewArguments args = routeSettings.arguments;
        return MyWebView(title: args.title, url: args.url);
      });
      break;

    default:
      return MaterialPageRoute(builder: (context) => UnknownView());
  }
}
