import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler_app/components/spinner.dart';
import 'package:scheduler_app/routes.dart';
import 'package:scheduler_app/services/auth_service.dart';

class AuthBuilder extends GetView<AuthService> {
  const AuthBuilder({super.key, required this.builder});

  final Widget Function(BuildContext, User?) builder;

  @override
  Widget build(BuildContext context) {
    return Obx(() => builder(context, controller.user));
  }
}

class RequiresAuth extends StatelessWidget {
  const RequiresAuth({super.key, required this.builder});

  final Widget Function(BuildContext, User) builder;

  @override
  Widget build(BuildContext context) {
    return AuthBuilder(
      builder: (context, user) {
        if (user == null) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            Get.offAllNamed(Routes.home);
          });

          return const Spinner();
        }

        return builder(context, user);
      },
    );
  }
}

class RequiresNoAuth extends StatelessWidget {
  const RequiresNoAuth({super.key, required this.builder});

  final Widget Function(BuildContext) builder;

  @override
  Widget build(BuildContext context) {
    return AuthBuilder(
      builder: (context, user) {
        if (user == null) {
          return builder(context);
        }

        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          Get.offNamed(Routes.meetings);
        });

        return const Spinner();
      },
    );
  }
}
