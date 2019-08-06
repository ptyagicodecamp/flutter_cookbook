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
                      "ColorTweenAnimationDemo",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  subtitle: Text("Grey background turns Blue on correct selection."),
                  onTap: () => Navigator.pushNamed(
                      context, router.COLOR_TWEEN),
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
                      "Shake Animation",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  subtitle: Text("Wrong selection will shake sideways"),
                  onTap: () => Navigator.pushNamed(
                      context, router.SHAKE_ANIM),
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
                      "Tween Animation",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  subtitle: Text("Tick-Tock like animation. Combining Tween and ColorTween animations"),
                  onTap: () => Navigator.pushNamed(
                      context, router.DOUBLE_TWEEN),
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
                      "AnimationController Demo (Snowflake)",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  subtitle: Text("Falling snowflake"),
                  onTap: () => Navigator.pushNamed(
                      context, router.BASIC_ANIM),
                ),
              ),
            ),
          ),
//          Padding(
//            padding: EdgeInsets.all(8.0),
//            child: Container(
//              decoration: BoxDecoration(
//                  color: Colors.blueAccent,
//                  gradient: new LinearGradient(
//                    colors: [Colors.blue, Colors.cyan],
//                  ),
//                  borderRadius: BorderRadius.circular(2)),
//              child: Card(
//                borderOnForeground: true,
//                child: ListTile(
//                  title: Center(
//                    child: Text(
//                      "Swipe Animation",
//                      style: TextStyle(fontSize: 20),
//                    ),
//                  ),
//                  subtitle: Text("Right Swipe demonstration"),
//                  onTap: () => Navigator.pushNamed(
//                      context, router.SWIPE_ANIM),
//                ),
//              ),
//            ),
//          ),
//          Padding(
//            padding: EdgeInsets.all(8.0),
//            child: Container(
//              decoration: BoxDecoration(
//                  color: Colors.blueAccent,
//                  gradient: new LinearGradient(
//                    colors: [Colors.blue, Colors.cyan],
//                  ),
//                  borderRadius: BorderRadius.circular(2)),
//              child: Card(
//                borderOnForeground: true,
//                child: ListTile(
//                  title: Center(
//                    child: Text(
//                      "Swipe & Rotate",
//                      style: TextStyle(fontSize: 20),
//                    ),
//                  ),
//                  subtitle: Text("Swipe & Rotate animations in one sample"),
//                  onTap: () => Navigator.pushNamed(
//                      context, router.SWIPE_ANIM_ROTATE),
//                ),
//              ),
//            ),
//          ),
        ],
      ),
    );
  }
}
