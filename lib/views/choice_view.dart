import 'package:e_mobi/core/navigation/navigation_service.dart';
import 'package:e_mobi/views/features/authentication/presenentation/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:toastification/toastification.dart';

import '../pallete_colors.dart';
import '../widgets/button_custom_widget.dart';

enum Choice { motorista, responsavel, nenhuma }

class ChoiceView extends StatefulWidget {
  const ChoiceView({super.key, this.isLoginPage = true});
  final bool isLoginPage;
  @override
  State<ChoiceView> createState() => _ChoiceViewState();
}

class _ChoiceViewState extends State<ChoiceView> {
  Choice choice = Choice.nenhuma;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo_icon_transparent.png",
              width: 89,
              height: 80,
            ),
            const SizedBox(height: 30),
            Text(
              "Escolha uma Opção",
              style: TextStyle(
                color: PalleteColors.accentColor,
                fontWeight: FontWeight.w800,
                fontSize: 16.sp,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          choice = Choice.motorista;
                        });
                      },
                      child: Container(
                          height: 190,
                          width: 160,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: choice == Choice.motorista
                                ? PalleteColors.accentColor
                                : PalleteColors.primaryColor,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/motorista.png",
                                width: 89,
                                height: 80,
                              ),
                            ],
                          )),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Motorista".toUpperCase(),
                      style: TextStyle(
                        fontSize: 10.sp,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            choice = Choice.responsavel;
                          });
                        },
                        child: Container(
                            height: 190,
                            width: 160,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: choice == Choice.responsavel
                                  ? PalleteColors.accentColor
                                  : PalleteColors.primaryColor,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/pai.png",
                                  width: 80,
                                  height: 80,
                                ),
                              ],
                            )),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "Pais/Responsável".toUpperCase(),
                        style: TextStyle(
                          fontSize: 10.sp,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 40),
            ButtonCustom(
              backgroundColor: PalleteColors.primaryColor,
              size: const Size(40, 30),
              textColor: Colors.white,
              iconRigth: Icons.arrow_forward,
              height: 40,
              onPressed: () {
                switch (choice) {
                  case Choice.nenhuma:
                    toastification.show(
                      title: const Text("Escolha uma opção"),
                      style: ToastificationStyle.fillColored,
                      autoCloseDuration: const Duration(seconds: 3),
                      type: ToastificationType.info,
                    );
                    break;
                  case Choice.motorista:
                    NavigationService.push(
                      context: context,
                      page: const LoginPage(
                        choice: Choice.motorista,
                      ),
                    );
                    break;
                  case Choice.responsavel:
                    NavigationService.push(
                      context: context,
                      page: const LoginPage(
                        choice: Choice.responsavel,
                      ),
                    );
                    break;
                  default:
                }
              },
              text: "Avançar",
            ),
          ],
        ),
      ),
    );
  }

  ScaffoldFeatureController customSnackBar(
      {required String message, required IconData icon}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: PalleteColors.accentColor,
        content: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            const SizedBox(width: 10),
            Text(
              message,
              style: TextStyle(color: Colors.white, fontSize: 14.sp),
            )
          ],
        ),
      ),
    );
  }
}
