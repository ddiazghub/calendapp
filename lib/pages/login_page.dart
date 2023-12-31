import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:scheduler_app/assets.dart';
import 'package:scheduler_app/components/auth_redirects.dart';
import 'package:scheduler_app/components/page/page_view.dart';
import 'package:scheduler_app/routes.dart';
import 'package:scheduler_app/services/auth_service.dart';

class LoginPage extends GetView<AuthService> {
  const LoginPage({super.key});

  static const keys = (
    create: Key('CreateAccountButton'),
    email: Key('LoginEmailField'),
    submit: Key('LoginSubmitButton'),
    password: Key('LoginPasswordField'),
  );

  static const defaults = (email: '', password: '');

  static InputDecoration decoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.black, fontSize: 20),
      helperText: '',
      helperStyle: const TextStyle(height: 0.7),
      errorStyle: const TextStyle(height: 0.7),
    );
  }

  FormGroup buildForm() {
    return fb.group({
      'email': [defaults.email, Validators.required, Validators.email],
      'password': [
        defaults.password,
        Validators.required,
        Validators.minLength(8)
      ],
    });
  }

  @override
  Widget build(BuildContext context) {
    return RequiresNoAuth(
      builder: (context) {
        return AppView(
          title: 'Iniciar sesión',
          child: Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: Assets.loginBackground, // Ruta de tu imagen
                  fit:
                      BoxFit.cover, // Ajusta la imagen para cubrir toda el área
                ),
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: Container(
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
                              decoration: decoration('Correo'),
                              style: const TextStyle(color: Colors.black),
                            ),
                            const SizedBox(height: 16.0),
                            ReactiveTextField<String>(
                              key: keys.password,
                              formControlName: 'password',
                              obscureText: true,
                              textInputAction: TextInputAction.done,
                              decoration: decoration('Contraseña'),
                              style: const TextStyle(color: Colors.black),
                            ),
                            const SizedBox(height: 16.0),
                            const SizedBox(height: 16.0),
                            ElevatedButton(
                              onPressed: () async {
                                if (form.valid) {
                                  await controller.login(
                                    form.control('email').value,
                                    form.control('password').value,
                                  );
                                  Get.offAllNamed(Routes.meetings);
                                } else {
                                  form.markAllAsTouched();
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  const Color.fromARGB(255, 255, 3, 3),
                                ),
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.all(15)),
                                alignment: Alignment.center,
                              ),
                              child: const Text(
                                'INGRESAR',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: 'Arial',
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
