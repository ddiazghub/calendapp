import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:scheduler_app/config.dart';
import 'package:scheduler_app/routes.dart';
import 'package:scheduler_app/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class SchedulerApp extends StatelessWidget {
  const SchedulerApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = appTheme(context);

    return ReactiveFormConfig(
      validationMessages: validation,
      child: GetMaterialApp(
        title: 'Scheduler App',
        locale: const Locale('es'),
        supportedLocales: const [Locale('es')],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          // add other library integrated locals
        ],
        debugShowCheckedModeBanner: false,
        theme: theme,
        initialRoute: Routes.home,
        getPages: Routes.routes(),
      ),
    );
  }
}
