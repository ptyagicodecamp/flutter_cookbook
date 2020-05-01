import 'package:flutter/material.dart';

import 'ecom_db.dart';

//Uncomment this line to run only this example.
//void main() => runApp(ProductListing());

class ProductListing extends StatefulWidget {
  @override
  _ProductListingState createState() => _ProductListingState();
}

class _ProductListingState extends State<ProductListing> {
  @override
  void initState() {
    super.initState();
    //insert demo data
    initDB();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Loading Products from DataBase"),
        ),
        //Using FutureBuilder to display data returned from async methods like Future
        body: FutureBuilder(
            future: allProducts(),
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else {
                return Container(
                  child: ListView.builder(
                    itemCount: snapshot.data.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          positionedBlock(context, snapshot.data[index]),
                          Divider(
                            thickness: 2,
                          ),
                        ],
                      );
                    },
                  ),
                );
              }
            }),
      ),
    );
  }

  Widget positionedBlock(BuildContext context, Product product) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: MediaQuery.of(context).size.height / 2,
        child: Stack(
          children: <Widget>[
            Positioned(
              left: MediaQuery.of(context).size.width / 2 - 100,
              top: 150,
              right: 5,
              bottom: 100,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  color: Colors.amber[700],
                ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0, top: 8.0),
                    child: Column(
                      children: [
                        Text(
                          product.title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${product.description}',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Price: ${product.price}',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 10,
              top: 70,
              right: MediaQuery.of(context).size.width / 2,
              bottom: 70,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2.0, // has the effect of softening the shadow
                      offset: Offset(
                        2.0, // horizontal, move right 10
                        5.0, // vertical, move down 10
                      ),
                    ),
                  ],
                ),
                child: Image.asset('assets/images/${product.image}'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
