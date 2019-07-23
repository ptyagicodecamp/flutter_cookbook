import 'package:flutter/material.dart';
import 'package:flutter_widgets/router.dart';
import 'webview.dart';
import 'util.dart';

class PopupMenuButtonWidgetStateLess extends StatelessWidget {
  String choice = "Click Settings to make your selection";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PopupMenuButton (Stateless)'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (value) => Navigator.pushNamed(context, WEBVIEW,
                arguments: WebViewArguments(
                    title: displayString(value), url: linkUrl(value))),
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
        child: Text(
          choice,
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }

  void optionSelected(NavLinks link) {
    print(link);
    choice = link.toString();
  }

}
