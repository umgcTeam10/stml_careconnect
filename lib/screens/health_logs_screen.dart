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
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text(
                      'Health Logs',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.add, color: Colors.white, size: 16),
                        SizedBox(width: 4),
                        Text(
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
                  Row(
                    children: [
                      Expanded(
                        child: _SummaryCard(
                          icon: Icons.monitor_heart_outlined,
                          iconColor: AppColors.primary,
                          iconBackground: _lightBlue,
                          title: 'BP Today',
                          value: '120/80',
                          subtitle: 'mmHg',
                          onTap: () => _showNotImplemented(context),
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
                          onTap: () => _showNotImplemented(context),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: _SummaryCard(
                          icon: Icons.restaurant_outlined,
                          iconColor: const Color(0xFF1E7A46),
                          iconBackground: _chipGreen,
                          title: 'Meals',
                          value: '1,240',
                          subtitle: 'Calories',
                          onTap: () => _showNotImplemented(context),
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
                          onTap: () => _showNotImplemented(context),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _TabChip(
                          label: 'All',
                          isSelected: _selectedTab == 'All',
                          onTap: () => setState(() => _selectedTab = 'All'),
                        ),
                        const SizedBox(width: 8),
                        _TabChip(
                          label: 'Vitals',
                          isSelected: _selectedTab == 'Vitals',
                          onTap: () => setState(() => _selectedTab = 'Vitals'),
                        ),
                        const SizedBox(width: 8),
                        _TabChip(
                          label: 'Meds',
                          isSelected: _selectedTab == 'Meds',
                          onTap: () => setState(() => _selectedTab = 'Meds'),
                        ),
                        const SizedBox(width: 8),
                        _TabChip(
                          label: 'Meals',
                          isSelected: _selectedTab == 'Meals',
                          onTap: () => setState(() => _selectedTab = 'Meals'),
                        ),
                        const SizedBox(width: 8),
                        _TabChip(
                          label: 'Mood',
                          isSelected: _selectedTab == 'Mood',
                          onTap: () => setState(() => _selectedTab = 'Mood'),
                        ),
                        const SizedBox(width: 8),
                        _TabChip(
                          label: 'Symptoms',
                          isSelected: _selectedTab == 'Symptoms',
                          onTap: () =>
                              setState(() => _selectedTab = 'Symptoms'),
                        ),
                        const SizedBox(width: 8),
                        _TabChip(
                          label: 'Activity',
                          isSelected: _selectedTab == 'Activity',
                          onTap: () =>
                              setState(() => _selectedTab = 'Activity'),
                        ),
                      ],
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
                    onTap: () => _showNotImplemented(context),
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
                    onTap: () => _showNotImplemented(context),
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
                    onTap: () => _showNotImplemented(context),
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
                    onTap: () => _showNotImplemented(context),
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
                    onTap: () => _showNotImplemented(context),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showNotImplemented(context),
        backgroundColor: _fabBlue,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      bottomNavigationBar: _BottomBar(
        onTap: (index) => _onNavTap(context, index),
        onNowTap: () => _showNotImplemented(context),
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
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: iconBackground,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icon, size: 16, color: iconColor),
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 12, color: _mutedText),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 2),
            Row(
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
          ],
        ),
      ),
    );
  }
}

class _TabChip extends StatelessWidget {
  const _TabChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.white : _mutedText,
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
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: iconBackground,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, size: 20, color: iconColor),
                ),
                const SizedBox(width: 12),
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
                Container(
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
              ],
            ),
            if (details != null && details!.isNotEmpty) ...[
              const SizedBox(height: 12),
              Container(
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
            ],
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.access_time, size: 14, color: _mutedText),
                const SizedBox(width: 4),
                Text(
                  time,
                  style: const TextStyle(fontSize: 12, color: _mutedText),
                ),
              ],
            ),
          ],
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
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: const BoxDecoration(
            color: _headerColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
          ),
          child: Row(
            children: [
              const Icon(Icons.schedule, color: Colors.white70, size: 18),
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
                        Icon(Icons.schedule, size: 12, color: Colors.white70),
                        Text(
                          '02:00 PM',
                          style: TextStyle(color: Colors.white70, fontSize: 11),
                        ),
                        Text(
                          '•',
                          style: TextStyle(color: Colors.white70, fontSize: 11),
                        ),
                        Icon(
                          Icons.local_hospital_outlined,
                          size: 12,
                          color: Colors.white70,
                        ),
                        Text(
                          'At clinic',
                          style: TextStyle(color: Colors.white70, fontSize: 11),
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
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
              currentIndex: 0,
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
