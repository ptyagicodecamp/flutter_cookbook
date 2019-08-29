// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_widgets/main.dart';
import 'package:flutter_widgets/swtch/switch_list_tile1.dart';

void main() {
  //Test classes don't have access to MaterialApp.
  // So, we need to wrap widget to be tested in MaterialApp.
  //We need to use [MediaQuery](https://api.flutter.dev/flutter/widgets/MediaQuery-class.html)
  //to access layout information of testable widget
  Widget buildTestableWidget(Widget widget) {
    return MediaQuery(data: MediaQueryData(), child: MaterialApp(home: widget));
  }

  testWidgets('Testing Privacy Policy Switch', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(SwitchListTile1()));
    final comp = find.byType(SwitchListTile1);
    print(comp.description);
    bool accepted = false;
    String privacyLabel = 'Privacy Policy';

    await tester.pumpWidget(StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return buildTestableWidget(          HyperlinkedLabelSwitch(
          padding:
          const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
          label: privacyLabel,
          hyperlink:
          'https://docs.google.com/document/d/1TAqTE7MBzuIagISHHzjGxSHoY1z884LXR3iGIojz1sA/edit?usp=sharing',
          selected: accepted,
          onChange: (bool v) {
            setState(() {
              accepted = v;
              debugPrint("Value changed: " + accepted.toString());

              if (accepted) {
                privacyLabel = 'Privacy Policy (Accepted)';
                debugPrint("String changed: " + privacyLabel);
              } else {
                privacyLabel = 'Privacy Policy';
                debugPrint("String changed: " + privacyLabel);
              }
            });
          },
        ));
      },
    ));

    final clickableLabel = find.byType(HyperlinkedLabelSwitch);
    print(clickableLabel.description);

    expect(find.byType(Row), findsOneWidget);

    expect(find.byType(Expanded), findsOneWidget);

    expect(find.byType(RichText), findsOneWidget);

    expect(find.byType(Switch), findsOneWidget);


    //Testing toggling switch
    await tester.pump(Duration(seconds: 5));
    await tester.tap(find.byType(Switch));
    expect(accepted, true);

    expect(privacyLabel, 'Privacy Policy (Accepted)');

    //Toggle switch again
    await tester.pump(Duration(seconds: 5));
    await tester.tap(find.byType(Switch));
    expect(accepted, false);

    expect(privacyLabel, 'Privacy Policy');

    //another way
    final richText = find.byType(RichText);
    expect(richText.toString().contains('Privacy Policy'), true);
  });
}
