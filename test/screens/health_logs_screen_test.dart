import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stml_careconnect/screens/health_logs_screen.dart';

void main() {
  testWidgets('HealthLogsScreen displays summary and log entries',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: HealthLogsScreen()),
    );

    // Wait for the ListView and any rebuilds
    await tester.pumpAndSettle();

    // Verify screen title
    expect(find.text('Health Logs'), findsOneWidget);

    // Verify summary cards
    expect(find.text('Steps'), findsOneWidget);
    expect(find.text('Sleep'), findsOneWidget);
    expect(find.text('Heart Rate'), findsOneWidget);
    expect(find.text('Calories'), findsOneWidget);

    // Verify health log entries using Keys for reliability
    expect(find.byKey(const Key('bloodPressureCard')), findsOneWidget);
    expect(find.byKey(const Key('moodCheckCard')), findsOneWidget);
    expect(find.byKey(const Key('medicationCard')), findsOneWidget);

    // Tap a log entry
    await tester.tap(find.byKey(const Key('bloodPressureCard')));
    await tester.pumpAndSettle();
  });
}




