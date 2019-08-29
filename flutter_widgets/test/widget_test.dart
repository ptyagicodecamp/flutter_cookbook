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
  Widget buildTestableWidget(Widget widget) {
    return MediaQuery(data: MediaQueryData(), child: MaterialApp(home: widget));
  }

  testWidgets('Testing Switch Tile', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());
    final  switchListTile = find.byType(ListTile).at(0);
    await tester.tap(switchListTile) ;
    print(switchListTile.description);

    await tester.pumpWidget(buildTestableWidget(SwitchListTile1()));
    final comp = find.byType(SwitchListTile1);
    print(comp.description);

    await tester.pumpWidget(buildTestableWidget(HyperlinkedLabelSwitch(
      padding:
      const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
      label: "Privacy Policy",
      hyperlink:
      'https://docs.google.com/document/d/1TAqTE7MBzuIagISHHzjGxSHoY1z884LXR3iGIojz1sA/edit?usp=sharing',
      selected: true,
      onChange: (bool v) {})
    ));
    final clickableLabel = find.byType(HyperlinkedLabelSwitch);
    print(clickableLabel.description);


    //expect(find.byType(TextSpan), findsWidgets);


    // Verify that our counter starts at 0.
   //expect(find.text('Privacy Policy'), findsWidgets);
//    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
//    await tester.tap(find.byIcon(Icons.add));
//    await tester.pump();
//
//    // Verify that our counter has incremented.
//    expect(find.text('0'), findsNothing);
//    expect(find.text('1'), findsOneWidget);
  });
}
