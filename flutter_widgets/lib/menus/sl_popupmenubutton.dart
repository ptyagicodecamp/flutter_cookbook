import 'package:flutter/material.dart';
import 'package:flutter_widgets/router.dart';
import 'webview.dart';
import 'package:flutter_widgets/util.dart';

class PopupMenuButtonWidgetStateLess extends StatelessWidget {
  String choice = "Click Settings to make your selection";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PopupMenuButton (Stateless)'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (value) {
              //print the selected option
              print(value);

              //Update the current choice.
              //However, this choice won't be updated in body section since it's a Stateless widget.
              choice = displayString(value);

              Navigator.pushNamed(context, WEBVIEW,
                  arguments: WebViewArguments(
                      title: displayString(value), url: linkUrl(value)));
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
      body: Center(
        child: Text(
          //Print the current choice
          choice,
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
