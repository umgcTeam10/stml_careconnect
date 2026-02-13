import 'package:flutter/material.dart';
import '../app/app_routes.dart';
import '../theme/app_theme.dart';
import '../widgets/primary_button.dart';

enum UserRole { careRecipient, caregiver }

class RoleSelectionScreen extends StatefulWidget {
  const RoleSelectionScreen({super.key});

  @override
  State<RoleSelectionScreen> createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends State<RoleSelectionScreen> {
  UserRole? _selectedRole;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Semantics(
          label: 'Back',
          button: true,
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back, color: Colors.black87),
            tooltip: 'Back',
          ),
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Top centered icon (decorative, excluded from semantics)
                    Center(
                      child: ExcludeSemantics(
                        child: Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.12),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: const Icon(
                            Icons.people_alt_outlined,
                            color: AppColors.primary,
                            size: 28,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Semantics(
                      header: true,
                      child: const Center(
                        child: Text(
                          'Choose Your Role',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    _RoleCard(
                      role: UserRole.caregiver,
                      title: "I'm a Caregiver",
                      subtitle: 'I provide care and coordinate with loved ones',
                      icon: Icons.favorite_border,
                      benefits: const [
                        'Coordinate tasks and care plans',
                        'Stay connected with family',
                        'Manage appointments and reminders',
                      ],
                      isSelected: _selectedRole == UserRole.caregiver,
                      onTap: () {
                        setState(() => _selectedRole = UserRole.caregiver);
                      },
                    ),
                    const SizedBox(height: 16),
                    _RoleCard(
                      role: UserRole.careRecipient,
                      title: "I'm a Care Recipient",
                      subtitle: 'I receive care and want to track my health',
                      icon: Icons.person_outline,
                      benefits: const [
                        'Track health and wellness',
                        'Share updates with caregivers',
                        'Manage my care schedule',
                      ],
                      isSelected: _selectedRole == UserRole.careRecipient,
                      onTap: () {
                        setState(() => _selectedRole = UserRole.careRecipient);
                      },
                    ),
                    const SizedBox(height: 32),
                    PrimaryButton(
                      label: 'Continue',
                      onPressed: _selectedRole == null
                          ? null
                          : () {
                              Navigator.pushReplacementNamed(
                                context,
                                AppRoutes.login,
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
    );
  }
}

class _RoleCard extends StatelessWidget {
  const _RoleCard({
    required this.role,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.benefits,
    required this.isSelected,
    required this.onTap,
  });

  final UserRole role;
  final String title;
  final String subtitle;
  final IconData icon;
  final List<String> benefits;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      selected: isSelected,
      label: title,
      hint: 'Double tap to select this role',
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.primary.withOpacity(0.06)
                : AppColors.lightCard,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected
                  ? AppColors.primary
                  : const Color(0xFFE2E8F0),
              width: isSelected ? 2 : 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 8,
                offset: const Offset(0, 2),
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
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.primary.withOpacity(0.15)
                            : AppColors.primary.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        icon,
                        color: AppColors.primary,
                        size: 22,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          subtitle,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (isSelected)
                    ExcludeSemantics(
                      child: Icon(
                        Icons.check_circle,
                        color: AppColors.primary,
                        size: 24,
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 16),
              ...benefits.map(
                (b) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '• ',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          b,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
