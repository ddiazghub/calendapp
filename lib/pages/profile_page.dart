import 'package:flutter/material.dart';
import 'package:scheduler_app/components/auth_redirects.dart';
import 'package:get/get.dart';
import 'package:scheduler_app/components/page/page_view.dart';
import 'package:scheduler_app/components/query_builder.dart';
import 'package:scheduler_app/models/user.dart';
import 'package:scheduler_app/routes.dart';
import 'package:scheduler_app/services/auth_service.dart';

class ProfilePage extends GetView<AuthService> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return RequiresAuth(
      builder: (context, session) {
        final theme = Theme.of(context);

        return AppView(
          currentTab: NavigationTab.profile,
          child: QueryBuilder(
            ref: UserRef.doc(controller.user!.uid),
            builder: (context, snapshot) {
              return Center(child: Text('NOPE', style: theme.textTheme.titleLarge!.copyWith(fontSize: 30)));
            },
          ),
        );
      },
    );
  }
}
