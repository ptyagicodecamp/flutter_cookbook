import 'package:flutter/material.dart';

class QuizPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.asset(
                  "assets/images/tomato.jpg",
                ),
                Text(
                  "Is tomato a fruit or vegetable ?",
                  style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              child: QuizOptions(),
            ),
          )
        ],
      ),
    );
  }
}

enum Options { fruit, veggie, none }

class QuizOptions extends StatefulWidget {
  @override
  _QuizOptionsState createState() => _QuizOptionsState();
}

class _QuizOptionsState extends State<QuizOptions> {
  Options selection = Options.none;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        RadioListTile(
          title: Text(
            "Fruit",
            style:
                TextStyle(fontSize: 30, color: Colors.white, letterSpacing: 3),
          ),
          value: Options.fruit,
          groupValue: selection,
          onChanged: (Options value) =>
              setState(() => showAnswer(context, value)),
        ),
        RadioListTile(
          title: Text(
            "Vegetable",
            style:
                TextStyle(fontSize: 30, color: Colors.white, letterSpacing: 3),
          ),
          value: Options.veggie,
          groupValue: selection,
          onChanged: (Options value) =>
              setState(() => showAnswer(context, value)),
        )
      ],
    );
  }

  void showAnswer(BuildContext context, Options value) {
    selection = value;
    showModalBottomSheet(context: context, builder: buildBottomSheet);
  }

  Widget buildBottomSheet(BuildContext context) {
    String explanation = "";
    if (selection == Options.fruit) {
      explanation = "You got it! Tomato is a fruit since it has seeds in it.";

      return ColorFiltered(
        colorFilter: ColorFilter.mode(Colors.greenAccent, BlendMode.hue),
        child: FeedbackWidget(explanation: explanation),
      );
    } else {
      explanation =
          "While many people believe a tomato is a vegetable, a tomato has seeds and thus is actually a fruit.";

      return ColorFiltered(
        colorFilter: ColorFilter.mode(Colors.redAccent, BlendMode.hue),
        child: FeedbackWidget(explanation: explanation),
      );
    }
  }
}

class FeedbackWidget extends StatelessWidget {
  const FeedbackWidget({
    Key key,
    @required this.explanation,
  }) : super(key: key);

  final String explanation;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
          color: Colors.lightBlueAccent,
          //optional radius
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10), topLeft: Radius.circular(10))),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
        child: Text(
          explanation,
          style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              wordSpacing: 5,
              letterSpacing: 1),
        ),
      ),
    );
  }
}
