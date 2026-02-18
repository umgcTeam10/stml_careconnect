import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stml_careconnect/app/app_routes.dart';
import 'package:stml_careconnect/screens/dashboard_screen.dart';

void main() {
  MaterialApp _wrap({double textScale = 1.0}) {
    return MaterialApp(
      home: MediaQuery(
        data: MediaQueryData(textScaler: TextScaler.linear(textScale)),
        child: const DashboardScreen(),
      ),
      routes: {
        AppRoutes.tasks: (_) => const Scaffold(body: Text('Tasks')),
        AppRoutes.calendar: (_) => const Scaffold(body: Text('Calendar')),
        AppRoutes.messages: (_) => const Scaffold(body: Text('Messages')),
        AppRoutes.profile: (_) => const Scaffold(body: Text('Profile')),
        AppRoutes.healthLogs: (_) => const Scaffold(body: Text('Health Logs')),
      },
    );
  }

  testWidgets('Dashboard shows main sections and actions', (tester) async {
    await tester.pumpWidget(_wrap());

    expect(find.text('Your Health Today'), findsOneWidget);
    expect(find.text('Next Appointment'), findsOneWidget);
    expect(find.text('Health Summary'), findsOneWidget);
    expect(find.text('Log Wellness Check'), findsOneWidget);
    expect(find.text('Set Reminder'), findsOneWidget);
    expect(find.text('Send Message'), findsOneWidget);
    expect(find.text('View Full History'), findsOneWidget);
  });

  testWidgets('Log Wellness Check navigates to health logs', (tester) async {
    await tester.pumpWidget(_wrap());

    await tester.tap(find.text('Log Wellness Check'));
    await tester.pumpAndSettle();

    expect(find.text('Health Logs'), findsOneWidget);
  });

  testWidgets('Dashboard supports 200% text scaling', (tester) async {
    await tester.pumpWidget(_wrap(textScale: 2.0));
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
  });

  testWidgets('Dashboard follows Flutter accessibility guidelines', (
    tester,
  ) async {
    await tester.pumpWidget(_wrap());

    await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));
    await expectLater(tester, meetsGuideline(androidTapTargetGuideline));
    await expectLater(tester, meetsGuideline(textContrastGuideline));
  });
}
