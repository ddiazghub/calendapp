import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loggy/loggy.dart';
import 'package:reactive_date_time_picker/reactive_date_time_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:scheduler_app/components/auth_redirects.dart';
import 'package:scheduler_app/components/image_picker.dart';
import 'package:scheduler_app/components/page/page_view.dart';
import 'package:scheduler_app/layout/adaptative.dart';
import 'package:scheduler_app/models/user.dart';
import 'package:scheduler_app/routes.dart';
import 'package:scheduler_app/services/auth_service.dart';
import 'package:scheduler_app/services/avatar_service.dart';

// ignore: must_be_immutable
class SignUpPage extends GetView<AuthService> {
  String? selectedValue;
  SignUpPage({super.key});

  final ImagePickController picker = Get.find();

  static const keys = (
    email: Key('EmailField'),
    submit: Key('SubmitButton'),
    password: Key('PasswordField'),
    name: Key('NameField'),
    rol: Key('RolField'),
    birthday: Key('BirthdayField'),
    phone: Key('PhoneField'),
    image: Key('ImageField'),
  );

  FormGroup buildForm() {
    return fb.group({
      'email': ['', Validators.required, Validators.email],
      'password': ['', Validators.required, Validators.minLength(8)],
      'name': ['', Validators.required],
      'rol': FormControl<String>(validators: [
        Validators.required,
      ]),
      'birthday': FormControl<DateTime>(validators: [
        Validators.required,
        Validators.max(DateTime.now()),
      ]),
      'phone': ['', Validators.required],
    });
  }

  static InputDecoration decoration(String label, {Icon? icon}) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(
          color: Color.fromARGB(255, 148, 125, 125), fontSize: 20),
      helperText: '',
      helperStyle: const TextStyle(height: 0.7),
      errorStyle: const TextStyle(height: 0.7),
      suffixIcon: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => picker.image = null);
    final separator = SizedBox(height: isDisplayDesktop(context) ? 16 : 8);

    return RequiresNoAuth(builder: (context) {
      return AppView(
        child: Scaffold(
          body: ReactiveFormBuilder(
            form: buildForm,
            builder: (context, form, child) {
              return Row(
                children: [
                  Expanded(child: AppImagePicker()),
                  Expanded(
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 500),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ReactiveDropdownField<String>(
                                  formControlName: 'rol',
                                  dropdownColor:
                                      const Color.fromARGB(255, 255, 3, 3),
                                  items: const [
                                    DropdownMenuItem(
                                      value: 'U1',
                                      child: Text(
                                        'Estudiante',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: 'U2',
                                      child: Text(
                                        'Profesor',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: 'U3',
                                      child: Text(
                                        'Coordinador',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: 'U4',
                                      child: Text(
                                        'Director',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: 'U5',
                                      child: Text(
                                        'Decano',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ],
                                  decoration: decoration('Rol'),
                                ),
                                separator,
                                ReactiveTextField<String>(
                                  key: keys.name,
                                  formControlName: 'name',
                                  textInputAction: TextInputAction.next,
                                  decoration: decoration('Nombres'),
                                  style: const TextStyle(color: Colors.black),
                                ),
                                separator,
                                ReactiveTextField<String>(
                                  key: keys.email,
                                  formControlName: 'email',
                                  textInputAction: TextInputAction.next,
                                  decoration: decoration('Correo'),
                                  style: const TextStyle(color: Colors.black),
                                ),
                                separator,
                                ReactiveTextField<String>(
                                  key: keys.password,
                                  formControlName: 'password',
                                  obscureText: true,
                                  textInputAction: TextInputAction.next,
                                  decoration: decoration('Contraseña'),
                                  style: const TextStyle(color: Colors.black),
                                ),
                                separator,
                                ReactiveDateTimePicker(
                                  key: keys.birthday,
                                  formControlName: 'birthday',
                                  decoration: decoration(
                                    'Fecha de Nacimiento',
                                    icon: const Icon(Icons.calendar_today),
                                  ),
                                  style: const TextStyle(color: Colors.black),
                                ),
                                separator,
                                ReactiveTextField<String>(
                                  key: keys.phone,
                                  formControlName: 'phone',
                                  textInputAction: TextInputAction.next,
                                  decoration: decoration('Teléfono'),
                                  style: const TextStyle(color: Colors.black),
                                ),
                                separator,
                                ElevatedButton(
                                  onPressed: () async {
                                    if (form.valid) {
                                      logInfo(form.value);
                                      final avatar = Get.find<AvatarService>();
                                      final url =
                                          await avatar.create(picker.image!);

                                      final user = BaseUser(
                                        form.control('email').value,
                                        form.control('name').value,
                                        form.control('birthday').value,
                                        form.control('phone').value,
                                        url,
                                      );
                                      await controller.signUp(
                                          user, form.control('password').value);
                                      Get.offAllNamed(Routes.meetings);
                                    } else {
                                      form.markAllAsTouched();
                                    }
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Color.fromARGB(255, 255, 3, 3)),
                                    padding: MaterialStateProperty.all(
                                        const EdgeInsets.all(15)),
                                    alignment: Alignment.center,
                                  ),
                                  child: const Text(
                                    'CREAR CUENTA',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontFamily: 'Arial',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      );
    });
  }
}

class ImagePickController extends GetxController {
  final Rxn<XFile> _image = Rxn();

  XFile? get image => _image.value;

  set image(XFile? value) => _image.value = value;
}
