import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/themes/db/themes_notifier_db.dart';
import 'package:provider/provider.dart';

class ThemesDBCaching extends StatefulWidget {
  @override
  _ThemesDBCachingState createState() => _ThemesDBCachingState();
}

class _ThemesDBCachingState extends State<ThemesDBCaching> {
  @override
  Widget build(BuildContext context) {
    Provider.of<ThemesNotifierDB>(context).loadActiveThemeData(context);
    return MaterialApp(
        theme: Provider.of<ThemesNotifierDB>(context).currentThemeData,
        home: Scaffold(
          appBar: AppBar(
            title: Text("Theme DB Caching (Moor)"),
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
              Provider.of<ThemesNotifierDB>(context).switchTheme(context);
            },
          ),
        ],
      ),
    );
  }
}
