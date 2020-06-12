import 'package:flutter/material.dart';

import 'item.dart';
import 'notfound.dart';
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
        home: PageListing(),
        //Part#3. Named with onGenerateRoute
        initialRoute: '/',
        onGenerateRoute: generateRoute,
      ),
    );

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  final args = routeSettings.arguments;

  switch (routeSettings.name) {
    case '/':
      return MaterialPageRoute(
        builder: (context) => PageListing(),
      );

    case '/details':
      if (args is Item) {
        return MaterialPageRoute(
          builder: (context) => PageDetails(
            item: args,
          ),
        );
      }

      return MaterialPageRoute(
        builder: (context) => PageNotFound(),
      );

    default:
      return MaterialPageRoute(
        builder: (context) => PageNotFound(),
      );
  }
}

class PageListing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Named Routes (onGenerateRoute)'),
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
    //Part#3. Named route
    final result = await Navigator.pushNamed(
      context,
      '/details',
      arguments: item,
    );

    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text("$result")));
  }
}
