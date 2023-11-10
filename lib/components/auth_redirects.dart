import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler_app/components/spinner.dart';
import 'package:scheduler_app/routes.dart';
import 'package:scheduler_app/services/auth_service.dart';

class RedirectBuilder<T extends GetxController> extends GetView<T> {
  const RedirectBuilder({
    super.key,
    required this.builder,
    required this.predicate,
    required this.redirect,
  });

  final Widget Function(BuildContext) builder;
  final bool Function(T) predicate;
  final String redirect;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (predicate(controller)) {
        return builder(context);
      }

      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        Get.offNamed(redirect);
      });

      return const Spinner();
    });
  }
}

class RequiresAuth extends RedirectBuilder<AuthService> {
  const RequiresAuth({super.key, required super.builder})
      : super(redirect: Routes.home, predicate: isSignedIn);

  static bool isSignedIn(AuthService auth) => auth.isSignedIn;
}

class RequiresNoAuth extends RedirectBuilder<AuthService> {
  const RequiresNoAuth({super.key, required super.builder})
      : super(redirect: Routes.meetings, predicate: isNotSignedIn);

  static bool isNotSignedIn(AuthService auth) => !auth.isSignedIn;
}
