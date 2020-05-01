import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final database = db();
const tableProducts = 'products';

Future<Database> db() async {
  return openDatabase(
    join(await getDatabasesPath(), 'products_database.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE IF NOT EXISTS $tableProducts(id INTEGER PRIMARY KEY, title TEXT, description TEXT, image TEXT, price REAL)',
      );
    },
    // Version provides path to perform database upgrades and downgrades.
    version: 1,
  );
}

//Inserting demo data into database
void initDB() async {
  var prod1 = Product(
    id: 1,
    title: 'Shoes',
    description: 'Rainbow Shoes',
    image: 'shoes.jpeg',
    price: 65.0,
  );

  var prod2 = Product(
    id: 2,
    title: 'Dress',
    description: 'Summer Dress',
    image: 'dress.png',
    price: 50.0,
  );

  // Insert a product into the database.
  await insertProduct(prod1);

  await insertProduct(prod2);
}

Future<void> insertProduct(Product product) async {
  // Get a reference to the database.
  final Database db = await database;

  // Insert the Product into the correct table. Also specify the
  // `conflictAlgorithm`. In this case, if the same product is inserted
  // multiple times, it replaces the previous data.
  await db.insert(
    tableProducts,
    product.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<List<Product>> allProducts() async {
  // Get a reference to the database.
  final Database db = await database;

  // Query the table for all The Products.
  final List<Map<String, dynamic>> maps = await db.query(tableProducts);

  // Convert the List<Map<String, dynamic> into a List<Product>.
  return List.generate(
    maps.length,
    (i) {
      return Product(
          id: maps[i]['id'],
          title: maps[i]['title'],
          description: maps[i]['description'],
          image: maps[i]['image'],
          price: maps[i]['price']);
    },
  );
}

Future<void> updateProduct(Product product) async {
  // Get a reference to the database.
  final db = await database;

  // Update the given Product.
  await db.update(
    tableProducts,
    product.toMap(),
    // Ensure that the Product has a matching id.
    where: "id = ?",
    // Pass the Products's id as a whereArg to prevent SQL injection.
    whereArgs: [product.id],
  );
}

Future<void> deleteProduct(int id) async {
  // Get a reference to the database.
  final db = await database;

  // Remove the Product from the database.
  await db.delete(
    tableProducts,
    // Use a `where` clause to delete a specific product.
    where: "id = ?",
    // Pass the Products's id as a whereArg to prevent SQL injection.
    whereArgs: [id],
  );
}

class Product {
  final int id;
  final String title;
  final String description;
  final String image;
  final double price;

  Product({this.id, this.title, this.description, this.image, this.price});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'image': image,
      'price': price,
    };
  }

  @override
  String toString() {
    return 'Product("id": ${this.id}, "title": ${this.title}, "description": ${this.description}, '
        '"image": ${this.image}, "price":${this.price});';
  }
}
