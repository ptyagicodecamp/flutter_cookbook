import 'package:flutter/material.dart';
import 'dart:convert';

DecorationImage herb1 = DecorationImage(
    image: AssetImage('assets/images/herbivorous_giraffe.jpg'),
    fit: BoxFit.fill);

DecorationImage herb2 = DecorationImage(
    image: AssetImage('assets/images/herbivorous_okapi.jpg'), fit: BoxFit.fill);

DecorationImage carn1 = DecorationImage(
    image: AssetImage('assets/images/carnivorous_cat.jpg'), fit: BoxFit.fill);

DecorationImage carn2 = DecorationImage(
    image: AssetImage('assets/images/carnivorous_cheetah.jpg'),
    fit: BoxFit.fill);

//choice at right side
bool isHerbivorous(CardItem cardItem) {
  return cardItem.animalType.contains("herbivorous");
}

//choice at left side
bool isCarnivorous(CardItem cardItem) {
  return cardItem.animalType.contains("carnivorous");
}

final List<CardItem> cardItems =
    CardItem.fromData(json.decode(Samples.jsonData()));

class Samples {
  static String jsonData() {
    return '[{"title":"cat","description":"Cat is carnivorous animal.","image":"assets/images/carnivorous_cat.jpg","animalType":"carnivorous"},{"title":"giraffe","description":"Giraffe is herbivorous animal.","image":"assets/images/herbivorous_giraffe.jpg","animalType":"herbivorous"}]';
  }
}

class CardItem {
  final String title;
  final String description;
  final String image;
  final String animalType;

  CardItem(this.title, this.description, this.image, this.animalType);

  CardItem.fromMap(Map<String, dynamic> data)
      : title = data["title"],
        description = data["description"],
        image = data["image"],
        animalType = data['animalType'];

  static List<CardItem> fromData(List<dynamic> data) {
    return data.map((item) => CardItem.fromMap(item)).toList();
  }
}
