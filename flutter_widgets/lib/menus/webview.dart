import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWebView extends StatelessWidget {
  final String title;
  final String url;

  MyWebView({this.title, this.url});

  @override
  Widget build(BuildContext context) {
    //final WebViewArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

class WebViewArguments {
  final String title;
  final String url;

  WebViewArguments({this.title, this.url});
}
