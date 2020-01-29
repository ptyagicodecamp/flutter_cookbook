import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/plugins/firetop/storage/fire_storage_service.dart';
import 'package:path_provider/path_provider.dart';

import 'package:flutter_full_pdf_viewer/flutter_full_pdf_viewer.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';

import 'package:transparent_image/transparent_image.dart';

import 'package:share_extend/share_extend.dart';

//Load PDF file from Firebase Storage

//void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      title: 'Firebase Storage Demo',
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//      ),
      home: LoadFirbaseStoragePdf(),
    );
  }
}

final Color yellow = Color(0xfffbc31b);
final Color orange = Color(0xfffb6900);
final String file1 = "pdfs/k.pdf";
final String file2 = "pdfs/p.pdf";

String file = file1;

class LoadFirbaseStoragePdf extends StatefulWidget {
  @override
  _LoadFirbaseStoragePdfState createState() => _LoadFirbaseStoragePdfState();
}

class _LoadFirbaseStoragePdfState extends State<LoadFirbaseStoragePdf> {
  String pathPDF = "";
  String pdfUrl = "";

  @override
  void initState() {
    super.initState();

    FireStorageService.loadImage(context, file).then((downloadUrl) async {
      print(downloadUrl);
      pdfUrl = downloadUrl;
      createFileOfPdfUrl(downloadUrl).then((f) {
        setState(() {
          pathPDF = f.path;
          print(pathPDF);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: 360,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50.0),
                    bottomRight: Radius.circular(50.0)),
                gradient: LinearGradient(
                    colors: [orange, yellow],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)),
          ),
          Container(
            margin: const EdgeInsets.only(top: 80),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "Loading image from Firebase Storage",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        height: double.infinity,
                        margin: const EdgeInsets.only(
                            left: 30.0, right: 30.0, top: 10.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: InkWell(
                            child: FadeInImage.memoryNetwork(
                              placeholder: kTransparentImage,
                              image: '?raw=true',
                            ),
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PDFScreen(file, pathPDF)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                loadButton(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget loadButton(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
            margin: const EdgeInsets.only(
                top: 30, left: 20.0, right: 20.0, bottom: 20.0),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [yellow, orange],
                ),
                borderRadius: BorderRadius.circular(30.0)),
            child: FlatButton(
              onPressed: () {
                setState(() {
//                  final _random = new Random();
//                  var fileList = [file1, file2];
//                  file = fileList[_random.nextInt(fileList.length)];
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PDFScreen(file, pathPDF)),
                  );
                });
              },
              child: Text(
                "Open PDF",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<File> createFileOfPdfUrl(String url) async {
//    var url = "http://africau.edu/images/default/sample.pdf";
//    url =
//        "https://firebasestorage.googleapis.com/v0/b/fir-recipes-b5611.appspot.com/o/pdfs%2Fslides.pdf?alt=media&token=59dac1de-654e-4469-9137-bd6f6bf7ac35";
//    url =
//        "https://github.com/ptyagicodecamp/openmedia/raw/master/english/lowercase_pdf/k.pdf?raw=true";
//    //final filename = "thePDF";
    final filename =
        url.substring(url.lastIndexOf("/") + 1, url.lastIndexOf("/") + 10);
    print(filename);
    var request = await HttpClient().getUrl(Uri.parse(url));
    var response = await request.close();
    var bytes = await consolidateHttpClientResponseBytes(response);
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = new File('$dir/$filename');
    await file.writeAsBytes(bytes);
    return file;
  }

  Future<Widget> _getFile(BuildContext context, String fileName) async {
    PDFScreen pdfWidget;

    String downloadUrl = await FireStorageService.loadImage(context, fileName);
    await createFileOfPdfUrl(downloadUrl.toString()).then((value) {
      pdfWidget = PDFScreen(file, value.path);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PDFScreen(file, value.path)),
      );
    });

//        .then((downloadUrl)  {
//      print(downloadUrl);
//
//      await createFileOfPdfUrl(downloadUrl.toString()).then((f) {
//        setState(() {
//          pdfWidget = pdfScreen(file, f.path);
//        });
//      });
//    });

    return pdfWidget;
  }

//  Future<Widget> _getFile(BuildContext context, String fileName) async {
//    Future<Widget> pdfWidget;
//    await FireStorageService.loadImage(context, fileName)
//        .then((downloadUrl) async {
//      print(downloadUrl);
//
//      await createFileOfPdfUrl(downloadUrl.toString()).then((f) {
//        setState(() {
//          pdfWidget = pdfScreen(file, f.path);
//        });
//      });
//    });
//
//    return pdfWidget;
//  }

  Future<PDFScreen> pdfScreen(String file, String path) async {
    return await Future.value(PDFScreen(file, path));
  }
}

class PDFScreen extends StatelessWidget {
  String pathPDF = "";
  String title = "";
  PDFScreen(this.title, this.pathPDF);

  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
//        appBar: AppBar(
//          backgroundColor: orange,
//          title: Text(title),
//          actions: <Widget>[
//            IconButton(
//              icon: Icon(Icons.share),
//              onPressed: () {
//                Share.share("Send to");
//              },
//            ),
//          ],
//        ),
        path: pathPDF);
  }
}
