import 'package:flutter/material.dart';
class RecipeWidget extends StatelessWidget {
  String name;
  String description;
  String pageName;

  RecipeWidget(this.name, this.description, this.pageName);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(this.name),
      subtitle: Text(this.description),
      onTap: () => Navigator.pushNamed(context, this.pageName),
    );
  }
}