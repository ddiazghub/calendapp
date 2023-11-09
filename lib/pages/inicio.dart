import 'package:flutter/material.dart';
import 'package:scheduler_app/assets.dart';
import 'package:scheduler_app/components/auth_redirects.dart';
import 'package:scheduler_app/components/page/page_view.dart';
import 'package:scheduler_app/layout/adaptative.dart';
import 'package:scheduler_app/routes.dart';
import 'package:get/get.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    const text = [
      Text(
        '¡Bienvenidos!',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontFamily: 'Arial',
          fontSize: 25,
        ),
      ),
      Text(
        'Agenda fácil y rápido con CalendApp',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontFamily: 'Arial',
          fontSize: 25,
        ),
      ),
    ];

    final buttons = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () => Get.toNamed(Routes.login),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              const Color.fromARGB(255, 255, 3, 3),
            ),
            padding: MaterialStateProperty.all(
              const EdgeInsets.all(15),
            ),
            alignment: Alignment.center,
          ),
          child: const Text(
            'Iniciar sesión',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'Arial',
            ),
          ),
        ),
        const SizedBox(width: 20),
        ElevatedButton(
          onPressed: () => Get.toNamed(Routes.signup),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              Colors.white,
            ),
            shape: MaterialStateProperty.all(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
                side: BorderSide(color: Colors.red, width: 1),
              ),
            ),
            padding: MaterialStateProperty.all(
              const EdgeInsets.all(15),
            ),
            alignment: Alignment.center,
          ),
          child: const Text(
            'Crear cuenta',
            style: TextStyle(
              color: Colors.red,
              fontSize: 18,
              fontFamily: 'Arial',
            ),
          ),
        ),
      ],
    );

    return RequiresNoAuth(
      builder: (context) {
        return AppView(
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (isDisplayDesktop(context)) {
                // En pantallas más grandes, mantén la posición original del botón
                return Container(
                  padding: const EdgeInsets.only(top: 50),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: Assets.background,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  child: Column(
                    children: [
                      ...text,
                      const SizedBox(height: 30),
                      buttons,
                    ],
                  ),
                );
              } else {
                // En pantallas más pequeñas, reorganiza los elementos
                return SingleChildScrollView(
                  child: Container(
                    width: 1000,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: Assets.backgroundVertical,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 80),
                        ...text,
                        const SizedBox(height: 270),
                        buttons,
                      ],
                    ),
                  ),
                );
              }
            },
          ),
        );
      },
    );
  }
}
