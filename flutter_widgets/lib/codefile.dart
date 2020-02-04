import 'dart:math';

import 'package:animated_floatactionbuttons/animated_floatactionbuttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widgets/plugins/url_launcher/url_launcher.dart';
import 'package:syntax_highlighter/syntax_highlighter.dart';

class CodeFile extends StatefulWidget {
  final String codeFilePath;
  final String codeGithubPath;

  CodeFile({this.codeFilePath, this.codeGithubPath});

  @override
  MyCodeViewState createState() {
    return MyCodeViewState();
  }
}

class MyCodeViewState extends State<CodeFile> {
  double _textScaleFactor = 1.0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: rootBundle.loadString(widget.codeFilePath) ??
          'Error loading code file ${this.widget.codeFilePath}',
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.all(4.0),
              child: highlightedCode(snapshot.data, context),
            ),
            floatingActionButton: AnimatedFloatingActionButton(
              fabButtons: actions(snapshot.data),
              colorStartAnimation: Colors.blue,
              colorEndAnimation: Colors.cyan,
              animatedIconData: AnimatedIcons.menu_close,
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget highlightedCode(String codeContent, BuildContext context) {
    final SyntaxHighlighterStyle style =
        Theme.of(context).brightness == Brightness.dark
            ? SyntaxHighlighterStyle.darkThemeStyle()
            : SyntaxHighlighterStyle.lightThemeStyle();
    return Container(
      constraints: BoxConstraints.expand(),
      child: Scrollbar(
        child: SingleChildScrollView(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: RichText(
              textScaleFactor: this._textScaleFactor,
              text: TextSpan(
                style: TextStyle(fontFamily: 'monospace', fontSize: 12.0),
                children: <TextSpan>[
                  DartSyntaxHighlighter(style).format(codeContent)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> actions(String codeContent) {
    return <Widget>[
      FloatingActionButton(
        heroTag: "copy_link",
        child: Icon(Icons.content_copy),
        tooltip: 'Copy Github url to clipboard',
        onPressed: () async {
          await Clipboard.setData(
              ClipboardData(text: this.widget.codeGithubPath));
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('Github Code link copied to Clipboard!'),
          ));
        },
      ),
      FloatingActionButton(
        heroTag: "open_github",
        child: Icon(Icons.open_in_new),
        tooltip: 'View code on github',
        onPressed: () => UrlUtils.open(this.widget.codeGithubPath),
      ),
      FloatingActionButton(
        heroTag: "zoom_out",
        child: Icon(Icons.zoom_out),
        tooltip: 'Zoom out',
        onPressed: () => setState(() {
          this._textScaleFactor = max(0.8, this._textScaleFactor - 0.1);
        }),
      ),
      FloatingActionButton(
        heroTag: "zoom_in",
        child: Icon(Icons.zoom_in),
        tooltip: 'Zoom in',
        onPressed: () => setState(() {
          this._textScaleFactor += 0.1;
        }),
      ),
    ];
  }
}
