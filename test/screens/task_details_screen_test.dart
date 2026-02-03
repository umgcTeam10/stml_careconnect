import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stml_careconnect/screens/task_details_screen.dart';

void main() {
  testWidgets('Task details screen renders placeholder', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: TaskDetailsScreen()));

    expect(find.text('Task Details'), findsOneWidget);
    expect(find.text('Placeholder (Week 4)'), findsOneWidget);
  });
}
