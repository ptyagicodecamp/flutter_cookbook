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

//Using Direct Navigation (un-named routing)
void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PageListing(),
      ),
    );

class PageListing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Shows the name of navigation type/routing used
      appBar: AppBar(
        title: Text('Un-Named Routes'),
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
                //Tapping on listItem navigates to PageDetails
                _navigateToPageDetails(context, seasideList[index]);
              },
            );
          }),
    );
  }

  //Launches PageDetails and awaits the results from Navigator.pop() called from PageDetails.
  _navigateToPageDetails(BuildContext context, Item item) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the PageDetails Screen.

    //Navigation implementations are different for each part.
    //Part#1. Un-named
    final resultFromPageDetails = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PageDetails(
          item: item,
        ),
      ),
    );

    //snackbars is used to display the result returned from another page.
    //Hide any previous snackbars and show the new resultFromPageDetails.
    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text("$resultFromPageDetails")));
  }
}
