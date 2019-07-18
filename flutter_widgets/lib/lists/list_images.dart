import 'package:flutter/material.dart';

class ImageListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Widgets'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: <Widget>[
          Container(
              height: 150,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 2.0),
                    shape: BoxShape.rectangle,
                    color: Colors.blueAccent,
                    image: DecorationImage(
                        image: ExactAssetImage('assets/images/sea-rocks.jpg'),
                        fit: BoxFit.cover)),
              )),
          SizedBox(height: 20,),
          Container(
              height: 150,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 2.0),
                    shape: BoxShape.rectangle,
                    color: Colors.blueAccent,
                    image: DecorationImage(
                        image: ExactAssetImage('assets/images/sea2.jpg'),
                        fit: BoxFit.fill)),
              )),
          SizedBox(height: 20,),
          Container(
              height: 150,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 2.0),
                    shape: BoxShape.rectangle,
                    color: Colors.blueAccent,
                    image: DecorationImage(
                        image: ExactAssetImage('assets/images/sea3.jpg'),
                        fit: BoxFit.fill)),
              ))
        ],
      ),
    );
  }
}
