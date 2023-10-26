import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FormValidators {
  static final url = Validators.delegate(
      (s) => GetUtils.isURL(s.value) ? null : {"url": true});
}

class Converters {
  static DateTime localTime(Timestamp time) => time.toDate();
}
