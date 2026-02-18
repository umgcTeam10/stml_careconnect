import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stml_careconnect/app/app_routes.dart';
import 'package:stml_careconnect/screens/role_selection_screen.dart';

void main() {
  testWidgets('Role Selection screen shows title and options',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: RoleSelectionScreen()),
    );

    expect(find.text('Choose Your Role'), findsOneWidget);
    expect(find.text("I'm a Care Recipient"), findsOneWidget);
    expect(find.text("I'm a Caregiver"), findsOneWidget);
    expect(find.text('Continue'), findsOneWidget);
  });

  testWidgets('Role Selection: selecting a role then tapping Continue navigates to Login',
      (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: const RoleSelectionScreen(),
      routes: {
        AppRoutes.login: (_) => const Scaffold(body: Text('Login Screen')),
      },
    ));

    await tester.tap(find.text("I'm a Care Recipient"));
    await tester.pump();

    await tester.ensureVisible(find.text('Continue'));
    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();

    expect(find.text('Login Screen'), findsOneWidget);
  });
}
