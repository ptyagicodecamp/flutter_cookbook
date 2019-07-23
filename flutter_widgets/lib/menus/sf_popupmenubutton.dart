import 'package:flutter/material.dart';
import 'util.dart';

class PopupMenuButtonWidgetStateFul extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PopupMenuButtonWidgetState();
}

class _PopupMenuButtonWidgetState extends State {
  String choice = "Click Settings to make your selection";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PopupMenuButton (Stateful)'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (NavLinks link) {
              setState(() {
                choice = displayString(link);
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
      body: Center(
        child: Text(choice, style: TextStyle(fontSize: 30),),
      ),
    );
  }
}
