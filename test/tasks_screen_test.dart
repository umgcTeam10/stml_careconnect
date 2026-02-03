import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stml_careconnect/app/app_routes.dart';
import 'package:stml_careconnect/screens/tasks_screen.dart';

void main() {
  testWidgets('Tasks shows overview actions', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: TasksScreen(),
      ),
    );

    expect(find.text('Add Task'), findsOneWidget);
    expect(find.text('You have 2 overdue tasks'), findsOneWidget);
    expect(find.text('Snooze 10 min'), findsOneWidget);
  });

  testWidgets('Tasks shows task cards', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: TasksScreen(),
      ),
    );

    expect(find.text('Blood Pressure Check'), findsOneWidget);
    expect(find.text('Prepare Lunch'), findsOneWidget);
    expect(find.text('Reschedule'), findsWidgets);
    expect(find.text('With breakfast'), findsOneWidget);
    expect(find.text('With lunch'), findsOneWidget);
  });
    testWidgets('Add Task shows not implemented snackbar', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: TasksScreen()));

    await tester.tap(find.text('Add Task'));
    await tester.pump();

    expect(find.text('Not implemented in Week 4'), findsOneWidget);
  });

    MaterialApp _wrap() {
    return MaterialApp(
      home: const TasksScreen(),
      routes: {
        AppRoutes.dashboard: (_) => const Scaffold(body: Text('Dashboard')),
        AppRoutes.calendar: (_) => const Scaffold(body: Text('Calendar')),
        AppRoutes.messages: (_) => const Scaffold(body: Text('Messages')),
        AppRoutes.profile: (_) => const Scaffold(body: Text('Profile')),
      },
    );
  }
 
}
