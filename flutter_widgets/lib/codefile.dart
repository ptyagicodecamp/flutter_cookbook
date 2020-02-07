import 'dart:math';

import 'package:animated_floatactionbuttons/animated_floatactionbuttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widgets/plugins/url_launcher/url_launcher.dart';
import 'package:flutter_widgets/screen_args.dart';
import 'package:syntax_highlighter/syntax_highlighter.dart';

class CodeFileWidget extends StatefulWidget {
  final String recipeName;
  final String pageName;
  final String codeFilePath;
  final String codeGithubPath;

  CodeFileWidget(
      {this.recipeName, this.pageName, this.codeFilePath, this.codeGithubPath});

  @override
  CodeFileWidgetState createState() {
    return CodeFileWidgetState();
  }
}

class CodeFileWidgetState extends State<CodeFileWidget> {
  double scaleFactorText = 1.0;

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
            icon: Icon(Icons.open_in_new),
            onPressed: () => UrlUtils.open(this.widget.codeGithubPath),
          )
        ],
      ),
      body: FutureBuilder(
        future: rootBundle.loadString(widget.codeFilePath) ??
            'Error loading code file ${this.widget.codeFilePath}',
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              body: Padding(
                padding: EdgeInsets.all(4.0),
                child: highlightCodeSyntax(snapshot.data, context),
              ),
              floatingActionButton: AnimatedFloatingActionButton(
                fabButtons: codepreviewActions(),
                colorStartAnimation: Colors.blue,
                colorEndAnimation: Colors.cyan,
                animatedIconData: AnimatedIcons.menu_close,
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  List<Widget> codepreviewActions() {
    return <Widget>[
      //makes text smaller
      FloatingActionButton(
        heroTag: "zoom_out",
        child: Icon(Icons.zoom_out),
        tooltip: 'Zoom out',
        onPressed: () => setState(() {
          this.scaleFactorText = max(0.8, this.scaleFactorText - 0.1);
        }),
      ),
      //makes text bigger
      FloatingActionButton(
        heroTag: "zoom_in",
        child: Icon(Icons.zoom_in),
        tooltip: 'Zoom in',
        onPressed: () => setState(() {
          this.scaleFactorText += 0.1;
        }),
      ),
      FloatingActionButton(
        heroTag: "open_page",
        child: Icon(Icons.slideshow),
        tooltip: 'See Demo',
        onPressed: () => Navigator.popAndPushNamed(
          context,
          widget.pageName,
          arguments: ScreenArguments(widget.recipeName, widget.pageName,
              widget.codeFilePath, widget.codeGithubPath),
        ),
      ),
    ];
  }

  Widget highlightCodeSyntax(String codeContent, BuildContext context) {
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
              textScaleFactor: this.scaleFactorText,
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
}
