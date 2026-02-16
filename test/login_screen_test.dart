import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stml_careconnect/screens/login_screen.dart';

void main() {
  testWidgets('Login screen shows header and sign in', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

    expect(find.text('Welcome Back'), findsOneWidget);
    expect(find.text('Sign In'), findsOneWidget);
  });
  testWidgets('Face ID button shows not implemented snackbar', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

    await tester.tap(find.text('Sign in with Face ID / Touch ID'));
    await tester.pump();

    expect(find.text('Not implemented in Week 4'), findsOneWidget);
  });

  testWidgets('Password visibility toggle flips icon', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

    // Initially obscure = true => visibility_off
    expect(find.byIcon(Icons.visibility_off_outlined), findsOneWidget);

    await tester.tap(find.byIcon(Icons.visibility_off_outlined));
    await tester.pump();

    // Now obscure = false => visibility
    expect(find.byIcon(Icons.visibility_outlined), findsOneWidget);
  });

  testWidgets('Remember me checkbox handles null safely', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

    final checkbox = tester.widget<Checkbox>(find.byType(Checkbox));
    checkbox.onChanged!(null); // hits: value ?? false

    await tester.pump();

    expect(find.byType(Checkbox), findsOneWidget);
  });
}
