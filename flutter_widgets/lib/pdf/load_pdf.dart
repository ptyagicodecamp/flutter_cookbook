import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/plugins/pdf/launch_pdf.dart';
import 'package:flutter_widgets/screen_args.dart';
import '../router.dart' as router;

final Color cyan = Colors.cyan;
final Color blue = Colors.blue;

String file = "pdfs/slides.pdf";
String fileName = "Flutter Slides";

class LoadFirbaseStoragePdf extends StatefulWidget {
  final String recipeName;
  final String pageName;
  final String codeFilePath;
  final String codeGithubPath;

  const LoadFirbaseStoragePdf(
      {this.recipeName, this.pageName, this.codeFilePath, this.codeGithubPath});

  @override
  _LoadFirbaseStoragePdfState createState() => _LoadFirbaseStoragePdfState();
}

class _LoadFirbaseStoragePdfState extends State<LoadFirbaseStoragePdf> {
  static String pathPDF = "";
  static String pdfUrl = "";

  @override
  void initState() {
    super.initState();

    //Fetch file from FirebaseStorage first
    LaunchFile.loadFromFirebase(context, file)
        //Creating PDF file at disk for ios and android & assigning pdf url for web
        .then((url) => LaunchFile.createFileFromPdfUrl(url).then(
              (f) => setState(
                () {
                  if (f is File) {
                    pathPDF = f.path;
                    print(pathPDF);
                  } else if (url is Uri) {
                    pdfUrl = url.toString();
                  }
                },
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(widget.recipeName),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.code),
            onPressed: () => Navigator.pushNamed(
              context,
              router.SHOW_CODE_FILE,
              arguments: ScreenArguments(widget.recipeName, widget.pageName,
                  widget.codeFilePath, widget.codeGithubPath),
            ),
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: 360,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50.0),
                    bottomRight: Radius.circular(50.0)),
                gradient: LinearGradient(
                    colors: [blue, cyan],
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
                      "Loading Slides PDF from Firebase Storage",
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
                            child:
                                Image.asset('assets/images/flutter_slides.jpg'),
                            onTap: () => LaunchFile.launchPDF(
                                context, "Flutter Slides", pathPDF, pdfUrl),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                openPDFButton(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget openPDFButton(BuildContext context) {
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
                  colors: [cyan, blue],
                ),
                borderRadius: BorderRadius.circular(30.0)),
            child: FlatButton(
              onPressed: () {
                setState(() {
                  LaunchFile.launchPDF(
                      context, "Flutter Slides", pathPDF, pdfUrl);
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
}
