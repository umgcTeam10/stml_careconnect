import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stml_careconnect/screens/calendar_screen.dart';

void main() {
  testWidgets('Calendar shows month header and schedule', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CalendarScreen(),
      ),
    );

    expect(find.text('January 2026'), findsOneWidget);
    expect(find.text("Today's Schedule"), findsOneWidget);
    expect(find.text('Morning Medication'), findsOneWidget);
  });

  testWidgets('Calendar month navigation updates label', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CalendarScreen(),
      ),
    );

    expect(find.text('January 2026'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.chevron_right));
    await tester.pumpAndSettle();

    expect(find.text('February 2026'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.chevron_left));
    await tester.pumpAndSettle();

    expect(find.text('January 2026'), findsOneWidget);
  });
}
