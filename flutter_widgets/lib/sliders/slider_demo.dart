import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(new SliderDemo());

class SliderDemo extends StatefulWidget {
  @override
  _SliderDemoState createState() => _SliderDemoState();
}

class _SliderDemoState extends State<SliderDemo> {
  double _diffLevel = 2;
  var gradesRange = RangeValues(0, 5);
  var listOfWords = [
    'Them',
    'Up',
    'Web',
    'Come',
    'Play',
    'They',
    'So',
    'Construct',
    'Tournament',
    'Glide'
  ];
  var word = 'Their';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sliders (Guess the Word's level)"),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 50,
            left: 0,
            right: 0,
            bottom: 50,
            child: Container(
              padding: const EdgeInsets.all(30.0),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.orange.shade400,
                  borderRadius: BorderRadius.all(
                    Radius.circular(60.0),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Card(
                      elevation: 1.0,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          word,
                          style: TextStyle(
                              fontSize: 34.0, fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.0),
                  RangeSlider(
                    min: 0,
                    max: 5,
                    divisions: 5,
                    labels: RangeLabels(
                        '${gradesRange.start}', '${gradesRange.end}'),
                    values: gradesRange,
                    onChanged: (RangeValues value) {
                      setState(() {
                        gradesRange = value;
                      });
                    },
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Grade Level",
                        style: TextStyle(fontSize: 16.0),
                      ),
                      Spacer(),
                      Text("Guess appropriate Grade level",
                          style: TextStyle(color: Colors.grey.shade700)),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Slider.adaptive(
                    value: _diffLevel.toDouble(),
                    onChanged: (double newValue) {
                      setState(() {
                        _diffLevel = newValue;
                      });
                    },
                    min: 1,
                    max: 3,
                    divisions: 2,
                    label: _diffLevel.toString(),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Difficulty Level",
                        style: TextStyle(fontSize: 16.0),
                      ),
                      Spacer(),
                      Text("Guess appropriate Difficulty level",
                          style: TextStyle(color: Colors.grey.shade700)),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: RaisedButton(
                      textTheme: ButtonTextTheme.primary,
                      elevation: 1.0,
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Text(
                        "Submit",
                        style: TextStyle(fontSize: 16.0),
                      ),
                      onPressed: () {
                        setState(() {
                          var randomNumber = new Random().nextInt(9);
                          word = listOfWords[randomNumber];
                          _diffLevel = 2;
                          gradesRange = RangeValues(0, 5);
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
