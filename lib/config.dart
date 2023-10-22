import 'package:loggy/loggy.dart';
import 'package:reactive_forms/reactive_forms.dart';

String dunno(error) {
  logInfo(error);
  return "Error";
}

final validation = {
  ValidationMessage.required: (_) => 'Field is mandatory',
  ValidationMessage.email: (_) => 'Must enter a valid email',
  ValidationMessage.minLength: (error) => 'Field must be at least ${(error as Map)['requiredLength']} characters long',
  ValidationMessage.number: (_) => 'Field must be a number',
  ValidationMessage.min: dunno,
  ValidationMessage.max: dunno,
  'uniqueEmail': (_) => 'This email is already in use',
  'url': (_) => 'Field must be an URL',
};
