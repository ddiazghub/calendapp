import 'package:flutter/material.dart';
import 'package:scheduler_app/components/auth_redirects.dart';
import 'package:scheduler_app/components/user_data_form.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RequiresNoAuth(builder: (context) => UserDataForm());
  }
}
