import 'package:flutter/material.dart';
import 'package:scheduler_app/colors.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.schedule,
      size: 32,
      color: AppColors.white50,
    );
  }
}
