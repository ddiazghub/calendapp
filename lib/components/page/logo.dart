import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler_app/assets.dart';
import 'package:scheduler_app/routes.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: const ValueKey('ReplyLogo'),
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      child: const Center(
        child: Image(image: Assets.logo, fit: BoxFit.fitHeight),
      ),
      onTap: () => Get.toNamed(Routes.meetings),
    );
  }
}
