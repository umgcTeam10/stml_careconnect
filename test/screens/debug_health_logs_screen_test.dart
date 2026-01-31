import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stml_careconnect/screens/health_logs_screen.dart';

void main() {
  testWidgets('DEBUG: Print widget tree for HealthLogsScreen',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: HealthLogsScreen()),
    );

    await tester.pumpAndSettle();

    // This will print the entire widget tree to console
    debugDumpApp();
    
    // Try to find the card by type instead
    print('\n=== Looking for Cards ===');
    final cards = find.byType(Card);
    print('Found ${cards.evaluate().length} Card widgets');
    
    // Try to find by text
    print('\n=== Looking for Text ===');
    print('Blood Pressure: ${find.text('Blood Pressure').evaluate().length}');
    print('Mood Check: ${find.text('Mood Check').evaluate().length}');
    
    // Try to find by key
    print('\n=== Looking for Keys ===');
    print('bloodPressureCard: ${find.byKey(const Key('bloodPressureCard')).evaluate().length}');
    print('moodCheckCard: ${find.byKey(const Key('moodCheckCard')).evaluate().length}');
  });
}