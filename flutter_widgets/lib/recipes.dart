import 'package:flutter/material.dart';
import 'util.dart';

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
          title: Text(this.name),
          subtitle: Text(this.description),
          onTap: () => Navigator.pushNamed(context, this.pageName),
        ),
        Divider(color: Colors.blue, ),
      ],
    );
  }
}