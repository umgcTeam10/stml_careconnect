import 'package:flutter/material.dart';
import '../app/app_routes.dart';
import '../theme/app_theme.dart';

const _headerColor = Color(0xFF0F4C81);
const _cardBorder = Color(0xFFE3E8F1);
const _mutedText = Color(0xFF5F6775);
const _lightBlue = Color(0xFFEFF5FF);
const _chipBlue = Color(0xFFE6F0FF);
const _chipBlueText = Color(0xFF2F5DA8);
const _chipGreen = Color(0xFFE8F7EE);
const _chipGreenText = Color(0xFF1E7A46);
const _fabBlue = Color(0xFF0F4C81);

class HealthLogsScreen extends StatefulWidget {
  const HealthLogsScreen({super.key});

  @override
  State<HealthLogsScreen> createState() => _HealthLogsScreenState();
}

class _HealthLogsScreenState extends State<HealthLogsScreen> {
  String _selectedTab = 'All';

  void _handleSummaryCardPress(BuildContext context, String cardType) {
    String message = '';
    switch (cardType) {
      case 'BP':
        message =
            'Blood Pressure Details - View your blood pressure history and trends';
        break;
      case 'Medications':
        message =
            'Medication Details - View your medication schedule and completion status';
        break;
      case 'Meals':
        message =
            'Meal Details - View your daily calorie intake and nutrition information';
        break;
      case 'Mood':
        message =
            'Mood Details - View your mood patterns and emotional wellness tracking';
        break;
    }
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  void _handleAddLog(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Add Health Log - Feature coming soon to create new health entries',
        ),
      ),
    );
  }

  void _handleViewAppointment(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Physical Therapy Appointment at 2:00 PM at clinic - Tap to view full details',
        ),
      ),
    );
  }

  void _handleLogEntryPress(BuildContext context, String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$title - Tap to view full details and edit entry'),
      ),
    );
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
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: _headerColor,
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
            child: SafeArea(
              bottom: false,
              child: Row(
                children: [
                  Semantics(
                    label: 'Back',
                    hint: 'Navigate back to previous screen',
                    button: true,
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Semantics(
                      header: true,
                      child: const Text(
                        'Health Logs',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Semantics(
                    label: 'Add new health log',
                    hint: 'Opens form to create a new health log entry',
                    button: true,
                    child: InkWell(
                      onTap: () => _handleAddLog(context),
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            ExcludeSemantics(
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Text(
                              'New',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 160),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Semantics(
                    label: 'Health summary cards',
                    child: Row(
                      children: [
                        Expanded(
                          child: _SummaryCard(
                            icon: Icons.monitor_heart_outlined,
                            iconColor: AppColors.primary,
                            iconBackground: _lightBlue,
                            title: 'BP Today',
                            value: '120/80',
                            subtitle: 'mmHg',
                            semanticLabel:
                                'Blood pressure today, 120 over 80 millimeters of mercury',
                            semanticHint:
                                'Double tap to view detailed blood pressure history',
                            onTap: () => _handleSummaryCardPress(context, 'BP'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _SummaryCard(
                            icon: Icons.medication_outlined,
                            iconColor: AppColors.primary,
                            iconBackground: _lightBlue,
                            title: 'Medications',
                            value: '2/2',
                            subtitle: 'Completed',
                            statusColor: _chipGreenText,
                            semanticLabel:
                                'Medications today, 2 out of 2 completed',
                            semanticHint:
                                'Double tap to view medication schedule and details',
                            onTap: () =>
                                _handleSummaryCardPress(context, 'Medications'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Semantics(
                    label: 'Nutrition and mood summary',
                    child: Row(
                      children: [
                        Expanded(
                          child: _SummaryCard(
                            icon: Icons.restaurant_outlined,
                            iconColor: const Color(0xFF1E7A46),
                            iconBackground: _chipGreen,
                            title: 'Meals',
                            value: '1,240',
                            subtitle: 'Calories',
                            semanticLabel:
                                'Meals today, 1,240 calories consumed',
                            semanticHint:
                                'Double tap to view meal details and nutrition information',
                            onTap: () =>
                                _handleSummaryCardPress(context, 'Meals'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _SummaryCard(
                            icon: Icons.sentiment_satisfied_alt_outlined,
                            iconColor: const Color(0xFFEA8C3E),
                            iconBackground: const Color(0xFFFFF4E6),
                            title: 'Mood',
                            value: 'Good',
                            subtitle: 'Improving',
                            statusColor: _chipGreenText,
                            statusIcon: Icons.trending_up,
                            semanticLabel: 'Mood today, good and improving',
                            semanticHint:
                                'Double tap to view mood history and patterns',
                            onTap: () =>
                                _handleSummaryCardPress(context, 'Mood'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Semantics(
                    label: 'Filter health logs by category',
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _TabChip(
                            label: 'All',
                            isSelected: _selectedTab == 'All',
                            semanticLabel:
                                'All filter${_selectedTab == 'All' ? ', selected' : ''}',
                            semanticHint:
                                'Filter health logs to show all entries',
                            onTap: () => setState(() => _selectedTab = 'All'),
                          ),
                          const SizedBox(width: 8),
                          _TabChip(
                            label: 'Vitals',
                            isSelected: _selectedTab == 'Vitals',
                            semanticLabel:
                                'Vitals filter${_selectedTab == 'Vitals' ? ', selected' : ''}',
                            semanticHint:
                                'Filter health logs to show only vitals entries',
                            onTap: () =>
                                setState(() => _selectedTab = 'Vitals'),
                          ),
                          const SizedBox(width: 8),
                          _TabChip(
                            label: 'Meds',
                            isSelected: _selectedTab == 'Meds',
                            semanticLabel:
                                'Medications filter${_selectedTab == 'Meds' ? ', selected' : ''}',
                            semanticHint:
                                'Filter health logs to show only medication entries',
                            onTap: () => setState(() => _selectedTab = 'Meds'),
                          ),
                          const SizedBox(width: 8),
                          _TabChip(
                            label: 'Meals',
                            isSelected: _selectedTab == 'Meals',
                            semanticLabel:
                                'Meals filter${_selectedTab == 'Meals' ? ', selected' : ''}',
                            semanticHint:
                                'Filter health logs to show only meal entries',
                            onTap: () => setState(() => _selectedTab = 'Meals'),
                          ),
                          const SizedBox(width: 8),
                          _TabChip(
                            label: 'Mood',
                            isSelected: _selectedTab == 'Mood',
                            semanticLabel:
                                'Mood filter${_selectedTab == 'Mood' ? ', selected' : ''}',
                            semanticHint:
                                'Filter health logs to show only mood entries',
                            onTap: () => setState(() => _selectedTab = 'Mood'),
                          ),
                          const SizedBox(width: 8),
                          _TabChip(
                            label: 'Symptoms',
                            isSelected: _selectedTab == 'Symptoms',
                            semanticLabel:
                                'Symptoms filter${_selectedTab == 'Symptoms' ? ', selected' : ''}',
                            semanticHint:
                                'Filter health logs to show only symptom entries',
                            onTap: () =>
                                setState(() => _selectedTab = 'Symptoms'),
                          ),
                          const SizedBox(width: 8),
                          _TabChip(
                            label: 'Activity',
                            isSelected: _selectedTab == 'Activity',
                            semanticLabel:
                                'Activity filter${_selectedTab == 'Activity' ? ', selected' : ''}',
                            semanticHint:
                                'Filter health logs to show only activity entries',
                            onTap: () =>
                                setState(() => _selectedTab = 'Activity'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _LogEntry(
                    icon: Icons.monitor_heart_outlined,
                    iconColor: AppColors.primary,
                    iconBackground: _lightBlue,
                    title: 'Blood Pressure',
                    time: '1 hour ago',
                    tagLabel: 'vitals',
                    tagColor: _chipBlueText,
                    tagBackground: _chipBlue,
                    details: [
                      'systolic: 120',
                      'diastolic: 80',
                      'heartRate: 72',
                    ],
                    semanticLabel:
                        'Blood Pressure, 1 hour ago, vitals category. Details: systolic 120, diastolic 80, heart rate 72 beats per minute',
                    semanticHint:
                        'Double tap to view full details and edit this entry',
                    onTap: () =>
                        _handleLogEntryPress(context, 'Blood Pressure'),
                  ),
                  const SizedBox(height: 12),
                  _LogEntry(
                    icon: Icons.sentiment_satisfied_alt_outlined,
                    iconColor: const Color(0xFFEA8C3E),
                    iconBackground: const Color(0xFFFFF4E6),
                    title: 'Mood Check',
                    subtitle: 'Feeling good today',
                    time: '2 hours ago',
                    tagLabel: 'mood',
                    tagColor: const Color(0xFFEA8C3E),
                    tagBackground: const Color(0xFFFFF4E6),
                    details: ['mood: happy', 'energy: high'],
                    semanticLabel:
                        'Mood Check, Feeling good today, 2 hours ago, mood category. Details: mood happy, energy high',
                    semanticHint:
                        'Double tap to view full details and edit this entry',
                    onTap: () => _handleLogEntryPress(context, 'Mood Check'),
                  ),
                  const SizedBox(height: 12),
                  _LogEntry(
                    icon: Icons.medication_outlined,
                    iconColor: AppColors.primary,
                    iconBackground: _lightBlue,
                    title: 'Medication Taken',
                    subtitle: 'Morning medications completed',
                    time: '3 hours ago',
                    tagLabel: 'medication',
                    tagColor: _chipBlueText,
                    tagBackground: _chipBlue,
                    details: ['medications: Lisinopril 10mg, Metformin 500mg'],
                    semanticLabel:
                        'Medication Taken, Morning medications completed, 3 hours ago, medication category. Details: Lisinopril 10 milligrams, Metformin 500 milligrams',
                    semanticHint:
                        'Double tap to view full details and edit this entry',
                    onTap: () =>
                        _handleLogEntryPress(context, 'Medication Taken'),
                  ),
                  const SizedBox(height: 12),
                  _LogEntry(
                    icon: Icons.restaurant_outlined,
                    iconColor: const Color(0xFF1E7A46),
                    iconBackground: _chipGreen,
                    title: 'Breakfast',
                    subtitle: 'Oatmeal with berries, green tea',
                    time: '4 hours ago',
                    tagLabel: 'meal',
                    tagColor: _chipGreenText,
                    tagBackground: _chipGreen,
                    details: ['calories: 320', 'protein: 12'],
                    semanticLabel:
                        'Breakfast, Oatmeal with berries and green tea, 4 hours ago, meal category. Details: 320 calories, 12 grams protein',
                    semanticHint:
                        'Double tap to view full details and edit this entry',
                    onTap: () => _handleLogEntryPress(context, 'Breakfast'),
                  ),
                  const SizedBox(height: 12),
                  _LogEntry(
                    icon: Icons.warning_outlined,
                    iconColor: const Color(0xFFDA3B4A),
                    iconBackground: const Color(0xFFFFE9EC),
                    title: 'No symptoms reported',
                    subtitle: 'Feeling well, no concerns',
                    time: '1 day ago',
                    tagLabel: 'symptoms',
                    tagColor: const Color(0xFFDA3B4A),
                    tagBackground: const Color(0xFFFFE9EC),
                    semanticLabel:
                        'No symptoms reported, Feeling well with no concerns, 1 day ago, symptoms category',
                    semanticHint:
                        'Double tap to view full details and edit this entry',
                    onTap: () =>
                        _handleLogEntryPress(context, 'No symptoms reported'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Semantics(
        label: 'Add new health log entry',
        hint: 'Opens form to create a new health log entry',
        button: true,
        child: FloatingActionButton(
          onPressed: () => _handleAddLog(context),
          backgroundColor: _fabBlue,
          child: ExcludeSemantics(
            child: const Icon(Icons.add, color: Colors.white),
          ),
        ),
      ),
      bottomNavigationBar: _BottomBar(
        onTap: (index) => _onNavTap(context, index),
        onNowTap: () => _handleViewAppointment(context),
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({
    required this.icon,
    required this.iconColor,
    required this.iconBackground,
    required this.title,
    required this.value,
    required this.subtitle,
    this.statusColor,
    this.statusIcon,
    required this.semanticLabel,
    required this.semanticHint,
    required this.onTap,
  });

  final IconData icon;
  final Color iconColor;
  final Color iconBackground;
  final String title;
  final String value;
  final String subtitle;
  final Color? statusColor;
  final IconData? statusIcon;
  final String semanticLabel;
  final String semanticHint;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticLabel,
      hint: semanticHint,
      button: true,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: _cardBorder),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
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
                  ExcludeSemantics(
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: iconBackground,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(icon, size: 16, color: iconColor),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(height: 10),
              ExcludeSemantics(
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 12, color: _mutedText),
                ),
              ),
              const SizedBox(height: 4),
              ExcludeSemantics(
                child: Text(
                  value,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 2),
              ExcludeSemantics(
                child: Row(
                  children: [
                    if (statusIcon != null) ...[
                      Icon(statusIcon, size: 12, color: statusColor),
                      const SizedBox(width: 4),
                    ],
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 11,
                        color: statusColor ?? _mutedText,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TabChip extends StatelessWidget {
  const _TabChip({
    required this.label,
    required this.isSelected,
    required this.semanticLabel,
    required this.semanticHint,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final String semanticLabel;
  final String semanticHint;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticLabel,
      hint: semanticHint,
      button: true,
      selected: isSelected,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isSelected ? AppColors.primary : _cardBorder,
            ),
          ),
          child: ExcludeSemantics(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: isSelected ? Colors.white : _mutedText,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LogEntry extends StatelessWidget {
  const _LogEntry({
    required this.icon,
    required this.iconColor,
    required this.iconBackground,
    required this.title,
    this.subtitle,
    required this.time,
    required this.tagLabel,
    required this.tagColor,
    required this.tagBackground,
    this.details,
    required this.semanticLabel,
    required this.semanticHint,
    required this.onTap,
  });

  final IconData icon;
  final Color iconColor;
  final Color iconBackground;
  final String title;
  final String? subtitle;
  final String time;
  final String tagLabel;
  final Color tagColor;
  final Color tagBackground;
  final List<String>? details;
  final String semanticLabel;
  final String semanticHint;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticLabel,
      hint: semanticHint,
      button: true,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: _cardBorder),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
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
                  ExcludeSemantics(
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: iconBackground,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(icon, size: 20, color: iconColor),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ExcludeSemantics(
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
                          if (subtitle != null) ...[
                            const SizedBox(height: 4),
                            Text(
                              subtitle!,
                              style: const TextStyle(
                                fontSize: 13,
                                color: _mutedText,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                  ExcludeSemantics(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: tagBackground,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        tagLabel,
                        style: TextStyle(
                          color: tagColor,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              if (details != null && details!.isNotEmpty) ...[
                const SizedBox(height: 12),
                ExcludeSemantics(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: _lightBlue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: details!
                          .map(
                            (detail) => Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: Text(
                                detail,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: _chipBlueText,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ],
              const SizedBox(height: 8),
              ExcludeSemantics(
                child: Row(
                  children: [
                    const Icon(Icons.access_time, size: 14, color: _mutedText),
                    const SizedBox(width: 4),
                    Text(
                      time,
                      style: const TextStyle(fontSize: 12, color: _mutedText),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomBar extends StatelessWidget {
  const _BottomBar({required this.onTap, required this.onNowTap});

  final ValueChanged<int> onTap;
  final VoidCallback onNowTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Semantics(
          label: 'Current appointment: Physical Therapy at 2:00 PM at clinic',
          hint: 'Double tap to view full appointment details',
          button: true,
          liveRegion: true,
          child: InkWell(
            onTap: onNowTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: const BoxDecoration(
                color: _headerColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
              ),
              child: Row(
                children: [
                  ExcludeSemantics(
                    child: const Icon(
                      Icons.schedule,
                      color: Colors.white70,
                      size: 18,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ExcludeSemantics(
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
                                color: Colors.white70,
                              ),
                              Text(
                                '02:00 PM',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 11,
                                ),
                              ),
                              Text(
                                '•',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 11,
                                ),
                              ),
                              Icon(
                                Icons.local_hospital_outlined,
                                size: 12,
                                color: Colors.white70,
                              ),
                              Text(
                                'At clinic',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  ExcludeSemantics(
                    child: Row(
                      children: const [
                        Text('View', style: TextStyle(color: Colors.white)),
                        SizedBox(width: 4),
                        Icon(
                          Icons.arrow_forward,
                          size: 14,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        ColoredBox(
          color: Colors.white,
          child: SafeArea(
            top: false,
            child: BottomNavigationBar(
              currentIndex: 0,
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



