import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AppLogoBadge extends StatelessWidget {
  const AppLogoBadge._({
    super.key,
    required this.size,
    required this.borderRadius,
  });

  final double size;
  final BorderRadius borderRadius;

  factory AppLogoBadge.square({Key? key, double size = 60}) {
    return AppLogoBadge._(
      key: key,
      size: size,
      borderRadius: BorderRadius.circular(14),
    );
  }

  factory AppLogoBadge.circle({Key? key, double size = 60}) {
    return AppLogoBadge._(
      key: key,
      size: size,
      borderRadius: BorderRadius.circular(size / 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: borderRadius,
      ),
      child: const Center(
        child: Icon(
          Icons.favorite_rounded,
          color: Colors.white,
          size: 28,
        ),
      ),
    );
  }
}
