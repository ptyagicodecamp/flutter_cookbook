import 'package:flutter/material.dart';

class SnackbarRecipe extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Snackbar"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Snackbar"),
          onPressed: () {
            buildSnackbar(context, 'UNDO', 'Snackbar demo message');
          },
        ),
      ),
    );
  }

  Widget buildSnackbar(BuildContext context, String label, String message) {

    final snackBar =SnackBar(
        content: Text(message),
        action: SnackBarAction(
          label: label,
          onPressed: () {},
        ));

    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
}