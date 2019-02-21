import 'package:design_widgets/snackbar.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class RecipeEntry {
  final String title;
  final List<RecipeEntry> children;
  const RecipeEntry(this.title, [this.children = const <RecipeEntry>[]]);
}

const List<RecipeEntry> entries = <RecipeEntry>[
  RecipeEntry(
    'Snackbar'
  ),
  RecipeEntry(
    'Sliver AppBar',
    <RecipeEntry>[
      RecipeEntry('Floating SliverAppBar'),
      RecipeEntry('Pinned SliverAppBar'),
      RecipeEntry('Snap SliverAppBar')
    ],
  ),
];
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DesignWidgetsRecipes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DesignWidgetsRecipes(title: 'Design Widgets Recipes'),
    );
  }
}

class DesignWidgetsRecipes extends StatefulWidget {
  DesignWidgetsRecipes({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DesignWidgetsRecipesState createState() => _DesignWidgetsRecipesState();
}

class _DesignWidgetsRecipesState extends State<DesignWidgetsRecipes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: buildListView(context),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget buildListView(BuildContext context) {
    var listTiles = <Widget>[
      ListTile(
        title: const Text('Silver AppBar'),
        subtitle: const Text('An auto-hide AppBar'),
        leading: const Icon(Icons.flare),
        onTap: () {
          //buildSnackbar(context, '', 'Silverbar Demo');
        },
      ),
      Divider(),
      ListTile(
        title: const Text('Snackbar'),
        subtitle:
            const Text('Widget to show status and take in-context action'),
        leading: const Icon(Icons.message),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SnackbarRecipe()),
          );
        },
      ),
    ];

    return ListView(
      children: listTiles,
    );
  }


}

class ListItem {
  String name;
  Icon icon;

  ListItem(String name, Icon icon) {
    this.name = name;
    this.icon = icon;
  }
}

