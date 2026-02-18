import 'package:flutter/material.dart';
import '../app/app_routes.dart';
import '../theme/app_theme.dart';

const _headerColor = Color(0xFF0F4C81);
const _cardBorder = Color(0xFFE3E8F1);
const _mutedText = Color(0xFF5F6775);
const _chipRed = Color(0xFFFDECEC);
const _chipRedText = Color(0xFFC12C2C);
const _chipBlue = Color(0xFFE6F0FF);
const _chipBlueText = Color(0xFF2F5DA8);
const _chipTeal = Color(0xFF0E7C9A);
const _calendarSelected = Color(0xFF0F4C81);
const _onHeaderSecondary = Color(0xFFDDE9FB);

Widget _orderedSection(double order, Widget child) {
  return FocusTraversalOrder(order: NumericFocusOrder(order), child: child);
}

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _focusedMonth = DateTime(2026, 1, 1);
  DateTime _selectedDate = DateTime(2026, 1, 26);

  final List<DateTime> _eventDates = [DateTime(2026, 1, 27)];

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
        Navigator.pushReplacementNamed(context, AppRoutes.tasks);
        return;
      case 2:
        return;
      case 3:
        Navigator.pushReplacementNamed(context, AppRoutes.messages);
        return;
      case 4:
        Navigator.pushReplacementNamed(context, AppRoutes.profile);
        return;
    }
  }

  void _changeMonth(int offset) {
    setState(() {
      _focusedMonth = DateTime(
        _focusedMonth.year,
        _focusedMonth.month + offset,
      );
      final int daysInMonth = DateUtils.getDaysInMonth(
        _focusedMonth.year,
        _focusedMonth.month,
      );
      final int safeDay = _selectedDate.day.clamp(1, daysInMonth).toInt();
      _selectedDate = DateTime(
        _focusedMonth.year,
        _focusedMonth.month,
        safeDay,
      );
    });
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  bool _hasEvent(DateTime date) {
    for (final event in _eventDates) {
      if (_isSameDay(event, date)) {
        return true;
      }
    }
    return false;
  }

  String _monthLabel(DateTime date) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return '${months[date.month - 1]} ${date.year}';
  }

  String _monthName(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return months[month - 1];
  }

  String _weekdayName(int weekday) {
    const weekdays = [
      'Sunday',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
    ];
    return weekdays[weekday % 7];
  }

  String _daySemanticLabel(_CalendarDay day) {
    if (day.date == null) {
      return '';
    }
    final date = day.date!;
    final eventLabel = day.showDot ? ', has event' : '';
    return '${_weekdayName(date.weekday)}, ${_monthName(date.month)} ${date.day}, ${date.year}$eventLabel';
  }

  List<_CalendarDay> _buildDays(DateTime month) {
    final firstDay = DateTime(month.year, month.month, 1);
    final int leading = firstDay.weekday % 7;
    final int daysInMonth = DateUtils.getDaysInMonth(month.year, month.month);
    final int totalCells = leading + daysInMonth;
    final int trailing = (7 - (totalCells % 7)) % 7;
    final int gridCount = totalCells + trailing;

    return List.generate(gridCount, (index) {
      if (index < leading || index >= leading + daysInMonth) {
        return const _CalendarDay.empty();
      }
      final int day = index - leading + 1;
      final DateTime date = DateTime(month.year, month.month, day);
      final bool selected = _isSameDay(date, _selectedDate);
      final bool hasEvent = _hasEvent(date);
      return _CalendarDay(
        day: day,
        date: date,
        selected: selected,
        highlight: hasEvent && !selected,
        showDot: hasEvent && !selected,
      );
    });
  }

  void _onDaySelected(DateTime date) {
    setState(() {
      _selectedDate = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    final days = _buildDays(_focusedMonth);

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
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        tooltip: 'Back',
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      'Calendar',
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
                padding: const EdgeInsets.fromLTRB(8, 16, 8, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: _cardBorder),
                      ),
                      child: Row(
                        children: [
                          _orderedSection(
                            2,
                            IconButton(
                              onPressed: () => _changeMonth(-1),
                              tooltip: 'Previous month',
                              icon: const Icon(Icons.chevron_left),
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                _monthLabel(_focusedMonth),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                          ),
                          _orderedSection(
                            3,
                            IconButton(
                              onPressed: () => _changeMonth(1),
                              tooltip: 'Next month',
                              icon: const Icon(Icons.chevron_right),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: _cardBorder),
                      ),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          const minCalendarWidth = 384.0;
                          final calendarWidth =
                              constraints.maxWidth < minCalendarWidth
                              ? minCalendarWidth
                              : constraints.maxWidth;
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: SizedBox(
                              width: calendarWidth,
                              child: Column(
                                children: [
                                  Row(
                                    children: const [
                                      Expanded(
                                        child: _WeekdayLabel(
                                          'Sun',
                                          semanticLabel: 'Sunday',
                                        ),
                                      ),
                                      Expanded(
                                        child: _WeekdayLabel(
                                          'Mon',
                                          semanticLabel: 'Monday',
                                        ),
                                      ),
                                      Expanded(
                                        child: _WeekdayLabel(
                                          'Tue',
                                          semanticLabel: 'Tuesday',
                                        ),
                                      ),
                                      Expanded(
                                        child: _WeekdayLabel(
                                          'Wed',
                                          semanticLabel: 'Wednesday',
                                        ),
                                      ),
                                      Expanded(
                                        child: _WeekdayLabel(
                                          'Thu',
                                          semanticLabel: 'Thursday',
                                        ),
                                      ),
                                      Expanded(
                                        child: _WeekdayLabel(
                                          'Fri',
                                          semanticLabel: 'Friday',
                                        ),
                                      ),
                                      Expanded(
                                        child: _WeekdayLabel(
                                          'Sat',
                                          semanticLabel: 'Saturday',
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  GridView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: days.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 7,
                                          mainAxisSpacing: 8,
                                          crossAxisSpacing: 8,
                                          childAspectRatio: 1,
                                        ),
                                    itemBuilder: (context, index) {
                                      final day = days[index];
                                      return _CalendarCell(
                                        day: day,
                                        semanticLabel: _daySemanticLabel(day),
                                        focusOrder: 10 + index.toDouble(),
                                        onSelected: () {
                                          if (day.date != null) {
                                            _onDaySelected(day.date!);
                                          }
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 18),
                    const Text(
                      "Today's Schedule",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const _ScheduleCard(
                      title: 'Morning Medication',
                      time: '08:00 AM',
                      icon: Icons.calendar_today_outlined,
                      tagLabel: 'high',
                      tagBackground: _chipRed,
                      tagForeground: _chipRedText,
                    ),
                    const SizedBox(height: 12),
                    const _ScheduleCard(
                      title: 'Physical Therapy\nAppointment',
                      time: '02:00 PM',
                      icon: Icons.calendar_today_outlined,
                      tagLabel: 'high',
                      tagBackground: _chipRed,
                      tagForeground: _chipRedText,
                    ),
                    const SizedBox(height: 12),
                    const _ScheduleCard(
                      title: 'Evening Walk',
                      time: '05:30 PM',
                      icon: Icons.calendar_today_outlined,
                      tagLabel: 'medium',
                      tagBackground: _chipBlue,
                      tagForeground: _chipBlueText,
                    ),
                    const SizedBox(height: 12),
                    const _ScheduleCard(
                      title: 'Physical Therapy',
                      time: '02:00 PM',
                      icon: Icons.local_hospital_outlined,
                      tagLabel: 'therapy',
                      tagBackground: Color(0xFFF1F5F9),
                      tagForeground: Color(0xFF334155),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: _orderedSection(
          200,
          _CalendarBottomBar(
            onTap: (index) => _onNavTap(context, index),
            onNowTap: () => _showNotImplemented(context),
          ),
        ),
      ),
    );
  }
}

class _WeekdayLabel extends StatelessWidget {
  const _WeekdayLabel(this.label, {required this.semanticLabel});

  final String label;
  final String semanticLabel;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticLabel,
      child: ExcludeSemantics(
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: _mutedText,
          ),
        ),
      ),
    );
  }
}

class _CalendarDay {
  const _CalendarDay({
    required this.day,
    required this.date,
    this.selected = false,
    this.highlight = false,
    this.showDot = false,
  });

  const _CalendarDay.empty()
    : day = null,
      date = null,
      selected = false,
      highlight = false,
      showDot = false;

  final int? day;
  final DateTime? date;
  final bool selected;
  final bool highlight;
  final bool showDot;
}

class _CalendarCell extends StatelessWidget {
  const _CalendarCell({
    required this.day,
    required this.semanticLabel,
    required this.focusOrder,
    required this.onSelected,
  });

  final _CalendarDay day;
  final String semanticLabel;
  final double focusOrder;
  final VoidCallback onSelected;

  @override
  Widget build(BuildContext context) {
    if (day.day == null) {
      return const SizedBox.shrink();
    }

    final bool selected = day.selected;
    final bool highlight = day.highlight;
    final Color background = selected
        ? _calendarSelected
        : (highlight ? _chipTeal : Colors.transparent);
    final Color textColor = selected || highlight ? Colors.white : _mutedText;

    return _orderedSection(
      focusOrder,
      Semantics(
        container: true,
        button: true,
        selected: selected,
        label: semanticLabel,
        hint: selected ? 'Selected date' : 'Select date',
        onTap: onSelected,
        excludeSemantics: true,
        child: ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 48, minHeight: 48),
          child: TextButton(
            onPressed: onSelected,
            style: TextButton.styleFrom(
              minimumSize: const Size(48, 48),
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Center(
              child: SizedBox(
                width: 40,
                height: 40,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: background,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ExcludeSemantics(
                        child: Text(
                          '${day.day}',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: textColor,
                          ),
                        ),
                      ),
                      if (day.showDot)
                        Positioned(
                          bottom: 7,
                          child: Container(
                            width: 4,
                            height: 4,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ScheduleCard extends StatelessWidget {
  const _ScheduleCard({
    required this.title,
    required this.time,
    required this.icon,
    required this.tagLabel,
    required this.tagBackground,
    required this.tagForeground,
  });

  final String title;
  final String time;
  final IconData icon;
  final String tagLabel;
  final Color tagBackground;
  final Color tagForeground;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _cardBorder),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: const Color(0xFFEFF4FA),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: AppColors.primary, size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  time,
                  style: const TextStyle(fontSize: 13, color: _mutedText),
                ),
              ],
            ),
          ),
          _TagChip(
            label: tagLabel,
            background: tagBackground,
            foreground: tagForeground,
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
  });

  final String label;
  final Color background;
  final Color foreground;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: foreground,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _CalendarBottomBar extends StatelessWidget {
  const _CalendarBottomBar({required this.onTap, required this.onNowTap});

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
                  children: [
                    const Text(
                      'Now: Physical Therapy Appointment',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Wrap(
                      spacing: 6,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: const [
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
              TextButton(
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
            ],
          ),
        ),
        ColoredBox(
          color: Colors.white,
          child: SafeArea(
            top: false,
            child: BottomNavigationBar(
              currentIndex: 2,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: AppColors.primary,
              unselectedItemColor: _mutedText,
              backgroundColor: Colors.white,
              elevation: 0,
              onTap: onTap,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined, semanticLabel: 'Nav Home'),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.check_circle_outline, semanticLabel: 'Nav Tasks'),
                  label: 'Tasks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_today_outlined, semanticLabel: 'Nav Calendar'),
                  label: 'Calendar',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.chat_bubble_outline, semanticLabel: 'Nav Messages'),
                  label: 'Messages',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline, semanticLabel: 'Nav Profile'),
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



