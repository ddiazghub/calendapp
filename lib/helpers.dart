import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FormValidators {
  static final url = Validators.delegate((s) => GetUtils.isURL(s.value) ? null : {"url": true});
}
