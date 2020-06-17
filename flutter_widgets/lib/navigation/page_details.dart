import 'package:flutter/material.dart';

import 'item.dart';

class PageDetails extends StatelessWidget {
  final Item item;

  const PageDetails({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: Column(
        children: [
          Image.asset(item.image),
          SizedBox(
            height: 10,
          ),
          Text(
            item.details,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.favorite_border),
        onPressed: () {
          //Current item's name along with message is sent back to last screen
          Navigator.pop(context, '${item.name} is marked as favorite.');
        },
      ),
    );
  }
}
