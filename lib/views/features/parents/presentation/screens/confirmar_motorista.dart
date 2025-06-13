import 'package:e_mobi/pallete_colors.dart';
import 'package:e_mobi/views/features/parents/presentation/screens/confirmar_corrida.dart';
import 'package:e_mobi/views/features/parents/presentation/widgets/custom_text.dart';
import 'package:e_mobi/widgets/button_custom_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConfirmarMotorista extends StatelessWidget {
  const ConfirmarMotorista({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PalleteColors.white,
      appBar: AppBar(
        backgroundColor: PalleteColors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView(
          children: [
            const Center(
              child: Text(
                "Informações do motorista",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: PalleteColors.primaryColor,
                ),
              ),
            ),
            const SizedBox(height: 70),
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Positioned(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    height: 600,
                    decoration: BoxDecoration(
                      color: PalleteColors.primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 80),
                          const Center(
                            child: CustomText(
                              text: "Marcos de Souza Filho",
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 15),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: "marcos@gmail.com",
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          const SizedBox(height: 2),
                          const CustomText(
                            text: "Cpf: 48*****4",
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 2),
                          const CustomText(
                            text: "Data de nascimento: 29/02/1992",
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 2),
                          const CustomText(
                            text: "Telefone: (16) 99191-0000",
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 25),
                          const Divider(),
                          const SizedBox(height: 10),
                          const Center(
                            child: CustomText(
                              text: "Informações do veículo",
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Center(
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const CircleAvatar(
                                backgroundImage:
                                    AssetImage("assets/images/vam.jpeg"),
                                radius: 50,
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          const Center(
                            child: CustomText(
                              text: "Mercedes-Benz Sprinter",
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 15),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: "Ano do veículo",
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          const SizedBox(height: 2),
                          const CustomText(
                            text: "Número de lugares: 4",
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 2),
                          const CustomText(
                            text: "Matricula: FG-FK-34",
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 2),
                          const CustomText(
                            text: "Marca: Mercedes",
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 2),
                          const CustomText(
                            text: "Modelo: Sprinter",
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: -40,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const CircleAvatar(
                      backgroundImage: AssetImage("assets/images/avatar.jpg"),
                      radius: 50,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 150,
                    child: ButtonCustom(
                      icon: Icons.arrow_back,
                      backgroundColor: PalleteColors.accentColor,
                      height: 30,
                      fontSize: 11,
                      textColor: Colors.white,
                      marginLeftIcon: 0,
                      onPressed: () {},
                      text: "Voltar".toUpperCase(),
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    child: ButtonCustom(
                      icon: Icons.check,
                      backgroundColor: PalleteColors.green,
                      height: 30,
                      fontSize: 11,
                      textColor: Colors.white,
                      marginLeftIcon: 0,
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (_) => const ConfirmarCorrida(),
                          ),
                        );
                      },
                      text: "Aceitar".toUpperCase(),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
