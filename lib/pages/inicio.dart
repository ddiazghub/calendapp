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
    return RequiresNoAuth(
      builder: (context) {
        return AppView(
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (isDisplayDesktop(context)) {
                // En pantallas más grandes, mantén la posición original del botón
                return SingleChildScrollView(
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: Assets.background,
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        const Align(
                          alignment: Alignment.topCenter,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                ' ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Arial',
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                ' ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Arial',
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                '¡Bienvenidos!',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Arial',
                                  fontSize: 25,
                                ),
                              ),
                              Text(
                                'Agenda fácil y rápido con CalendApp',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Arial',
                                  fontSize: 25,
                                ),
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                        Positioned(
                          right: 150,
                          top: 20,
                          child: ElevatedButton(
                            onPressed: () => Get.toNamed(Routes.signup),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color.fromARGB(255, 255, 3, 3)),
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
                        ),
                        Positioned(
                          right: 25,
                          top: 20,
                          child: TextButton(
                            onPressed: () => Get.toNamed(Routes.login),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.transparent),
                              padding:
                                  MaterialStateProperty.all(const EdgeInsets.all(2)),
                              alignment: Alignment.center,
                            ),
                            child: const Text(
                              'Iniciar sesión',
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 3, 3),
                                fontSize: 18,
                                fontFamily: 'Arial',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
                        const SizedBox(height: 110),
                        const Text(
                          '¡Bienvenidos!',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Arial',
                            fontSize: 20,
                          ),
                        ),
                        const Text(
                          'Agenda fácil y rápido con CalendApp',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Arial',
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 270),
                        ElevatedButton(
                          onPressed: () => Get.toNamed(Routes.signup),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 255, 3, 3),
                            ),
                            padding:
                                MaterialStateProperty.all(const EdgeInsets.all(16)),
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
                        ElevatedButton(
                          onPressed: () => Get.toNamed(Routes.login),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.transparent),
                            padding:
                                MaterialStateProperty.all(const EdgeInsets.all(2)),
                            alignment: Alignment.center,
                          ),
                          child: const Text(
                            'Iniciar sesión',
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 3, 3),
                              fontSize: 18,
                              fontFamily: 'Arial',
                            ),
                          ),
                        ),
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
