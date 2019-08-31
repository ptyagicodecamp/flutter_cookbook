import 'package:flutter/material.dart';

class LogInButton extends StatelessWidget {
  LogInButton(
      {this.key,
        this.text,
        this.height,
        this.onPressed,
        this.backgroundColor})
      : super(key: key);
  Key key;
  String text;
  double height;
  VoidCallback onPressed;
  Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return new ConstrainedBox(
      constraints: BoxConstraints.expand(height: height),
      child: new RaisedButton(
          child: new Text(text,
              style: TextStyle(color: Colors.white, fontSize: 20.0)),
          shape: new RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(height / 2))),
          color: backgroundColor,
          textColor: Colors.black87,
          onPressed: onPressed),
    );
  }
}