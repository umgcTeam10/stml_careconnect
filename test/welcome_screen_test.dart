import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stml_careconnect/app/app_routes.dart';
import 'package:stml_careconnect/screens/welcome_screen.dart';

void main() {
  testWidgets('Welcome screen shows title and CTA',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: WelcomeScreen()),
    );

    expect(find.text('CareConnect'), findsOneWidget);
    expect(find.text('Get Started'), findsOneWidget);
    expect(find.text('Log in'), findsOneWidget);
  });

  testWidgets('Welcome: tapping Log in navigates to Login', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: const WelcomeScreen(),
      routes: {
        AppRoutes.login: (_) => const Scaffold(body: Text('Login Screen')),
      },
    ));

    await tester.tap(find.text('Log in'));
    await tester.pumpAndSettle();

    expect(find.text('Login Screen'), findsOneWidget);
  });

  testWidgets('Welcome: tapping Get Started navigates to Role Selection',
      (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: const WelcomeScreen(),
      routes: {
        AppRoutes.roleSelection: (_) =>
            const Scaffold(body: Text('Role Selection Screen')),
      },
    ));

    await tester.tap(find.text('Get Started'));
    await tester.pumpAndSettle();

    expect(find.text('Role Selection Screen'), findsOneWidget);
  });
}
