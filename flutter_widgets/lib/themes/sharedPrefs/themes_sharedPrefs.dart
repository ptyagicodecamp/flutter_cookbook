import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/themes/sharedPrefs/themes_notifier_sp.dart';
import 'package:provider/provider.dart';

class ThemesSharedPrefsCaching extends StatefulWidget {
  @override
  _ThemesSharedPrefsCachingState createState() =>
      _ThemesSharedPrefsCachingState();
}

class _ThemesSharedPrefsCachingState extends State<ThemesSharedPrefsCaching> {
  @override
  Widget build(BuildContext context) {
    Provider.of<ThemesNotifierSharedPrefs>(context)
        .loadActiveThemeData(context);
    return MaterialApp(
        theme: Provider.of<ThemesNotifierSharedPrefs>(context).currentThemeData,
        home: Scaffold(
          appBar: AppBar(
            title: Text("Theme Caching (SharedPreference)"),
          ),
          body: body(),
        ));
  }

  Widget body() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16.0),
            child: Image.asset(
              "assets/images/sea-rocks.jpg",
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Beautiful Ocean",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 30,
          ),
          RaisedButton(
            child: Text("Switch Theme"),
            onPressed: () {
              Provider.of<ThemesNotifierSharedPrefs>(context)
                  .switchTheme(context);
            },
          ),
        ],
      ),
    );
  }
}
