import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BottomNavigationBarRecipe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BottomNavigationBarRecipe(title: 'Flutter Demo Home Page'),
    );
  }
}

class BottomNavigationBarRecipe extends StatefulWidget {
  BottomNavigationBarRecipe({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _BottomNavigationBarRecipeState createState() => _BottomNavigationBarRecipeState();
}

class _BottomNavigationBarRecipeState extends State<BottomNavigationBarRecipe> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Checkout BottomNavigationBar in action below'),
      ),
      bottomNavigationBar: BottomAppBar(
          child: Row(
            children: <Widget>[
              // Bottom that pops up from the bottom of the screen.
              IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  showModalBottomSheet<Null>(
                    context: context,
                    builder: (BuildContext context) => openBottomDrawer(),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  Fluttertoast.showToast(msg: 'Clicked on Search menu action.');
                },
              ),
              IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {
                  Fluttertoast.showToast(msg: 'This is where overflow menu actions will go');
                },
              ),
            ],
          )),
    );
  }

  //This drawer is opened in modal bottom sheet
  Widget openBottomDrawer() {
    return Drawer(
      child: Column(
        children: const <Widget>[
          //Add menu item to edit
          const ListTile(
            leading: const Icon(Icons.mode_edit),
            title: const Text('Edit'),
          ),
          const ListTile(
            //Add menu item to add a new item
            leading: const Icon(Icons.add),
            title: const Text('Add'),
          ),
        ],
      ),
    );
  }
}
