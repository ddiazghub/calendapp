import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:scheduler_app/config.dart';
import 'package:scheduler_app/pages/login_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReactiveFormConfig(
      validationMessages: validation,
      child: GetMaterialApp(
        title: "Scheduler",
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.blue,
        ),
        home: LoginPage(),
      ),
    );
  }
}
