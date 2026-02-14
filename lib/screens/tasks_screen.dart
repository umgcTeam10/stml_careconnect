import 'package:flutter/material.dart';
import '../app/app_routes.dart';
import '../theme/app_theme.dart';

const _headerColor = Color(0xFF0F4C81);
const _cardBorder = Color(0xFFE3E8F1);
const _mutedText = Color(0xFF5F6775);
const _chipBlue = Color(0xFFE6F0FF);
const _chipBlueText = Color(0xFF2F5DA8);
const _chipGreen = Color(0xFFE8F7EE);
const _chipGreenText = Color(0xFF1E7A46);
const _chipOrange = Color(0xFFFFF3E0);
const _chipOrangeText = Color(0xFFB45309);
const _chipGrey = Color(0xFFF1F5F9);
const _chipGreyText = Color(0xFF334155);
const _onHeaderSecondary = Color(0xFFDDE9FB);

Widget _orderedSection(double order, Widget child) {
  return FocusTraversalOrder(order: NumericFocusOrder(order), child: child);
}

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  void _showNotImplemented(BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Not implemented in Week 4')));
  }

  void _onNavTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, AppRoutes.dashboard);
        return;
      case 1:
        return;
      case 2:
        Navigator.pushReplacementNamed(context, AppRoutes.calendar);
        return;
      case 3:
        Navigator.pushReplacementNamed(context, AppRoutes.messages);
        return;
      case 4:
        Navigator.pushReplacementNamed(context, AppRoutes.profile);
        return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FocusTraversalGroup(
      policy: OrderedTraversalPolicy(),
      child: Scaffold(
        backgroundColor: AppColors.lightBackground,
        body: Column(
          children: [
            SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
                child: Row(
                  children: [
                    _orderedSection(
                      1,
                      Semantics(
                        button: true,
                        label: 'Go back',
                        child: IconButton(
                          onPressed: () => Navigator.pop(context),
                          tooltip: 'Back',
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      'Tasks',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(height: 1, color: _cardBorder),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Expanded(
                          child: _StatusCard(
                            value: '3',
                            label: 'Today',
                            background: Color(0xFFF2F7FF),
                            border: Color(0xFFDCE8FF),
                            valueColor: AppColors.primary,
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: _StatusCard(
                            value: '2',
                            label: 'Overdue',
                            background: Color(0xFFFFF5EC),
                            border: Color(0xFFF4D3B3),
                            valueColor: _chipOrangeText,
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: _StatusCard(
                            value: '1',
                            label: 'Done',
                            background: _chipGreen,
                            border: Color(0xFFD4EBDD),
                            valueColor: _chipGreenText,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: _orderedSection(
                            2,
                            Semantics(
                              button: true,
                              label: 'Add task',
                              hint: 'Adds a new task to your list',
                              child: ElevatedButton.icon(
                                onPressed: () => _showNotImplemented(context),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: _headerColor,
                                  foregroundColor: Colors.white,
                                  minimumSize: const Size(0, 48),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 14,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                icon: const Icon(Icons.add),
                                label: const Text('Add Task'),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        SizedBox(
                          width: 48,
                          height: 48,
                          child: _orderedSection(
                            3,
                            Semantics(
                              button: true,
                              label: 'Filter tasks',
                              hint: 'Opens task filters',
                              child: OutlinedButton(
                                onPressed: () => _showNotImplemented(context),
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.black87,
                                  minimumSize: const Size(48, 48),
                                  padding: EdgeInsets.zero,
                                  alignment: Alignment.center,
                                  side: const BorderSide(color: _cardBorder),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: const Icon(
                                  Icons.filter_alt_outlined,
                                  semanticLabel: 'Filter tasks',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _orderedSection(
                      4,
                      _AlertCard(
                        icon: Icons.error_outline,
                        message: 'You have 2 overdue tasks',
                        onView: () => _showNotImplemented(context),
                      ),
                    ),
                    const SizedBox(height: 16),
                    _orderedSection(
                      5,
                      _NowTaskCard(
                        onStart: () => _showNotImplemented(context),
                        onSnooze: () => _showNotImplemented(context),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: const [
                        _FilterPill(label: 'Upcoming', selected: true),
                        _FilterPill(label: 'Today'),
                        _FilterPill(label: 'Overdue'),
                        _FilterPill(label: 'Done'),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _orderedSection(
                      6,
                      _TaskCard(
                        icon: Icons.monitor_heart_outlined,
                        title: 'Blood Pressure Check',
                        description: 'Record morning blood pressure reading',
                        time: '09:00 AM',
                        date: 'Jan 31',
                        severity: 'medium',
                        tag: 'With breakfast',
                        onPrimary: () => _showNotImplemented(context),
                        onSecondary: () => _showNotImplemented(context),
                        primaryLabel: 'Done',
                        secondaryLabel: 'Reschedule',
                      ),
                    ),
                    const SizedBox(height: 16),
                    _orderedSection(
                      7,
                      _TaskCard(
                        icon: Icons.restaurant_menu,
                        title: 'Prepare Lunch',
                        description: 'Low-sodium, diabetic-friendly meal',
                        time: '12:00 PM',
                        date: 'Jan 31',
                        severity: 'medium',
                        tag: 'With lunch',
                        onPrimary: () => _showNotImplemented(context),
                        onSecondary: () => _showNotImplemented(context),
                        primaryLabel: 'Done',
                        secondaryLabel: 'Reschedule',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: _orderedSection(
          8,
          _TasksBottomBar(
            onTap: (index) => _onNavTap(context, index),
            onNowTap: () => _showNotImplemented(context),
          ),
        ),
      ),
    );
  }
}

class _StatusCard extends StatelessWidget {
  const _StatusCard({
    required this.value,
    required this.label,
    required this.background,
    required this.border,
    required this.valueColor,
  });

  final String value;
  final String label;
  final Color background;
  final Color border;
  final Color valueColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: border),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: valueColor,
            ),
          ),
          const SizedBox(height: 6),
          Text(label, style: const TextStyle(fontSize: 13, color: _mutedText)),
        ],
      ),
    );
  }
}

class _AlertCard extends StatelessWidget {
  const _AlertCard({
    required this.icon,
    required this.message,
    required this.onView,
  });

  final IconData icon;
  final String message;
  final VoidCallback onView;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _chipOrange,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _chipOrangeText.withOpacity(0.45)),
      ),
      child: Row(
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: _chipOrangeText.withOpacity(0.3)),
            ),
            child: Icon(icon, color: _chipOrangeText, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
          OutlinedButton(
            onPressed: onView,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.black87,
              backgroundColor: Colors.white,
              minimumSize: const Size(48, 48),
              side: const BorderSide(color: _cardBorder),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Semantics(
              button: true,
              label: 'View overdue tasks',
              child: Text('View'),
            ),
          ),
        ],
      ),
    );
  }
}

class _NowTaskCard extends StatelessWidget {
  const _NowTaskCard({required this.onStart, required this.onSnooze});

  final VoidCallback onStart;
  final VoidCallback onSnooze;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _cardBorder),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  color: _headerColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.notifications_none,
                  color: Colors.white,
                  size: 18,
                ),
              ),
              const SizedBox(width: 10),
              const _TagChip(
                label: 'Now',
                background: _headerColor,
                foreground: Colors.white,
              ),
              const SizedBox(width: 10),
              const Icon(
                Icons.local_hospital_outlined,
                size: 18,
                color: _mutedText,
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'Physical Therapy Appointment',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 6),
          Wrap(
            spacing: 8,
            runSpacing: 6,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: const [
              Text(
                'Due now',
                style: TextStyle(fontSize: 13, color: _mutedText),
              ),
              Text('•', style: TextStyle(color: _mutedText)),
              Icon(Icons.schedule, size: 14, color: _mutedText),
              Text(
                '02:00 PM',
                style: TextStyle(fontSize: 13, color: _mutedText),
              ),
              Text('•', style: TextStyle(color: _mutedText)),
              Icon(Icons.location_on_outlined, size: 14, color: _mutedText),
              Text(
                'At clinic',
                style: TextStyle(fontSize: 13, color: _mutedText),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Semantics(
                  button: true,
                  label: 'Start physical therapy appointment',
                  child: ElevatedButton(
                    onPressed: onStart,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _headerColor,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(0, 48),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('Start'),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Semantics(
                  button: true,
                  label: 'Snooze appointment for 10 minutes',
                  child: OutlinedButton(
                    onPressed: onSnooze,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.black87,
                      minimumSize: const Size(0, 48),
                      side: const BorderSide(color: _cardBorder),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('Snooze 10 min'),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _FilterPill extends StatelessWidget {
  const _FilterPill({required this.label, this.selected = false});

  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? _chipGrey : Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: _cardBorder),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 13,
          color: selected ? _chipGreyText : _mutedText,
          fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
        ),
      ),
    );
  }
}

class _TaskCard extends StatelessWidget {
  const _TaskCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.time,
    required this.date,
    required this.severity,
    required this.tag,
    required this.onPrimary,
    required this.onSecondary,
    required this.primaryLabel,
    required this.secondaryLabel,
  });

  final IconData icon;
  final String title;
  final String description;
  final String time;
  final String date;
  final String severity;
  final String tag;
  final VoidCallback onPrimary;
  final VoidCallback onSecondary;
  final String primaryLabel;
  final String secondaryLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _cardBorder),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  border: Border.all(color: _cardBorder),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(icon, size: 18, color: _mutedText),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            title,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      description,
                      style: const TextStyle(fontSize: 13, color: _mutedText),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Wrap(
                  spacing: 8,
                  runSpacing: 6,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    const Icon(Icons.schedule, size: 14, color: _mutedText),
                    Text(
                      time,
                      style: const TextStyle(fontSize: 12, color: _mutedText),
                    ),
                    const Icon(
                      Icons.calendar_today_outlined,
                      size: 14,
                      color: _mutedText,
                    ),
                    Text(
                      date,
                      style: const TextStyle(fontSize: 12, color: _mutedText),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              _TagChip(
                label: severity,
                background: _headerColor,
                foreground: Colors.white,
              ),
            ],
          ),
          const SizedBox(height: 10),
          _TagChip(
            label: tag,
            background: _chipBlue,
            foreground: _chipBlueText,
            compact: false,
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: Semantics(
                  button: true,
                  label: '$primaryLabel task $title',
                  child: ElevatedButton(
                    onPressed: onPrimary,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _headerColor,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(0, 48),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(primaryLabel),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Semantics(
                  button: true,
                  label: '$secondaryLabel task $title',
                  child: OutlinedButton(
                    onPressed: onSecondary,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.black87,
                      minimumSize: const Size(0, 48),
                      side: const BorderSide(color: _cardBorder),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(secondaryLabel),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TagChip extends StatelessWidget {
  const _TagChip({
    required this.label,
    required this.background,
    required this.foreground,
    this.compact = true,
  });

  final String label;
  final Color background;
  final Color foreground;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: compact ? 10 : 12,
        vertical: compact ? 4 : 6,
      ),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: foreground,
          fontSize: compact ? 11 : 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _TasksBottomBar extends StatelessWidget {
  const _TasksBottomBar({required this.onTap, required this.onNowTap});

  final ValueChanged<int> onTap;
  final VoidCallback onNowTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: const BoxDecoration(
            color: _headerColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
          ),
          child: Row(
            children: [
              const Icon(Icons.schedule, color: _onHeaderSecondary, size: 18),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Now: Physical Therapy Appointment',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 4),
                    Wrap(
                      spacing: 6,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Icon(
                          Icons.schedule,
                          size: 12,
                          color: _onHeaderSecondary,
                        ),
                        Text(
                          '02:00 PM',
                          style: TextStyle(
                            color: _onHeaderSecondary,
                            fontSize: 11,
                          ),
                        ),
                        Text(
                          '•',
                          style: TextStyle(
                            color: _onHeaderSecondary,
                            fontSize: 11,
                          ),
                        ),
                        Icon(
                          Icons.local_hospital_outlined,
                          size: 12,
                          color: _onHeaderSecondary,
                        ),
                        Text(
                          'At clinic',
                          style: TextStyle(
                            color: _onHeaderSecondary,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Semantics(
                button: true,
                label: 'View current appointment',
                child: TextButton(
                  onPressed: onNowTap,
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    minimumSize: const Size(48, 48),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                  ),
                  child: Row(
                    children: const [
                      Text('View'),
                      SizedBox(width: 4),
                      Icon(Icons.arrow_forward, size: 14),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        ColoredBox(
          color: Colors.white,
          child: SafeArea(
            top: false,
            child: BottomNavigationBar(
              currentIndex: 1,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: AppColors.primary,
              unselectedItemColor: _mutedText,
              backgroundColor: Colors.white,
              elevation: 0,
              onTap: onTap,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.check_circle_outline),
                  label: 'Tasks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_today_outlined),
                  label: 'Calendar',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.chat_bubble_outline),
                  label: 'Messages',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
