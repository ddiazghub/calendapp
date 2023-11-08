// Based on https://dartpad.dev/?id=d57c6c898dabb8c6fb41018588b8cf73
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:scheduler_app/pages/calendar_page.dart';
import 'package:scheduler_app/pages/sign_up_page.dart';
import 'package:scheduler_app/services/auth_service.dart';
import 'package:scheduler_app/services/avatar_service.dart';
import 'package:scheduler_app/services/meeting_service.dart';
import 'package:scheduler_app/services/user_service.dart';

import 'app.dart';
import 'firebase_options.dart';

const darkBlue = Color.fromARGB(255, 18, 32, 47);

void onAuthStateChange(User? user) {
  final AuthService auth = Get.find();

  if (user == null) {
    auth.user = null;
    logInfo('User is currently signed out!');
  } else {
    auth.user = user;
    logInfo('User is signed in!');
  }
}

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
  } catch (e, st) {
    logError(e);
    logError(st);
  }

  // The first step to using Firebase is to configure it so that our code can
  // find the Firebase project on the servers. This is not a security risk, as
  // explained here: https://stackoverflow.com/a/37484053
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseAuth.instance.idTokenChanges().listen(onAuthStateChange);
  FirebaseAuth.instance.idTokenChanges().listen(onAuthStateChange);

  Get.put(AuthService());
  Get.put(AvatarService());
  Get.put(UserService());
  Get.put(MeetingService());
  Get.put(CalendarController());
  Get.put(ImagePickController());

  runApp(const SchedulerApp());
  //runApp(const MyApp());
}
