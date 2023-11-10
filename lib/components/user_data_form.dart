import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loggy/loggy.dart';
import 'package:reactive_date_time_picker/reactive_date_time_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:scheduler_app/components/image_picker.dart';
import 'package:scheduler_app/components/page/page_view.dart';
import 'package:scheduler_app/models/user.dart';
import 'package:scheduler_app/routes.dart';
import 'package:scheduler_app/services/auth_service.dart';
import 'package:scheduler_app/services/avatar_service.dart';

class UserDataForm extends GetView<AuthService> {
  UserDataForm({super.key, this.user});

  final UserData? user;
  final ImagePickController picker = Get.find();

  static const roles = [
    'Estudiante',
    'Profesor',
    'Coordinador',
    'Director',
    'Decano',
  ];

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
      'email': [user?.email ?? '', Validators.required, Validators.email],
      if (user == null)
        'password': ['', Validators.required, Validators.minLength(8)],
      'name': [user?.name ?? '', Validators.required],
      'role': FormControl<String>(value: user?.role, validators: [
        Validators.required,
      ]),
      'birthday': FormControl<DateTime>(value: user?.birthday, validators: [
        Validators.required,
        Validators.max(DateTime.now()),
      ]),
      'phone': [user?.phone ?? '', Validators.required],
    });
  }

  static InputDecoration decoration(String label, {Icon? icon}) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.black, fontSize: 20),
      helperText: '',
      helperStyle: const TextStyle(height: 0.7),
      errorStyle: const TextStyle(height: 0.7),
      suffixIcon: icon,
    );
  }

  Widget userDataForm(context, form, child) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      picker.reset();
    });

    return Row(
      children: [
        Expanded(child: AppImagePicker(defaultImage: user?.image)),
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
                        formControlName: 'role',
                        dropdownColor: const Color.fromARGB(
                          255,
                          255,
                          3,
                          3,
                        ),
                        items: [
                          for (final role in roles)
                            DropdownMenuItem(
                              value: role,
                              child: Text(
                                role,
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                        ],
                        decoration: decoration('Rol'),
                        style: const TextStyle(color: Colors.black),
                      ),
                      ReactiveTextField<String>(
                        key: keys.name,
                        formControlName: 'name',
                        textInputAction: TextInputAction.next,
                        decoration: decoration('Nombres'),
                        style: const TextStyle(color: Colors.black),
                      ),
                      ReactiveTextField<String>(
                        key: keys.email,
                        formControlName: 'email',
                        textInputAction: TextInputAction.next,
                        decoration: decoration('Correo'),
                        style: const TextStyle(color: Colors.black),
                      ),
                      if (user == null)
                        ReactiveTextField<String>(
                          key: keys.password,
                          formControlName: 'password',
                          obscureText: true,
                          textInputAction: TextInputAction.next,
                          decoration: decoration('Contraseña'),
                          style: const TextStyle(color: Colors.black),
                        ),
                      ReactiveDateTimePicker(
                        key: keys.birthday,
                        formControlName: 'birthday',
                        locale: const Locale('es'),
                        decoration: decoration(
                          'Fecha de Nacimiento',
                          icon: const Icon(Icons.calendar_today),
                        ),
                        style: const TextStyle(color: Colors.black),
                      ),
                      ReactiveTextField<String>(
                        key: keys.phone,
                        formControlName: 'phone',
                        textInputAction: TextInputAction.next,
                        decoration: decoration('Teléfono'),
                        style: const TextStyle(color: Colors.black),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () async {
                          if (form.valid) {
                            logInfo(form.value);
                            final avatar = Get.find<AvatarService>();

                            final url = picker.image != null
                                ? await avatar.create(picker.image!)
                                : this.user?.image ??
                                    AvatarService.defaultAvatar;

                            final user = BaseUser(
                              form.control('email').value,
                              form.control('name').value,
                              form.control('birthday').value,
                              form.control('phone').value,
                              url,
                              form.control('role').value,
                            );

                            try {
                              if (this.user != null) {
                                UserRef.doc(this.user!.id).update(
                                  name: user.name,
                                  email: user.email,
                                  birthday: user.birthday,
                                  phone: user.phone,
                                  role: user.role,
                                  image: url,
                                );

                                Get.offNamed(Routes.meetings);
                              } else {
                                await controller.signUp(
                                  user,
                                  form.control('password').value,
                                );

                                Get.offAllNamed(Routes.meetings);
                              }
                            } catch (err) {
                              Get.snackbar(
                                'Error',
                                'Ha ocurrido un error: $err',
                                snackPosition: SnackPosition.BOTTOM,
                                borderColor: Colors.black,
                                borderWidth: 3,
                                backgroundColor: Colors.red,
                              );
                            }
                          } else {
                            form.markAllAsTouched();
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 255, 3, 3),
                          ),
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.all(15),
                          ),
                          alignment: Alignment.center,
                        ),
                        child: Text(
                          user == null ? 'CREAR CUENTA' : 'EDITAR CUENTA',
                          style: const TextStyle(
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
  }

  @override
  Widget build(BuildContext context) {
    return AppView(
      title: user == null ? 'Crear usuario' : 'Editar perfil',
      currentTab: user == null ? null : NavigationTab.profile,
      child: Scaffold(
        body: ReactiveFormBuilder(
          form: buildForm,
          builder: userDataForm,
        ),
      ),
    );
  }
}

class ImagePickController extends GetxController {
  final Rxn<XFile> _image = Rxn();

  XFile? get image => _image.value;

  set image(XFile? value) => _image.value = value;

  void reset() => image = null;
}
