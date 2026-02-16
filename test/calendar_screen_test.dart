import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stml_careconnect/app/app_routes.dart';
import 'package:stml_careconnect/screens/calendar_screen.dart';

void main() {
  MaterialApp _wrap({double textScale = 1.0}) {
    return MaterialApp(
      home: MediaQuery(
        data: MediaQueryData(textScaler: TextScaler.linear(textScale)),
        child: const CalendarScreen(),
      ),
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

  testWidgets('Calendar month navigation updates label', (tester) async {
    await tester.pumpWidget(_wrap());

    await tester.tap(find.byTooltip('Next month'));
    await tester.pumpAndSettle();
    expect(find.text('February 2026'), findsOneWidget);

    await tester.tap(find.byTooltip('Previous month'));
    await tester.pumpAndSettle();
    expect(find.text('January 2026'), findsOneWidget);
  });

  testWidgets('Calendar now banner View shows snackbar', (tester) async {
    await tester.pumpWidget(_wrap());

    await tester.tap(find.text('View'));
    await tester.pump();

    expect(find.text('Not implemented in Week 4'), findsOneWidget);
  });

  testWidgets('Calendar renders empty cells in grid', (tester) async {
    await tester.pumpWidget(_wrap());

    expect(
      find.byWidgetPredicate(
        (w) => w is SizedBox && w.width == 0 && w.height == 0,
      ),
      findsWidgets,
    );
  });

  testWidgets('Calendar supports 200% text scaling', (tester) async {
    await tester.pumpWidget(_wrap(textScale: 2.0));
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
  });

  testWidgets('Calendar follows Flutter accessibility guidelines', (
    tester,
  ) async {
    await tester.pumpWidget(_wrap());

    await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));
    await expectLater(tester, meetsGuideline(androidTapTargetGuideline));
    await expectLater(tester, meetsGuideline(textContrastGuideline));
  });
}
