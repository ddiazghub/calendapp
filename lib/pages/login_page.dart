import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:scheduler_app/pages/chat_page.dart';
import 'package:scheduler_app/pages/sign_up.dart';
import 'package:scheduler_app/services/auth_service.dart';

class LoginPage extends GetView<AuthService> {
  const LoginPage({super.key});

  static const keys = (
    create: Key("CreateAccountButton"),
    email: Key("LoginEmailField"),
    submit: Key("LoginSubmitButton"),
    password: Key("LoginPasswordField"),
  );

  static const defaults = (email: "user@email.com", password: "0123456789");

  static InputDecoration decoration(String label) {
    return InputDecoration(
      labelText: label,
      helperText: '',
      helperStyle: const TextStyle(height: 0.7),
      errorStyle: const TextStyle(height: 0.7),
    );
  }

  FormGroup buildForm() {
    return fb.group({
      'email': [defaults.email, Validators.required, Validators.email],
      'password': [defaults.password, Validators.required, Validators.minLength(8)],
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ReactiveFormBuilder(
          form: buildForm,
          builder: (context, form, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ReactiveTextField<String>(
                  key: keys.email,
                  formControlName: 'email',
                  textInputAction: TextInputAction.next,
                  decoration: decoration("email"),
                ),
                const SizedBox(height: 16.0),
                ReactiveTextField<String>(
                  key: keys.password,
                  formControlName: 'password',
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  decoration: decoration("Password"),
                ),
                const SizedBox(height: 16.0),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  key: keys.submit,
                  onPressed: () async {
                    print("Hello==");

                    if (form.valid) {
                      print("Hello12");
                      print(form.value);
                      await controller.login(form.control("email").value, form.control("password").value);
                      print(form.value);
                      Get.to(ChatPage());
                    } else {
                      form.markAllAsTouched();
                    }
                  },
                  child: const Text('Submit'),
                ),
                const SizedBox(height: 16.0),
                TextButton(
                  key: keys.create,
                  onPressed: () => Get.to(const SignUp()),
                  child: const Text("Create account"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
