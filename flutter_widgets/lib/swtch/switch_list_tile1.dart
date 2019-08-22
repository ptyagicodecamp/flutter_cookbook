import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/menus/webview.dart';
import 'package:flutter_widgets/router.dart';

class SwitchListTile1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SwitchListTileState();
  }
}

class _SwitchListTileState extends State<SwitchListTile1> {
  bool selected = false;
  String privLabel = 'Privacy Policy';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SwitchListTile: Clickable label"),
      ),
      body: Column(
        children: <Widget>[
          HyperlinkedLabelSwitch(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
            label: privLabel,
            hyperlink:
                'https://docs.google.com/document/d/1TAqTE7MBzuIagISHHzjGxSHoY1z884LXR3iGIojz1sA/edit?usp=sharing',
            value: selected,
            onChange: (bool v) {
              setState(() {
                selected = v;
                if (selected) {
                  privLabel = 'Privacy Policy (Accepted)';
                } else {
                  privLabel = 'Privacy Policy';
                }
              });
            },
          )
        ],
      ),
    );
  }
}

class HyperlinkedLabelSwitch extends StatelessWidget {
  final String label;
  final bool value;
  final Function onChange;
  final EdgeInsets padding;
  final String hyperlink;

  const HyperlinkedLabelSwitch(
      {Key key,
      this.label,
      this.value,
      this.onChange,
      this.padding,
      this.hyperlink});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        children: <Widget>[
          //1. First widget in row is for label
          //Expanded widget claims the empty area
          Expanded(
            child: RichText(
                text: TextSpan(
                    text: label,
                    style: TextStyle(
                        color: Colors.redAccent,
                        decoration: TextDecoration.underline,
                        fontSize: 20.0),
                    //TapGestureRecognizer helps to disambiguate gestures from other potential gestures
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        //open hyperlink in webview
                        Navigator.pushNamed(context, WEBVIEW,
                            arguments:
                                WebViewArguments(title: label, url: hyperlink));
                      })),
          ),

          //2. Next comes the switch to save the user's selection
          Switch(
            value: value,
            onChanged: (bool v) {
              onChange(v);
            },
          )
        ],
      ),
    );
  }
}
