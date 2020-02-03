import 'package:firebase/firebase.dart';
import 'package:flutter/material.dart';

class FireStorageService extends ChangeNotifier {
  FireStorageService._();

  FireStorageService() {
    initializeApp(
        apiKey: "AIzaSyDEktNdn4CsMUxeOyVkPFBnaoAdNhcpEPc",
        authDomain: "fir-recipes-b5611.firebaseapp.com",
        databaseURL: "https://fir-recipes-b5611.firebaseio.com",
        projectId: "fir-recipes-b5611",
        storageBucket: "fir-recipes-b5611.appspot.com",
        messagingSenderId: "728428768644");
  }

  static Future<dynamic> loadFromStorage(
      BuildContext context, String image) async {
    var url = await storage().ref(image).getDownloadURL();
    return url;
  }
}
