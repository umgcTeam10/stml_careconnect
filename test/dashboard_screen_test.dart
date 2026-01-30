import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stml_careconnect/screens/dashboard_screen.dart';

void main() {
  testWidgets('Dashboard shows main sections', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: DashboardScreen(),
      ),
    );

    expect(find.text('Your Health Today'), findsOneWidget);
    expect(find.text('Next Appointment'), findsOneWidget);
    expect(find.text('Health Summary'), findsOneWidget);
  });

  testWidgets('Dashboard shows primary actions', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: DashboardScreen(),
      ),
    );

    expect(find.text('Log Wellness Check'), findsOneWidget);
    expect(find.text('Set Reminder'), findsOneWidget);
    expect(find.text('Send Message'), findsOneWidget);
    expect(find.text('View Full History'), findsOneWidget);
  });
}
