import 'package:flutter_web/material.dart';

enum NavLinks { Home, Github, Videos, Jobs }

class PopupMenuButtonWidgetStateLess extends StatelessWidget {
  String choice = "Click Settings to make your selection";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PopupMenuButton (Stateless)'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: optionSelected,
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
      body: Center(
        child: Text(choice, style: TextStyle(fontSize: 30),),
      ),
    );
  }

  void optionSelected(NavLinks link) {
    print(link);
    choice = link.toString();
  }

  String displayString(NavLinks link) {
    switch (link) {
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

      default:
        return "";
    }
  }
}
