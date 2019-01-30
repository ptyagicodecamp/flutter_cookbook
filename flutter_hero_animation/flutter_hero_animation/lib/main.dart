import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HeroAnimationRecipe(title: 'Hero Animation'),
    );
  }
}

class HeroAnimationRecipe extends StatefulWidget {
  HeroAnimationRecipe({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HeroAnimationRecipeState createState() => _HeroAnimationRecipeState();
}

class _HeroAnimationRecipeState extends State<HeroAnimationRecipe> {

  Widget _blueIconRectangle() {
    return Container(
      width: 50,
      height: 50,
      color: Colors.blue,
    );
  }

  Widget _blueDetailRectangle() {
    return Container(
      width: 200,
      height: 200,
      color: Colors.blue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: buildDemoWidget(context),
    );
  }

  Widget buildDemoWidget(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          ListTile(
            leading: GestureDetector(
              child: Hero(
                tag: 'hero-rectangle',
                child: _blueIconRectangle(),
              ),
              onTap: () => _gotoDetailsPage(context),
            ),
            title: Text('Tap on the icon to view hero animation transition.'),
          ),
        ],
      ),
    );
  }

  void _gotoDetailsPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (ctx) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: 'hero-rectangle',
                child: _blueDetailRectangle(),
              ),
              Text(
                  'This is where you can see details about the list item tapped at previous page.'),
            ],
          ),
        ),
      ),
    ));
  }
}
