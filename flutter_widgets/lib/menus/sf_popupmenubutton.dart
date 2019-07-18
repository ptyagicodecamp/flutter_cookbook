import 'package:flutter/material.dart';

enum NavLinks { Home, Github, Videos, Jobs }

class PopupMenuButtonWidgetStateFul extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PopupMenuButtonWidgetState();
}

class _PopupMenuButtonWidgetState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PopupMenuButton Widget'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (NavLinks value) {
              setState(() {
                print(value);
              });
            },
            itemBuilder: (BuildContext context) {
              return NavLinks.values.map((link) {
                return PopupMenuItem(
                  value: link,
                  child: Text(displayString(link)),
                );
              }).toList();
            },
          ),
        ],
      ),
    );
  }

  String displayString(NavLinks link) {
    switch(link) {
      case NavLinks.Home:
        return "Home";
        break;

      case NavLinks.Github:
        return "Github";
        break;
      case NavLinks.Videos:
        return "Videos";
        break;

      case NavLinks.Jobs:
        return "Jobs";
        break;
    }
  }
}
