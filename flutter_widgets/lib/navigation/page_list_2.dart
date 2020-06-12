import 'package:flutter/material.dart';

import 'item.dart';
import 'page_details.dart';

List<Item> seasideList = [
  Item(
      name: 'Sea 1',
      image: 'assets/images/sea2.jpg',
      details: "Ocean view for Sea 1"),
  Item(
      name: 'Sea 2',
      image: 'assets/images/sea3.jpg',
      details: "Ocean view for Sea 2"),
  Item(
      name: 'Sea 3',
      image: 'assets/images/sea-rocks.jpg',
      details: "Ocean view for Sea 3")
];

void main() => runApp(
      MaterialApp(
//        home: PageListing(),
        //Part#2. Named route using Map
        routes: <String, WidgetBuilder>{
          '/': (BuildContext context) => PageListing(),
          '/details': (BuildContext context) => PageDetails(
                item: seasideList[0],
              ),
        },
      ),
    );

class PageListing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Named Routes (Map)'),
      ),
      body: ListView.builder(
          itemCount: seasideList != null ? seasideList.length : 0,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: ExactAssetImage(seasideList[index].image),
              ),
              title: Text("${seasideList[index].name}"),
              subtitle: Text("${seasideList[index].details}"),
              onTap: () {
                _navigateToPageDetails(context, seasideList[index]);
              },
            );
          }),
    );
  }

  _navigateToPageDetails(BuildContext context, Item item) async {
    //Part#2. Named route
    final result = await Navigator.pushNamed(context, '/details');

    // After the PageDetails returns a result, hide any previous snackbars
    // and show the new result.
    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text("$result")));
  }
}
