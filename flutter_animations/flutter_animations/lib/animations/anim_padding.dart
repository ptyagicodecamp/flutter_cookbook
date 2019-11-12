import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class AnimatedPaddingDemo extends StatefulWidget {
  @override
  _AnimatedPaddingDemoState createState() => _AnimatedPaddingDemoState();
}

class _AnimatedPaddingDemoState extends State<AnimatedPaddingDemo> {
  List<DropDownOption> curveOptions = [
    DropDownOption(Curves.linear, "linear", "A linear animation curve."),
    DropDownOption(
        Curves.decelerate,
        "decelerate",
        "A curve where the rate of change starts out quickly and then decelerates. "
            "Upside-down `f(t) = t²` parabola."),
    DropDownOption(
        Curves.fastLinearToSlowEaseIn,
        "fastLinearToSlowEaseIn",
        "A curve that is very steep and linear at the beginning, "
            "but quickly flattens out and very slowly eases in."),
    DropDownOption(Curves.ease, "ease",
        "A cubic animation curve that speeds up quickly and ends slowly."),
    DropDownOption(Curves.easeIn, "easeIn",
        "A cubic animation curve that starts slowly and ends quickly."),
    DropDownOption(Curves.easeInToLinear, "easeInToLinear",
        "A cubic animation curve that starts starts slowly and ends linearly."),
    DropDownOption(Curves.easeInSine, "easeInSine",
        "A cubic animation curve that starts slowly and ends quickly."),
    DropDownOption(Curves.easeOutSine, "easeOutSine",
        "A cubic animation curve that starts quickly and ends slowly."),
    DropDownOption(Curves.easeInOutSine, "easeInOutSine",
        "A cubic animation curve that starts slowly, speeds up, and then ends slowly."),
    DropDownOption(
        Curves.easeInQuad,
        "easeInQuad",
        "A cubic animation curve that starts slowly and ends quickly. "
            "Based on a quadratic equation where `f(t) = t²`"),
    DropDownOption(Curves.easeOutQuad, "easeOutQuad",
        "A cubic animation curve that starts quickly and ends slowly."),
    DropDownOption(Curves.easeInOutQuad, "easeInOutQuad",
        "A cubic animation curve that starts slowly, speeds up, and then ends slowly."),
    DropDownOption(
        Curves.easeInCubic,
        "easeInCubic",
        "A cubic animation curve that starts "
            "slowly and ends quickly. This curve is based on a cubic equation where `f(t) = t³`."),
    DropDownOption(Curves.easeOutCubic, "easeOutCubic",
        " A cubic animation curve that starts quickly and ends slowly."),
    DropDownOption(Curves.easeInOutCubic, "easeInOutCubic",
        "A cubic animation curve that starts slowly, speeds up, and then ends slowly."),
    DropDownOption(
        Curves.easeInQuart,
        "easeInQuart",
        "A cubic animation curve that starts slowly and ends quickly. "
            "This curve is based on a quartic equation where `f(t) = t⁴`."),
    DropDownOption(Curves.easeOutQuart, "easeOutQuart",
        "A cubic animation curve that starts quickly and ends slowly."),
    DropDownOption(Curves.easeInOutQuart, "easeInOutQuart",
        "A cubic animation curve that starts slowly, speeds up, and then ends slowly."),
    DropDownOption(
        Curves.easeInQuint,
        "easeInQuint",
        "A cubic animation curve that starts slowly and ends quickly. "
            "This curve is based on a quintic equation where `f(t) = t⁵`"),
    DropDownOption(Curves.easeOutQuint, "easeOutQuint",
        "A cubic animation curve that starts quickly and ends slowly."),
    DropDownOption(Curves.easeInOutQuart, "easeInOutQuart",
        "A cubic animation curve that starts slowly, speeds up, and then ends slowly."),
    DropDownOption(
        Curves.easeInExpo,
        "easeInExpo",
        "A cubic animation curve that starts slowly and ends quickly. "
            "This curve is based on an exponential equation where `f(t) = 2¹⁰⁽ᵗ⁻¹⁾`."),
    DropDownOption(Curves.easeOutExpo, "easeOutExpo",
        "A cubic animation curve that starts quickly and ends slowly."),
    DropDownOption(Curves.easeInOutExpo, "easeInOutExpo",
        "A cubic animation curve that starts slowly, speeds up, and then ends slowly."),
    DropDownOption(
        Curves.easeInCirc,
        "easeInCirc",
        "A cubic animation curve that starts slowly and ends quickly. "
            "This curve is effectively the bottom-right quarter of a circle."),
    DropDownOption(Curves.easeOutCirc, "easeOutCirc",
        "A cubic animation curve that starts quickly and ends slowly. This curve is effectively the top-left quarter of a circle."),
    DropDownOption(Curves.easeInOutCirc, "easeInOutCirc",
        "A cubic animation curve that starts slowly, speeds up, and then ends slowly."),
    DropDownOption(Curves.easeInBack, "easeInBack",
        "A cubic animation curve that starts slowly and ends quickly."),
    DropDownOption(Curves.easeOutBack, "easeOutBack",
        "A cubic animation curve that starts quickly and ends slowly."),
    DropDownOption(Curves.easeInOutBack, "easeInOutBack",
        "A cubic animation curve that starts slowly, speeds up, and then ends slowly."),
    DropDownOption(Curves.easeInOut, "easeInOut",
        "A cubic animation curve that starts quickly and ends slowly."),
    DropDownOption(Curves.linearToEaseOut, "linearToEaseOut",
        "A cubic animation curve that starts linearly and ends slowly."),
    DropDownOption(Curves.fastOutSlowIn, "fastOutSlowIn",
        "A curve that starts quickly and eases into its final position."),
    DropDownOption(
        Curves.slowMiddle,
        "slowMiddle",
        "A cubic animation curve that starts quickly, slows down, "
            "and then ends quickly."),
    DropDownOption(Curves.bounceIn, "bounceIn",
        "An oscillating curve that grows in magnitude."),
    DropDownOption(Curves.bounceOut, "bounceOut",
        "An oscillating curve that first grows and then shrink in magnitude."),
    DropDownOption(Curves.bounceInOut, "bounceInOut",
        "An oscillating curve that first grows and then shrink in magnitude."),
    DropDownOption(Curves.elasticIn, "elasticeIn",
        "An oscillating curve that grows in magnitude while overshooting its bounds."),
    DropDownOption(Curves.elasticOut, "elasticOut",
        "An oscillating curve that shrinks in magnitude while overshooting its bounds."),
    DropDownOption(Curves.elasticInOut, "elasticInOut",
        "An oscillating curve that grows and then shrinks in magnitude while overshooting its bounds."),
  ];

  DropDownOption dropDownValue;
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

  Widget dropDownMenu(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.topCenter,
      child: DropdownButton<DropDownOption>(
        value: dropDownValue == null ? curveOptions[0] : dropDownValue,
        icon: Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: Colors.blueAccent),
        underline: Container(
          height: 2,
          color: Colors.blue,
        ),
        onChanged: (DropDownOption newValue) {
          setState(() {
            dropDownValue = newValue;
          });
        },
        items: curveOptions
            .map<DropdownMenuItem<DropDownOption>>((DropDownOption value) {
          return DropdownMenuItem<DropDownOption>(
            value: value,
            child: Text(value.curveName),
          );
        }).toList(),
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

class DropDownOption {
  Curve curveCubic;
  String curveName;
  String description;

  DropDownOption(Curve cubic, String name, String desc) {
    this.curveCubic = cubic;
    this.curveName = name;
    this.description = desc;
  }
}
