import 'package:flutter/material.dart';
import 'package:flutter_widgets/util.dart';

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
            onSelected: (NavLinks value) {
              setState(() {
                //print the selected option
                print(value);

                //Update the current choice.
                choice = displayString(value);
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
