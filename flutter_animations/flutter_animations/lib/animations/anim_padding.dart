import 'package:flutter/material.dart';
import 'anim_curves.dart';

class AnimatedPaddingDemo extends StatefulWidget {
  @override
  _AnimatedPaddingDemoState createState() => _AnimatedPaddingDemoState();
}

class _AnimatedPaddingDemoState extends State<AnimatedPaddingDemo> {
  AnimationCurve dropDownValue;
  bool selected = false;
  double paddingValue = 8.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedPadding Demo"),
      ),
      body: Column(
        children: <Widget>[
          dropDownMenu(context),
          SizedBox(
            height: 20,
          ),
          Column(
            children: <Widget>[
              dropDownValue != null
                  ? Text(
                      dropDownValue.curveCubic.toString(),
                    )
                  : Text(Curves.linear.toString()),
              SizedBox(
                height: 20,
              ),
              dropDownValue != null
                  ? Text(
                      dropDownValue.description,
                    )
                  : Text("linear"),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          animatedPaddingWidget(context),
          SizedBox(
            height: 40,
          ),
          playAnimation(context),
        ],
      ),
    );
  }

  Widget animatedPaddingWidget(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
          selected ? paddingValue = 20 : paddingValue = 8.0;
        });
      },
      child: Center(
        child: AnimatedPadding(
          padding: EdgeInsets.all(paddingValue),
          duration: Duration(seconds: 2),
          curve:
              dropDownValue != null ? dropDownValue.curveCubic : Curves.linear,
          child: Image.asset('assets/images/sea.jpg'),
        ),
      ),
    );
  }

  Widget dropDownMenu(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.topCenter,
      child: DropdownButton<AnimationCurve>(
        value: dropDownValue == null ? curveOptions[0] : dropDownValue,
        icon: Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: Colors.blueAccent),
        underline: Container(
          height: 2,
          color: Colors.blue,
        ),
        onChanged: (AnimationCurve newValue) {
          setState(() {
            dropDownValue = newValue;
          });
        },
        items: curveOptions
            .map<DropdownMenuItem<AnimationCurve>>((AnimationCurve value) {
          return DropdownMenuItem<AnimationCurve>(
            value: value,
            child: Text(value.curveName),
          );
        }).toList(),
      ),
    );
  }

  Widget playAnimation(BuildContext context) {
    return RaisedButton(
      color: Colors.blueAccent,
      child: Text("Update Padding"),
      onPressed: () => setState(() {
        selected = !selected;
        selected ? paddingValue = 40 : paddingValue = 8.0;
      }),
    );
  }
}
