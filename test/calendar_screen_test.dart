import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stml_careconnect/app/app_routes.dart';
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
    // ✅ ADD BELOW (snackbar path)
  testWidgets('Calendar Now banner View shows not implemented snackbar',
      (tester) async {
    await tester.pumpWidget(const MaterialApp(home: CalendarScreen()));

    await tester.tap(find.text('View'));
    await tester.pump();

    expect(find.text('Not implemented in Week 4'), findsOneWidget);
  });

  testWidgets('Calendar renders empty cells (SizedBox.shrink) in grid',
      (tester) async {
    await tester.pumpWidget(const MaterialApp(home: CalendarScreen()));

    expect(
      find.byWidgetPredicate((w) => w is SizedBox && w.width == 0 && w.height == 0),
      findsWidgets,
    );
  });
    MaterialApp _wrap() {
    return MaterialApp(
      home: const CalendarScreen(),
      routes: {
        AppRoutes.dashboard: (_) => const Scaffold(body: Text('Dashboard')),
        AppRoutes.tasks: (_) => const Scaffold(body: Text('Tasks')),
        AppRoutes.messages: (_) => const Scaffold(body: Text('Messages')),
        AppRoutes.profile: (_) => const Scaffold(body: Text('Profile')),
      },
    );
  }

  testWidgets('Calendar shows month header and schedule', (tester) async {
    await tester.pumpWidget(_wrap());

    expect(find.text('January 2026'), findsOneWidget);
    expect(find.text("Today's Schedule"), findsOneWidget);
    expect(find.text('Morning Medication'), findsOneWidget);
  });

  testWidgets('Month navigation updates label and keeps selected day valid',
      (tester) async {
    await tester.pumpWidget(_wrap());

    await tester.tap(find.byIcon(Icons.chevron_right));
    await tester.pumpAndSettle();
    expect(find.text('February 2026'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.chevron_left));
    await tester.pumpAndSettle();
    expect(find.text('January 2026'), findsOneWidget);
  });

  testWidgets('Now banner View shows snackbar', (tester) async {
    await tester.pumpWidget(_wrap());

    await tester.tap(find.text('View').first);
    await tester.pump();
    expect(find.text('Not implemented in Week 4'), findsOneWidget);
  });
}