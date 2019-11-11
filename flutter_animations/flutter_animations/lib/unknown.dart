import 'package:flutter/material.dart';
class UnknownView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recipe not found"),
      ),
      body: Center(
        child: Text("Recipe coming soo !"),
      ),
    );
  }

}