import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stml_careconnect/screens/messages_screen.dart';
import 'package:stml_careconnect/app/app_routes.dart';
import 'package:stml_careconnect/theme/app_theme.dart';

void main() {
  group('MessagesScreen Widget Tests', () {
    testWidgets('Messages screen renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            primaryColor: AppColors.primary,
          ),
          home: const MessagesScreen(),
          routes: {
            AppRoutes.dashboard: (context) => const Scaffold(body: Text('Dashboard')),
            AppRoutes.tasks: (context) => const Scaffold(body: Text('Tasks')),
            AppRoutes.calendar: (context) => const Scaffold(body: Text('Calendar')),
            AppRoutes.profile: (context) => const Scaffold(body: Text('Profile')),
          },
        ),
      );

      // Verify header - back button
      expect(find.byIcon(Icons.arrow_back), findsOneWidget);
      
      // Messages appears in both header and bottom nav
      expect(find.text('Messages'), findsAtLeastNWidgets(1));

      // Verify Emergency SOS button
      expect(find.text('Emergency SOS'), findsOneWidget);
      expect(find.byIcon(Icons.warning_outlined), findsOneWidget);

      // Verify Quick Contact section
      expect(find.text('Quick Contact'), findsOneWidget);
      expect(find.text('SJ'), findsOneWidget);
      expect(find.text('Sarah'), findsOneWidget);
      expect(find.text('Primary Care'), findsOneWidget);
      expect(find.text('DM'), findsOneWidget);
      expect(find.text('Dr.'), findsOneWidget);
      expect(find.text('Doctor'), findsOneWidget);
      expect(find.text('NC'), findsOneWidget);
      expect(find.text('Nurse'), findsOneWidget);
      expect(find.text('Home Care'), findsOneWidget);

      // Verify message input field
      expect(find.text('Type your message...'), findsOneWidget);
      expect(find.byIcon(Icons.send), findsOneWidget);

      // Verify quick reply chips
      expect(find.text('Yes'), findsOneWidget);
      expect(find.text('On my way'), findsOneWidget);
      expect(find.text('Call me'), findsOneWidget);

      // Verify Recent Messages section
      expect(find.text('Recent Messages'), findsOneWidget);
      expect(find.text('Robert Martinez'), findsAtLeastNWidgets(1));
      expect(find.text('Morning walk completed! Felt great today.'), findsOneWidget);
      expect(find.text('1 hour ago'), findsOneWidget);

      // Verify CareConnect notification
      expect(find.text('CareConnect'), findsOneWidget);
      expect(find.text('Reminder: Physical therapy appointment at 2:00 PM'), findsOneWidget);
      expect(find.text('Acknowledge'), findsOneWidget);
      expect(find.text('Snooze 10 min'), findsOneWidget);

      // Verify unread message
      expect(find.text('Can you pick up my prescription this afternoon?'), findsOneWidget);
      expect(find.text('Unread'), findsOneWidget);

      // Verify bottom navigation
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Tasks'), findsOneWidget);
      expect(find.text('Calendar'), findsOneWidget);
      expect(find.text('Profile'), findsOneWidget);
    });

    testWidgets('Messages icon in bottom nav is highlighted', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            primaryColor: AppColors.primary,
          ),
          home: const MessagesScreen(),
        ),
      );

      // The Messages icon should be selected (index 3)
      final bottomNavBar = tester.widget<BottomNavigationBar>(
        find.byType(BottomNavigationBar),
      );
      
      expect(bottomNavBar.currentIndex, 3);
    });

    testWidgets('Back button navigation works', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const Scaffold(body: Text('Previous Screen')),
          onGenerateRoute: (settings) {
            if (settings.name == '/messages') {
              return MaterialPageRoute(
                builder: (context) => const MessagesScreen(),
              );
            }
            return null;
          },
        ),
      );

      // Navigate to messages screen
      final BuildContext context = tester.element(find.text('Previous Screen'));
      Navigator.pushNamed(context, '/messages');
      await tester.pumpAndSettle();

      // Verify we're on messages screen - check for back button
      expect(find.byIcon(Icons.arrow_back), findsOneWidget);

      // Tap back button
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();

      // Verify we're back on previous screen
      expect(find.text('Previous Screen'), findsOneWidget);
    });

    testWidgets('Emergency SOS button shows not implemented message', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const MessagesScreen(),
        ),
      );

      // Find and tap Emergency SOS button
      final sosButton = find.text('Emergency SOS');
      expect(sosButton, findsOneWidget);
      
      await tester.tap(sosButton);
      await tester.pump();

      // Verify snackbar appears
      expect(find.text('Not implemented in Week 4'), findsOneWidget);
    });

    testWidgets('Quick contact avatars are tappable', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const MessagesScreen(),
        ),
      );

      // Find and tap Sarah's avatar
      final sarahAvatar = find.text('Sarah');
      expect(sarahAvatar, findsOneWidget);
      
      await tester.tap(sarahAvatar);
      await tester.pump();

      // Verify snackbar appears
      expect(find.text('Not implemented in Week 4'), findsOneWidget);
    });

    testWidgets('Message input field is tappable', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const MessagesScreen(),
        ),
      );

      // Find and tap the message input field
      final messageInput = find.byType(TextField);
      expect(messageInput, findsOneWidget);
      
      await tester.tap(messageInput);
      await tester.pump();

      // Verify snackbar appears (since it's a placeholder interaction)
      expect(find.text('Not implemented in Week 4'), findsOneWidget);
    });

    testWidgets('Send button is tappable', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const MessagesScreen(),
        ),
      );

      // Find and tap the send button
      final sendButton = find.byIcon(Icons.send);
      expect(sendButton, findsOneWidget);
      
      await tester.tap(sendButton);
      await tester.pump();

      // Verify snackbar appears
      expect(find.text('Not implemented in Week 4'), findsOneWidget);
    });

    testWidgets('Bottom navigation navigates to dashboard', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const MessagesScreen(),
          routes: {
            AppRoutes.dashboard: (context) => const Scaffold(body: Text('Dashboard Screen')),
          },
        ),
      );

      // Tap Home icon
      await tester.tap(find.text('Home'));
      await tester.pumpAndSettle();

      // Verify navigation occurred
      expect(find.text('Dashboard Screen'), findsOneWidget);
    });

    testWidgets('Now banner View button works', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const MessagesScreen(),
        ),
      );

      // Find and tap View button in Now banner
      final viewButton = find.text('View');
      expect(viewButton, findsOneWidget);
      
      await tester.tap(viewButton);
      await tester.pump();

      // Verify snackbar appears
      expect(find.text('Not implemented in Week 4'), findsOneWidget);
    });
  });
}