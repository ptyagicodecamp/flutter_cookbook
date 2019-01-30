import 'package:flutter/material.dart';

//starting the app
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Cookbook',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.green,
      ),
      home: AnimatedOpacityRecipe(title: 'AnimatedOpacity Demo'),
    );
  }
}

class AnimatedOpacityRecipe extends StatefulWidget {
  final String title;

  AnimatedOpacityRecipe({Key key, this.title}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _AnimatedOpacityRecipeState();
}

class _AnimatedOpacityRecipeState extends State<AnimatedOpacityRecipe> {
  bool _visible = true;

  Widget _blueRectangle() {
    return Container(
      width: 100,
      height: 150,
      color: Colors.blue,
    );
  }

  Widget animatedOpacityWidget() {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 900),
      opacity: _visible ? 1 : 0,
      child: _blueRectangle(),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(widget.title),
      ),
      body: buildDemoComponent(context),
    );
  }

  Widget buildDemoComponent(BuildContext context) {
    return Material(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              child: Text(
                  'Press button to see blue rectangle fade out and in'
              ),
              padding: EdgeInsets.all(20.0),
            ),
            animatedOpacityWidget(),
            OutlineButton(
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(8.0),
              ),
              child: Text("Press to Animate"),
              onPressed: () {
                //Toggles visibility of the rectangle
                setState(() => _visible = !_visible);
              },
            )
          ],
        ),
      ),
    );
  }
}