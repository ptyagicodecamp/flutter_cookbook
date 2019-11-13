import 'package:flutter/material.dart';
import 'anim_curves.dart';

class AnimatedPositionedDemo extends StatefulWidget {
  @override
  _AnimatedPositionedDemoState createState() => _AnimatedPositionedDemoState();
}

class _AnimatedPositionedDemoState extends State<AnimatedPositionedDemo> {
  AnimationCurve dropDownValue;
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedPositioned Demo"),
      ),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                dropDownMenu(context),
                playAnimation(context),
              ],
            ),
          ),
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
          animatedPositionedWidget(context),
        ],
      ),
    );
  }

  Widget animatedPositionedWidget(BuildContext context) {
    return AnimatedPositioned(
      width: selected ? 400.0 : 200.0,
      height: selected ? 200.0 : 400.0,
      duration: Duration(seconds: 2),
      curve: dropDownValue != null ? dropDownValue.curveCubic : Curves.linear,
      child: Image.asset('assets/images/sea.jpg'),
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
      child: Text("Animate"),
      onPressed: () => setState(() {
        selected = !selected;
      }),
    );
  }
}
