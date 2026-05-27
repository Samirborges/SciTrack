import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Icon(
          Icons.science,
          size: 90,
          color: AppColors.primary,
        ),

        SizedBox(height: 20),

        Text(
          'SciTrack',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),

        SizedBox(height: 10),

        Text(
          'Gerenciamento inteligente de pesquisas científicas',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}