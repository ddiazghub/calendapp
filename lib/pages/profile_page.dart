import 'package:flutter/material.dart';
import 'package:scheduler_app/components/auth_redirects.dart';
import 'package:get/get.dart';
import 'package:scheduler_app/components/query_builder.dart';
import 'package:scheduler_app/components/user_data_form.dart';
import 'package:scheduler_app/models/user.dart';
import 'package:scheduler_app/services/auth_service.dart';

class ProfilePage extends GetView<AuthService> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return RequiresAuth(
      builder: (context) {
        return QueryBuilder(
          ref: UserRef.whereUid(isEqualTo: controller.user!.uid),
          builder: (context, snapshot) {
            return UserDataForm(user: snapshot.docs[0].data);
          },
        );
      },
    );
  }
}
