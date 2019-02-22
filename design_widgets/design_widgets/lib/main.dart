import 'package:design_widgets/snackbar.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());
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
      initialRoute: '/',
      routes: {
        // When we navigate to the "/" route, build the DesignWidgetsRecipes Widget
       // '/': (context) => DesignWidgetsRecipes(),
        '/snackbar': (context) => SnackbarRecipe(),
        '/sliver_floating': (context) => SnackbarRecipe(),
        '/sliver_pinned': (context) => SnackbarRecipe(),
        '/sliver_snap': (context) => SnackbarRecipe(),

      },
    );
  }
}

class RecipeEntry {
  final String key;
  final String title;
  final List<RecipeEntry> children;
  const RecipeEntry(this.key, this.title,
      [this.children = const <RecipeEntry>[]]);
}

const List<RecipeEntry> entries = <RecipeEntry>[
  RecipeEntry('snackbar', 'Snackbar'),
  RecipeEntry(
    '/',
    'Sliver AppBar',
    <RecipeEntry>[
      RecipeEntry('sliver_floating', 'Floating Sliver AppBar'),
      RecipeEntry('sliver_pinned', 'Pinned Sliver AppBar'),
      RecipeEntry('sliver_snap', 'Snap Sliver AppBar')
    ],
  ),
];



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
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            RecipeEntryItem(context, entries[index]),
        itemCount: entries.length,
      ),
    );
  }

//  Widget buildListView(BuildContext context) {
//    var listTiles = <Widget>[
//      ListTile(
//        title: const Text('Sliver AppBar'),
//        subtitle: const Text('An auto-hide AppBar'),
//        leading: const Icon(Icons.flare),
//        onTap: () {
//          //buildSnackbar(context, '', 'Silverbar Demo');
//        },
//      ),
//      Divider(),
//      ListTile(
//        title: const Text('Snackbar'),
//        subtitle:
//            const Text('Widget to show status and take in-context action'),
//        leading: const Icon(Icons.message),
//        onTap: () {
//          Navigator.push(
//            context,
//            MaterialPageRoute(builder: (context) => SnackbarRecipe()),
//          );
//        },
//      ),
//    ];
//
//    return ListView(
//      children: listTiles,
//    );
//  }
}

class ListItem {
  String name;
  Icon icon;

  ListItem(String name, Icon icon) {
    this.name = name;
    this.icon = icon;
  }
}

// Displays one RecipeEntry. RecipeEntry's children are shown in ExpansionTile (s).
class RecipeEntryItem extends StatelessWidget {
  const RecipeEntryItem(this.context, this.entry);

  final RecipeEntry entry;
  final BuildContext context;

  Widget _buildListTiles(RecipeEntry root) {
    if (root.children.isEmpty)
      return ListTile(
        title: Text(root.title),
        onTap: () {
          Navigator.pushNamed(context, "/" + root.key);
        },
      );
    return ExpansionTile(
      key: PageStorageKey<RecipeEntry>(root),
      title: Text(root.title),
      children: root.children.map(_buildListTiles).toList(),
    );
  }

  navigateToRecipe() {
    Navigator.of(this.context).push(new MaterialPageRoute(builder: (context) {
      return new SnackbarRecipe();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return _buildListTiles(entry);
  }
}
