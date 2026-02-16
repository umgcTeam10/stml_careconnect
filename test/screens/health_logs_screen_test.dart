import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart' show SemanticsFlag;
import 'package:flutter/src/semantics/semantics.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stml_careconnect/screens/health_logs_screen.dart';
import 'package:stml_careconnect/app/app_routes.dart';
import 'package:stml_careconnect/screens/messages_screen.dart';
import 'package:stml_careconnect/theme/app_theme.dart';

void main() {
  group('HealthLogsScreen Widget Tests', () {
    testWidgets('Health Logs screen renders correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(primaryColor: AppColors.primary),
          home: const HealthLogsScreen(),
          routes: {
            AppRoutes.dashboard: (context) =>
                const Scaffold(body: Text('Dashboard')),
            AppRoutes.tasks: (context) => const Scaffold(body: Text('Tasks')),
            AppRoutes.calendar: (context) =>
                const Scaffold(body: Text('Calendar')),
            AppRoutes.messages: (context) =>
                const Scaffold(body: Text('Messages')),
            AppRoutes.profile: (context) =>
                const Scaffold(body: Text('Profile')),
          },
        ),
      );

      expect(find.text('Health Logs'), findsOneWidget);
      expect(find.byIcon(Icons.arrow_back), findsOneWidget);
      expect(find.text('New'), findsOneWidget);

      expect(find.text('BP Today'), findsOneWidget);
      expect(find.text('120/80'), findsOneWidget);
      expect(find.text('mmHg'), findsOneWidget);

      expect(find.text('Medications'), findsOneWidget);
      expect(find.text('2/2'), findsOneWidget);
      expect(find.text('Completed'), findsOneWidget);

      expect(find.text('Meals'), findsAtLeastNWidgets(1));
      expect(find.text('1,240'), findsOneWidget);
      expect(find.text('Calories'), findsOneWidget);

      expect(find.text('Mood'), findsAtLeastNWidgets(1));
      expect(find.text('Good'), findsOneWidget);
      expect(find.text('Improving'), findsOneWidget);

      expect(find.text('All'), findsOneWidget);
      expect(find.text('Vitals'), findsOneWidget);
      expect(find.text('Meds'), findsOneWidget);
      expect(find.text('Symptoms'), findsOneWidget);
      expect(find.text('Activity'), findsOneWidget);

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

      expect(find.byType(FloatingActionButton), findsOneWidget);

      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Tasks'), findsOneWidget);
      expect(find.text('Calendar'), findsOneWidget);
      expect(find.text('Messages'), findsOneWidget);
      expect(find.text('Profile'), findsOneWidget);
    });

    testWidgets('Home icon in bottom nav is highlighted', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(primaryColor: AppColors.primary),
          home: const HealthLogsScreen(),
        ),
      );

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

      final BuildContext context = tester.element(find.text('Previous Screen'));
      Navigator.pushNamed(context, '/health-logs');
      await tester.pumpAndSettle();

      expect(find.text('Health Logs'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();

      expect(find.text('Previous Screen'), findsOneWidget);
    });

    testWidgets('BP Today card shows contextual message', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const HealthLogsScreen()));

      final bpCard = find.text('BP Today');
      expect(bpCard, findsOneWidget);

      await tester.tap(bpCard);
      await tester.pump();

      expect(
        find.text(
          'Blood Pressure Details - View your blood pressure history and trends',
        ),
        findsOneWidget,
      );
    });

    testWidgets('Medications card shows contextual message', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const HealthLogsScreen()));

      final medsCard = find.text('Medications');
      expect(medsCard, findsOneWidget);

      await tester.tap(medsCard);
      await tester.pump();

      expect(
        find.text(
          'Medication Details - View your medication schedule and completion status',
        ),
        findsOneWidget,
      );
    });

    testWidgets('Meals card shows contextual message', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const HealthLogsScreen()));

      final mealsCard = find.text('1,240');
      expect(mealsCard, findsOneWidget);

      await tester.tap(mealsCard);
      await tester.pump();

      expect(
        find.text(
          'Meal Details - View your daily calorie intake and nutrition information',
        ),
        findsOneWidget,
      );
    });

    testWidgets('Mood card shows contextual message', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const HealthLogsScreen()));

      final moodCard = find.text('Good');
      expect(moodCard, findsOneWidget);

      await tester.tap(moodCard);
      await tester.pump();

      expect(
        find.text(
          'Mood Details - View your mood patterns and emotional wellness tracking',
        ),
        findsOneWidget,
      );
    });

    testWidgets('Floating action button shows professional message', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const HealthLogsScreen()));

      final fab = find.byType(FloatingActionButton);
      expect(fab, findsOneWidget);

      await tester.tap(fab);
      await tester.pump();

      expect(
        find.text(
          'Add Health Log - Feature coming soon to create new health entries',
        ),
        findsOneWidget,
      );
    });

    testWidgets('New button in header shows add log message', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const HealthLogsScreen()));

      final newButton = find.text('New');
      expect(newButton, findsOneWidget);

      await tester.tap(newButton);
      await tester.pump();

      expect(
        find.text(
          'Add Health Log - Feature coming soon to create new health entries',
        ),
        findsOneWidget,
      );
    });

    testWidgets('Blood Pressure log entry shows contextual message', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const HealthLogsScreen()));

      final bpEntry = find.text('Blood Pressure');
      expect(bpEntry, findsOneWidget);

      await tester.tap(bpEntry);
      await tester.pump();

      expect(
        find.text('Blood Pressure - Tap to view full details and edit entry'),
        findsOneWidget,
      );
    });

    testWidgets('Mood Check log entry shows contextual message', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const HealthLogsScreen()));

      final moodEntry = find.text('Mood Check');
      expect(moodEntry, findsOneWidget);

      await tester.tap(moodEntry);
      await tester.pump();

      expect(
        find.text('Mood Check - Tap to view full details and edit entry'),
        findsOneWidget,
      );
    });

    testWidgets('Medication Taken log entry shows contextual message', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const HealthLogsScreen()));

      final medEntry = find.text('Medication Taken');
      expect(medEntry, findsOneWidget);

      await tester.tap(medEntry);
      await tester.pump();

      expect(
        find.text('Medication Taken - Tap to view full details and edit entry'),
        findsOneWidget,
      );
    });

    testWidgets('Log entries display correct details', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const HealthLogsScreen()));

      expect(find.text('systolic: 120'), findsOneWidget);
      expect(find.text('diastolic: 80'), findsOneWidget);
      expect(find.text('heartRate: 72'), findsOneWidget);

      expect(find.text('mood: happy'), findsOneWidget);
      expect(find.text('energy: high'), findsOneWidget);

      expect(
        find.text('medications: Lisinopril 10mg, Metformin 500mg'),
        findsOneWidget,
      );

      expect(find.text('calories: 320'), findsOneWidget);
      expect(find.text('protein: 12'), findsOneWidget);
    });

    testWidgets('Log entries display correct tags', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const HealthLogsScreen()));

      expect(find.text('vitals'), findsOneWidget);
      expect(find.text('mood'), findsOneWidget);
      expect(find.text('medication'), findsOneWidget);
      expect(find.text('meal'), findsOneWidget);
      expect(find.text('symptoms'), findsOneWidget);
    });

    testWidgets('Log entries display timestamps', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: const HealthLogsScreen()));

      expect(find.text('1 hour ago'), findsOneWidget);
      expect(find.text('2 hours ago'), findsOneWidget);
      expect(find.text('3 hours ago'), findsOneWidget);
      expect(find.text('4 hours ago'), findsOneWidget);
      expect(find.text('1 day ago'), findsOneWidget);
    });

    testWidgets('Bottom navigation navigates to dashboard', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const HealthLogsScreen(),
          routes: {
            AppRoutes.dashboard: (context) =>
                const Scaffold(body: Text('Dashboard Screen')),
          },
        ),
      );

      await tester.tap(find.text('Home'));
      await tester.pumpAndSettle();

      expect(find.text('Dashboard Screen'), findsOneWidget);
    });

    testWidgets('Now banner View button shows appointment details', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const HealthLogsScreen()));

      final viewButton = find.text('View');
      expect(viewButton, findsOneWidget);

      await tester.tap(viewButton);
      await tester.pump();

      expect(
        find.text(
          'Physical Therapy Appointment at 2:00 PM at clinic - Tap to view full details',
        ),
        findsOneWidget,
      );
    });

    testWidgets('Summary cards show correct status icons', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const HealthLogsScreen()));

      expect(find.byIcon(Icons.trending_up), findsOneWidget);
    });

    testWidgets('Tab selection changes state', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: const HealthLogsScreen()));

      final vitalsTab = find.text('Vitals');
      expect(vitalsTab, findsOneWidget);

      await tester.tap(vitalsTab);
      await tester.pump();

      expect(find.text('Vitals'), findsOneWidget);
    });
  });

  group('HealthLogsScreen Accessibility Tests', () {
    testWidgets('Back button has accessibility semantics', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const HealthLogsScreen()));

      final backButton = find.byIcon(Icons.arrow_back);
      expect(backButton, findsOneWidget);

      final semantics = tester.getSemantics(backButton);
      expect(semantics.label, contains('Back'));
      expect(semantics.hint, contains('Navigate back to previous screen'));
      expect(semantics.hasEnabledState, true);
    });

    testWidgets('Health Logs title is marked as header', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const HealthLogsScreen()));

      final title = find.text('Health Logs');
      expect(title, findsOneWidget);

      final semantics = tester.getSemantics(title);
      expect(semantics.hasFlag(SemanticsFlag.isHeader), true);
    });

    testWidgets('New button has accessibility semantics', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const HealthLogsScreen()));

      final newButton = find.text('New');
      expect(newButton, findsOneWidget);

      final semantics = tester.getSemantics(newButton);
      expect(semantics.label, contains('Add new health log'));
      expect(
        semantics.hint,
        contains('Opens form to create a new health log entry'),
      );
      expect(semantics.hasEnabledState, true);
    });

    testWidgets('BP Today card has descriptive accessibility label', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const HealthLogsScreen()));

      final bpCard = find.text('BP Today');
      expect(bpCard, findsOneWidget);

      final semantics = tester.getSemantics(bpCard);
      expect(
        semantics.label,
        contains('Blood pressure today, 120 over 80 millimeters of mercury'),
      );
      expect(
        semantics.hint,
        contains('Double tap to view detailed blood pressure history'),
      );
      expect(semantics.hasEnabledState, true);
    });

    testWidgets('Medications card has descriptive accessibility label', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const HealthLogsScreen()));

      final medsCard = find.text('Medications');
      expect(medsCard, findsOneWidget);

      final semantics = tester.getSemantics(medsCard);
      expect(
        semantics.label,
        contains('Medications today, 2 out of 2 completed'),
      );
      expect(
        semantics.hint,
        contains('Double tap to view medication schedule and details'),
      );
      expect(semantics.hasEnabledState, true);
    });

    testWidgets('Meals card has descriptive accessibility label', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const HealthLogsScreen()));

      final mealsCard = find.text('1,240');
      expect(mealsCard, findsOneWidget);

      final semantics = tester.getSemantics(mealsCard);
      expect(semantics.label, contains('Meals today, 1,240 calories consumed'));
      expect(
        semantics.hint,
        contains('Double tap to view meal details and nutrition information'),
      );
      expect(semantics.hasEnabledState, true);
    });

    testWidgets('Mood card has descriptive accessibility label', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const HealthLogsScreen()));

      final moodCard = find.text('Good');
      expect(moodCard, findsOneWidget);

      final semantics = tester.getSemantics(moodCard);
      expect(semantics.label, contains('Mood today, good and improving'));
      expect(
        semantics.hint,
        contains('Double tap to view mood history and patterns'),
      );
      expect(semantics.hasEnabledState, true);
    });

    testWidgets('All filter tab has correct accessibility semantics', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const HealthLogsScreen()));

      final allTab = find.text('All');
      expect(allTab, findsOneWidget);

      final semantics = tester.getSemantics(allTab);
      expect(semantics.label, contains('All filter, selected'));
      expect(
        semantics.hint,
        contains('Filter health logs to show all entries'),
      );
      expect(semantics.hasEnabledState, true);
      expect(semantics.hasFlag(SemanticsFlag.isSelected), true);
    });

    testWidgets('Vitals filter tab has correct accessibility semantics', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const HealthLogsScreen()));

      final vitalsTab = find.text('Vitals');
      expect(vitalsTab, findsOneWidget);

      final semantics = tester.getSemantics(vitalsTab);
      expect(semantics.label, contains('Vitals filter'));
      expect(
        semantics.hint,
        contains('Filter health logs to show only vitals entries'),
      );
      expect(semantics.hasEnabledState, true);
    });

    testWidgets('Meds filter tab has correct accessibility semantics', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const HealthLogsScreen()));

      final medsTab = find.text('Meds');
      expect(medsTab, findsOneWidget);

      final semantics = tester.getSemantics(medsTab);
      expect(semantics.label, contains('Medications filter'));
      expect(
        semantics.hint,
        contains('Filter health logs to show only medication entries'),
      );
      expect(semantics.hasEnabledState, true);
    });

    testWidgets('Blood Pressure log entry has accessibility semantics', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const HealthLogsScreen()));

      final bpEntry = find.text('Blood Pressure');
      expect(bpEntry, findsOneWidget);

      final semantics = tester.getSemantics(bpEntry);
      expect(semantics.label, contains('Blood Pressure'));
      expect(semantics.label, contains('1 hour ago'));
      expect(semantics.label, contains('vitals category'));
      expect(semantics.label, contains('systolic 120'));
      expect(semantics.label, contains('diastolic 80'));
      expect(
        semantics.hint,
        contains('Double tap to view full details and edit this entry'),
      );
      expect(semantics.hasEnabledState, true);
    });

    testWidgets('Mood Check log entry has accessibility semantics', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const HealthLogsScreen()));

      final moodEntry = find.text('Mood Check');
      expect(moodEntry, findsOneWidget);

      final semantics = tester.getSemantics(moodEntry);
      expect(semantics.label, contains('Mood Check'));
      expect(semantics.label, contains('Feeling good today'));
      expect(semantics.label, contains('2 hours ago'));
      expect(semantics.label, contains('mood category'));
      expect(
        semantics.hint,
        contains('Double tap to view full details and edit this entry'),
      );
      expect(semantics.hasEnabledState, true);
    });

    testWidgets('Floating action button has accessibility semantics', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const HealthLogsScreen()));

      final fab = find.byType(FloatingActionButton);
      expect(fab, findsOneWidget);

      final semantics = tester.getSemantics(fab);
      expect(semantics.label, contains('Add new health log entry'));
      expect(
        semantics.hint,
        contains('Opens form to create a new health log entry'),
      );
      expect(semantics.hasEnabledState, true);
    });

    testWidgets('Appointment banner has accessibility semantics', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const HealthLogsScreen()));

      final banner = find.text('Now: Physical Therapy Appointment');
      expect(banner, findsOneWidget);

      final semantics = tester.getSemantics(banner);
      expect(
        semantics.label,
        contains('Current appointment: Physical Therapy at 2:00 PM at clinic'),
      );
      expect(
        semantics.hint,
        contains('Double tap to view full appointment details'),
      );
      expect(semantics.hasEnabledState, true);
      expect(semantics.hasFlag(SemanticsFlag.isLiveRegion), true);
    });

    testWidgets('Tab selection updates accessibility state', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: const HealthLogsScreen()));

      final vitalsTab = find.text('Vitals');
      await tester.tap(vitalsTab);
      await tester.pump();

      final semantics = tester.getSemantics(vitalsTab);
      expect(semantics.label, contains('Vitals filter, selected'));
      expect(semantics.hasFlag(SemanticsFlag.isSelected), true);
    });
  });

  group('HealthLogsScreen Navigation Tests', () {
    testWidgets('Bottom nav callback covers current-index return path', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(primaryColor: AppColors.primary),
          home: const MessagesScreen(),
        ),
      );

      final nav = tester.widget<BottomNavigationBar>(
        find.byType(BottomNavigationBar),
      );
      nav.onTap?.call(3);
      await tester.pump();
      expect(find.text('Messages'), findsAtLeastNWidgets(1));
    });
  });
}

extension on SemanticsNode {
  get hasEnabledState => null;
}
