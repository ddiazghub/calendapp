import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:scheduler_app/helpers.dart';
import 'package:scheduler_app/models/user.dart';
import 'package:scheduler_app/pages/chat_page.dart';
import 'package:scheduler_app/services/auth_service.dart';

class SignUp extends GetView<AuthService> {
  const SignUp({super.key});

  static const keys = (
    email: Key("EmailField"),
    submit: Key("SubmitButton"),
    password: Key("PasswordField"),
    name: Key("NameField"),
    birthday: Key("BirthdayField"),
    phone: Key("PhoneField"),
    image: Key("ImageField"),
  );

  static final defaults = (
    email: "user@email.com",
    password: "0123456789",
    name: "user",
    birthday: DateTime(2000),
    phone: "+57 3004564532",
    image:
        "https://th.bing.com/th/id/R.01da0902c89677030d1b4653bd4a1351?rik=NuG6S0lHm51WxQ&riu=http%3a%2f%2fwww.pngall.com%2fwp-content%2fuploads%2f5%2fUser-Profile-PNG-Free-Image.png&ehk=0ER186lOvX51zPC0dwi85VKFnvFXEjj%2fvWxVS0bOqbk%3d&risl=&pid=ImgRaw&r=0"
  );

  FormGroup buildForm() {
    return fb.group({
      'email': [defaults.email, Validators.required, Validators.email],
      'password': [defaults.email, Validators.required, Validators.minLength(8)],
      'name': [defaults.name, Validators.required],
      'birthday': [defaults.birthday, Validators.required],
      'phone': [defaults.phone, Validators.required],
      'image': [defaults.image, Validators.required, FormValidators.url],
    });
  }

  static InputDecoration decoration(String label) {
    return InputDecoration(
      labelText: label,
      helperText: '',
      helperStyle: const TextStyle(height: 0.7),
      errorStyle: const TextStyle(height: 0.7),
    );
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
                  key: keys.name,
                  formControlName: 'name',
                  textInputAction: TextInputAction.next,
                  decoration: decoration("name"),
                ),
                const SizedBox(height: 16.0),
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
                  textInputAction: TextInputAction.next,
                  decoration: decoration("Password"),
                ),
                const SizedBox(height: 16.0),
                ReactiveTextField<DateTime>(
                  key: keys.birthday,
                  formControlName: 'birthday',
                  textInputAction: TextInputAction.next,
                  decoration: decoration("birthday"),
                ),
                const SizedBox(height: 16.0),
                ReactiveTextField<String>(
                  key: keys.phone,
                  formControlName: 'phone',
                  textInputAction: TextInputAction.next,
                  decoration: decoration("phone"),
                ),
                const SizedBox(height: 16.0),
                ReactiveTextField<String>(
                  key: keys.image,
                  formControlName: 'image',
                  textInputAction: TextInputAction.done,
                  decoration: decoration("image"),
                ),
                ElevatedButton(
                  key: keys.submit,
                  onPressed: () async {
                    if (form.valid) {
                      logInfo(form.value);
                      final user = BaseUser(
                        form.control("email").value,
                        form.control("name").value,
                        form.control("birthday").value,
                        form.control("phone").value,
                        form.control("image").value,
                      );

                      await controller.signUp(user, form.control("password").value);
                      Get.to(ChatPage());
                    } else {
                      form.markAllAsTouched();
                    }
                  },
                  child: const Text('Submit'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
