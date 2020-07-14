import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() => runApp(LottieDemoPage());

class LottieDemoPage extends StatefulWidget {
  @override
  _LottieDemoPageState createState() => _LottieDemoPageState();
}

class _LottieDemoPageState extends State<LottieDemoPage>
    with TickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  var count = 1;

  increment() {
    setState(() {
      count += 2;
      _animationController.duration = Duration(seconds: count);
    });
  }

  @override
  Widget build(BuildContext context) {
    Function function = increment();

    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => function,
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Lottie.network(
                'https://assets10.lottiefiles.com/private_files/lf30_TZmCSb.json',
                controller: _animationController,
                onLoaded: (composition) {
                  _animationController
                    ..addStatusListener(
                      (status) {
                        if (status == AnimationStatus.completed) {
                          _animationController.reverse();
                        } else if (status == AnimationStatus.dismissed) {
                          _animationController.forward();
                        }
                      },
                    )
                    ..forward();

                  return composition;
                },
                fit: BoxFit.contain,
              ),
            ),
            Divider(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Lottie.network(
                'https://assets3.lottiefiles.com/packages/lf20_SedlEa.json',
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
