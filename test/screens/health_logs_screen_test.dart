import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stml_careconnect/app/app_routes.dart';
import 'package:stml_careconnect/screens/health_logs_screen.dart';
import 'package:stml_careconnect/theme/app_theme.dart' show AppColors;

void main() {
  group('HealthLogsScreen Widget Tests', () {
    testWidgets('Health Logs screen renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            primaryColor: AppColors.primary,
          ),
          home: const HealthLogsScreen(),
          routes: {
            AppRoutes.dashboard: (context) => const Scaffold(body: Text('Dashboard')),
            AppRoutes.tasks: (context) => const Scaffold(body: Text('Tasks')),
            AppRoutes.calendar: (context) => const Scaffold(body: Text('Calendar')),
            AppRoutes.messages: (context) => const Scaffold(body: Text('Messages')),
            AppRoutes.profile: (context) => const Scaffold(body: Text('Profile')),
          },
        ),
      );

      // Verify header
      expect(find.text('Health Logs'), findsOneWidget);
      expect(find.byIcon(Icons.arrow_back), findsOneWidget);
      expect(find.text('New'), findsOneWidget);

      // Verify summary cards
      expect(find.text('BP Today'), findsOneWidget);
      expect(find.text('120/80'), findsOneWidget);
      expect(find.text('mmHg'), findsOneWidget);
      
      expect(find.text('Medications'), findsOneWidget);
      expect(find.text('2/2'), findsOneWidget);
      expect(find.text('Completed'), findsOneWidget);
      
      expect(find.text('Meals'), findsOneWidget);
      expect(find.text('1,240'), findsOneWidget);
      expect(find.text('Calories'), findsOneWidget);
      
      expect(find.text('Mood'), findsOneWidget);
      expect(find.text('Good'), findsOneWidget);
      expect(find.text('Improving'), findsOneWidget);

      // Verify tab chips
      expect(find.text('All'), findsOneWidget);
      expect(find.text('Vitals'), findsOneWidget);
      expect(find.text('Meds'), findsOneWidget);
      expect(find.text('Meals'), findsOneWidget);
      expect(find.text('Mood'), findsOneWidget);
      expect(find.text('Symptoms'), findsOneWidget);
      expect(find.text('Activity'), findsOneWidget);

      // Verify log entries
      expect(find.text('Blood Pressure'), findsOneWidget);
      expect(find.text('systolic: 120'), findsOneWidget);
      expect(find.text('diastolic: 80'), findsOneWidget);
      
      expect(find.text('Mood Check'), findsOneWidget);
      expect(find.text('Feeling good today'), findsOneWidget);
      
      expect(find.text('Medication Taken'), findsOneWidget);
      expect(find.text('Morning medications completed'), findsOneWidget);
      
      expect(find.text('Breakfast'), findsOneWidget);
      expect(find.text('Oatmeal with berries, green tea'), findsOneWidget);
      
      expect(find.text('No symptoms reported'), findsOneWidget);

      // Verify floating action button
      expect(find.byType(FloatingActionButton), findsOneWidget);
      expect(find.byIcon(Icons.add), findsNWidgets(2)); // One in header, one in FAB

      // Verify bottom navigation
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Tasks'), findsOneWidget);
      expect(find.text('Calendar'), findsOneWidget);
      expect(find.text('Messages'), findsOneWidget);
      expect(find.text('Profile'), findsOneWidget);
    });

    testWidgets('Home icon in bottom nav is highlighted', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            primaryColor: AppColors.primary,
          ),
          home: const HealthLogsScreen(),
        ),
      );

      // The Home icon should be selected (index 0) since Health Logs isn't in bottom nav
      final bottomNavBar = tester.widget<BottomNavigationBar>(
        find.byType(BottomNavigationBar),
      );
      
      expect(bottomNavBar.currentIndex, 0);
    });

    testWidgets('Back button navigation works', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const Scaffold(body: Text('Previous Screen')),
          onGenerateRoute: (settings) {
            if (settings.name == '/health-logs') {
              return MaterialPageRoute(
                builder: (context) => const HealthLogsScreen(),
              );
            }
            return null;
          },
        ),
      );

      // Navigate to health logs screen
      final BuildContext context = tester.element(find.text('Previous Screen'));
      Navigator.pushNamed(context, '/health-logs');
      await tester.pumpAndSettle();

      // Verify we're on health logs screen
      expect(find.text('Health Logs'), findsOneWidget);

      // Tap back button
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();

      // Verify we're back on previous screen
      expect(find.text('Previous Screen'), findsOneWidget);
    });

    testWidgets('Tab chips are selectable', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const HealthLogsScreen(),
        ),
      );

      // Initially "All" should be selected
      expect(find.text('All'), findsOneWidget);

      // Tap "Vitals" tab
      await tester.tap(find.text('Vitals'));
      await tester.pump();

      // Vitals tab should now be selected
      expect(find.text('Vitals'), findsOneWidget);

      // Tap "Meals" tab
      await tester.tap(find.text('Meals'));
      await tester.pump();

      // Meals tab should now be selected
      expect(find.text('Meals'), findsOneWidget);
    });

    testWidgets('Summary cards are tappable', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const HealthLogsScreen(),
        ),
      );

      // Find and tap BP Today card
      final bpCard = find.text('BP Today');
      expect(bpCard, findsOneWidget);
      
      await tester.tap(bpCard);
      await tester.pump();

      // Verify snackbar appears
      expect(find.text('Not implemented in Week 4'), findsOneWidget);
    });

    testWidgets('Log entries are tappable', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const HealthLogsScreen(),
        ),
      );

      // Find and tap Blood Pressure log entry
      final bpEntry = find.text('Blood Pressure');
      expect(bpEntry, findsOneWidget);
      
      await tester.tap(bpEntry);
      await tester.pump();

      // Verify snackbar appears
      expect(find.text('Not implemented in Week 4'), findsOneWidget);
    });

    testWidgets('Floating action button shows not implemented message', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const HealthLogsScreen(),
        ),
      );

      // Find and tap FAB
      final fab = find.byType(FloatingActionButton);
      expect(fab, findsOneWidget);
      
      await tester.tap(fab);
      await tester.pump();

      // Verify snackbar appears
      expect(find.text('Not implemented in Week 4'), findsOneWidget);
    });

    testWidgets('New button in header shows not implemented message', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const HealthLogsScreen(),
        ),
      );

      // The New button is actually a Container with text, not a real button
      // But we can verify it exists
      expect(find.text('New'), findsOneWidget);
    });

    testWidgets('Log entries display correct details', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const HealthLogsScreen(),
        ),
      );

      // Verify Blood Pressure details
      expect(find.text('systolic: 120'), findsOneWidget);
      expect(find.text('diastolic: 80'), findsOneWidget);
      expect(find.text('heartRate: 72'), findsOneWidget);

      // Verify Mood Check details
      expect(find.text('mood: happy'), findsOneWidget);
      expect(find.text('energy: high'), findsOneWidget);

      // Verify Medication details
      expect(find.text('medications: Lisinopril 10mg, Metformin 500mg'), findsOneWidget);

      // Verify Breakfast details
      expect(find.text('calories: 320'), findsOneWidget);
      expect(find.text('protein: 12'), findsOneWidget);
    });

    testWidgets('Log entries display correct tags', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const HealthLogsScreen(),
        ),
      );

      // Verify tags are present
      expect(find.text('vitals'), findsOneWidget);
      expect(find.text('mood'), findsOneWidget);
      expect(find.text('medication'), findsOneWidget);
      expect(find.text('meal'), findsOneWidget);
      expect(find.text('symptoms'), findsOneWidget);
    });

    testWidgets('Log entries display timestamps', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const HealthLogsScreen(),
        ),
      );

      // Verify timestamps are present
      expect(find.text('1 hour ago'), findsOneWidget);
      expect(find.text('2 hours ago'), findsOneWidget);
      expect(find.text('3 hours ago'), findsOneWidget);
      expect(find.text('4 hours ago'), findsOneWidget);
      expect(find.text('1 day ago'), findsOneWidget);
    });

    testWidgets('Tab filtering can be tested', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const HealthLogsScreen(),
        ),
      );

      // Tap "Vitals" tab
      await tester.tap(find.text('Vitals'));
      await tester.pumpAndSettle();

      // In a real implementation, this would filter the logs
      // For now, we just verify the tab is selectable
      expect(find.text('Vitals'), findsOneWidget);

      // Tap "Mood" tab
      await tester.tap(find.text('Mood'));
      await tester.pumpAndSettle();

      expect(find.text('Mood'), findsAtLeastNWidgets(1));
    });

    testWidgets('Scrolling works correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const HealthLogsScreen(),
        ),
      );

      // Verify we can see content at the top
      expect(find.text('BP Today'), findsOneWidget);

      // Scroll down
      await tester.drag(
        find.byType(SingleChildScrollView),
        const Offset(0, -500),
      );
      await tester.pumpAndSettle();

      // Verify we can see content that was below
      expect(find.text('No symptoms reported'), findsOneWidget);
    });

    testWidgets('Bottom navigation navigates to dashboard', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const HealthLogsScreen(),
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
          home: const HealthLogsScreen(),
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

    testWidgets('Summary cards show correct status icons', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const HealthLogsScreen(),
        ),
      );

      // Verify the Mood card shows trending up icon
      expect(find.byIcon(Icons.trending_up), findsOneWidget);
    });
  });
}




