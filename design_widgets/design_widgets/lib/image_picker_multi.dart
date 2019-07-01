import 'dart:io';

import 'package:flutter/material.dart';
//import 'package:image_picker_multiple/image_picker_multiple.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multiple_image_picker/flutter_multiple_image_picker.dart';

class ImagePickerMultiRecipe extends StatefulWidget {
  @override
  _ImagePickerMultiRecipeState createState() => new _ImagePickerMultiRecipeState();
}

class _ImagePickerMultiRecipeState extends State<ImagePickerMultiRecipe> {
  BuildContext context;
  String _platformMessage = 'No Error';
  List images;
  int maxImageNo = 10;
  bool selectSingleImage = false;

  @override
  initState() {
    super.initState();
  }

  initMultiPickUp() async {
    setState(() {
      images = null;
      _platformMessage = 'No Error';
    });
    List resultList;
    String error;
    try {
      resultList = await FlutterMultipleImagePicker.pickMultiImages(
          maxImageNo, selectSingleImage);
    } on PlatformException catch (e) {
      error = e.message;
    }

    if (!mounted) return;

    setState(() {
      images = resultList;
      if (error == null) _platformMessage = 'No Error Dectected';
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Multi-image picker plugin'),
        ),
        body: new Container(
          padding: const EdgeInsets.all(8.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              images == null
                  ? new Container(
                height: 300.0,
                width: 400.0,
                child: new Icon(
                  Icons.image,
                  size: 250.0,
                  color: Theme.of(context).primaryColor,
                ),
              )
                  : new SizedBox(
                height: 300.0,
                width: 400.0,
                child: new ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) =>
                  new Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: new Image.file(
                      new File(images[index].toString()),
                    ),
                  ),
                  itemCount: images.length,
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Text('Error Dectected: $_platformMessage'),
              ),
              new RaisedButton.icon(
                  onPressed: initMultiPickUp,
                  icon: new Icon(Icons.image),
                  label: new Text("Pick-Up Images")),
            ],
          ),
        ),
      ),
    );
  }
}
//class ImagePickerMultiRecipe extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() => _ImagePickerMultiRecipeState();
//}
//
//class _ImagePickerMultiRecipeState extends State<ImagePickerMultiRecipe> {
//  //Image file from gallery
//  File galleryPic;
//
//  //Image file for recently taken picture
//  File cameraPic;
//
//  List<File> selectedPics;
//
//  List<File> files = List<File>();
//
//  List<File> getImageFiles() {
//    return files;
//  }
//
//  final _font = const TextStyle(fontSize: 18.0);
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: ListView.builder(
//          itemCount: getImageFiles().length,
//          padding: const EdgeInsets.all(16.0),
//          //scrollDirection: Axis.horizontal,
//          itemBuilder: (BuildContext context, int i) {
//            return _buildCardRow(i);
//          }),
//      bottomNavigationBar: this._bottomAppBar(),
//    );
//  }
//
//  Widget _buildCardRow(int position) {
//    return ListTile(
//      title: Column(children: <Widget>[
//        renderImage(files[position]),
//      ]),
//      onTap: () => {},
//    );
//  }
//
//  Widget _bottomAppBar() {
//    return BottomAppBar(
//      child: ButtonBar(
//        alignment: MainAxisAlignment.center,
//        children: <Widget>[
//          RaisedButton(
//              child: Text('Gallery'),
//              onPressed: () async {
//                selectedPics =
//                    await MultipleImagePicker.pickImage(selectedPics);
//                setState(() {
//                  files.addAll(selectedPics);
//                });
//              }),
//          RaisedButton(
//              child: Text('Camera'),
//              onPressed: () async {
//                cameraPic =
//                    await ImagePicker.pickImage(source: ImageSource.camera);
//                setState(() {
//                  files.add(cameraPic);
//                });
//              }),
//        ],
//      ),
//    );
//  }
//
//  Widget renderImage(File file) {
//    return SizedBox(
//        height: 200,
//        width: 200,
//        child: file == null ? Text("Pick an image.") : Image.file(file));
//  }
//}
