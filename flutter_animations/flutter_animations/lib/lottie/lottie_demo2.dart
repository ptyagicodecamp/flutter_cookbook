import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() => runApp(CustomLottieDemoPage());

class CustomLottieDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Lottie Demo"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Lottie.asset(
                "assets/lottie/sky2.json",
                repeat: true,
                reverse: false,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
