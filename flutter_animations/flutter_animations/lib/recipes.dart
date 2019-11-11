import 'package:flutter/material.dart';

class RecipeWidget extends StatelessWidget {
  String name;
  String description;
  String pageName;

  RecipeWidget(this.name, this.description, this.pageName);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              this.name,
              style: TextStyle(fontSize: 20),
            ),
          ),
          subtitle: Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(this.description, style: TextStyle(fontSize: 15))),
          isThreeLine: true,
          onTap: () => Navigator.pushNamed(context, this.pageName),
        ),
        Divider(
          color: Colors.blue,
        ),
      ],
    );
  }
}
