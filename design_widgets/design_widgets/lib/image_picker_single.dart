import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerSingleRecipe extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ImagePickerSingleRecipeState();
}

class _ImagePickerSingleRecipeState extends State<ImagePickerSingleRecipe> {
  //Image file from gallery
  File galleryPic;

  //Image file for recently taken picture
  File cameraPic;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: <Widget>[
            renderImage(galleryPic),
            renderImage(cameraPic),
          ]
      ),
      bottomNavigationBar: this._bottomAppBar(),
    );
  }

  Widget _bottomAppBar() {
    return BottomAppBar(
      child: ButtonBar(
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
              child: Text('Gallery'),
              onPressed: () async {
                galleryPic =
                    await ImagePicker.pickImage(source: ImageSource.gallery);
                setState(() {
                  
                });
              }),
          RaisedButton(
              child: Text('Camera'),
              onPressed: () async {
                cameraPic =
                    await ImagePicker.pickImage(source: ImageSource.camera);
                setState(() {
                  renderImage(cameraPic);
                });
              }),
        ],
      ),
    );
  }

  Widget renderImage(File file) {
    return SizedBox(
        height: 200,
        width: 200,
        child: file == null ? Text("Pick an image.") : Image.file(file));
  }
}
