import 'package:flutter/material.dart';
import 'router.dart' as router;

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Widgets'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  gradient: new LinearGradient(
                    colors: [Colors.blue, Colors.cyan],
                  ),
                  borderRadius: BorderRadius.circular(2)),
              child: Card(
                borderOnForeground: true,
                child: ListTile(
                  title: Center(
                    child: Text(
                      "Popup Menu Button (Stateful)",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  subtitle: Text(""),
                  onTap: () => Navigator.pushNamed(
                      context, router.POP_UP_MENU_BUTTON_SF),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  gradient: new LinearGradient(
                    colors: [Colors.blue, Colors.cyan],
                  ),
                  borderRadius: BorderRadius.circular(2)),
              child: Card(
                borderOnForeground: true,
                child: ListTile(
                  title: Center(
                    child: Text(
                      "Popup Menu Button (Stateless)",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  subtitle: Text(""),
                  onTap: () => Navigator.pushNamed(
                      context, router.POP_UP_MENU_BUTTON_SL),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
