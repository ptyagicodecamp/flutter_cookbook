import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Basic Appbar Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BasicAppbarRecipe(title: 'Basic Appbar'),
    );
  }
}

class BasicAppbarRecipe extends StatefulWidget {
  BasicAppbarRecipe({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _BasicAppbarRecipeState createState() => _BasicAppbarRecipeState();
}

class _BasicAppbarRecipeState extends State<BasicAppbarRecipe> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        //setting the icon for the AppBar
        leading: Icon(Icons.import_contacts),
        //setting title for the AppBar
        title: Text("Contacts"),
        actions: <Widget>[
          //Setting IconButton action item to send message
          IconButton(
            icon: Icon(Icons.message),
            onPressed: () {
              //Handling click on the action items
              clicked(context, "Message sent");
            },
          ),
          //Setting Overflow action items using PopupMenuButton
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(child: IconButton(
                  icon: Icon(Icons.email),
                  onPressed: () {
                    clicked(context, "Email sent");
                  },
                ),),
              ];
            },
          )
        ],
      ),
    );
  }

  void clicked(BuildContext context, menu) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(menu),
        action: SnackBarAction(
            label: 'UNDO',
            onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}
